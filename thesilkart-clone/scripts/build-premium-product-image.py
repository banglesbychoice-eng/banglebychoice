from __future__ import annotations

import argparse
import io
import json
from pathlib import Path

import cv2
import numpy as np
from PIL import Image, ImageEnhance, ImageFilter, ImageFont, ImageOps, ImageStat
from PIL import ImageDraw
from rembg import new_session, remove


CANVAS = 1600
FOOTER_TOP = 1470
IVORY = (250, 249, 246, 255)
WATERMARK = "www.banglebychoice.in | 9553655562"
MODERN_WATERMARK = "Bangle by Choice · www.banglebychoice.in"
FONT_PATH = Path("C:/Windows/Fonts/arial.ttf")
SUPERRES_MODEL = Path(__file__).resolve().parents[1] / ".cache/superres/FSRCNN_x4.pb"


def alpha_bbox(image: Image.Image) -> tuple[int, int, int, int]:
    alpha = image.getchannel("A")
    bbox = alpha.point(lambda value: 255 if value >= 18 else 0).getbbox()
    if bbox is None:
        raise ValueError("Background removal produced an empty cutout")
    left, top, right, bottom = bbox
    padding = max(8, round(max(right - left, bottom - top) * 0.02))
    return (
        max(0, left - padding),
        max(0, top - padding),
        min(image.width, right + padding),
        min(image.height, bottom + padding),
    )


def remove_small_fragments(cutout: Image.Image) -> Image.Image:
    alpha = np.asarray(cutout.getchannel("A"))
    binary = (alpha >= 18).astype(np.uint8)
    count, labels, stats, _ = cv2.connectedComponentsWithStats(binary, connectivity=8)
    if count <= 2:
        return cutout
    areas = stats[1:, cv2.CC_STAT_AREA]
    largest = int(areas.max())
    keep = np.zeros(binary.shape, dtype=np.uint8)
    for label, area in enumerate(areas, start=1):
        if area >= max(16, largest * 0.04):
            keep[labels == label] = 1
    keep = cv2.dilate(keep, np.ones((5, 5), np.uint8), iterations=1)
    cleaned = cutout.copy()
    cleaned.putalpha(Image.fromarray((alpha * keep).astype(np.uint8)))
    return cleaned


def suppress_translucent_background(cutout: Image.Image) -> Image.Image:
    alpha = np.asarray(cutout.getchannel("A"), dtype=np.float32)
    alpha = np.clip((alpha - 70.0) * (255.0 / 145.0), 0, 255).astype(np.uint8)
    cleaned = cutout.copy()
    cleaned.putalpha(Image.fromarray(alpha))
    return cleaned


def restore_gold_product_alpha(cutout: Image.Image, original: Image.Image) -> Image.Image:
    rgb = np.asarray(original.convert("RGB"))
    hsv = cv2.cvtColor(rgb, cv2.COLOR_RGB2HSV)
    hue, saturation, value = cv2.split(hsv)
    gold = (
        (hue >= 3)
        & (hue <= 38)
        & (saturation >= 45)
        & (value >= 70)
        & (rgb[:, :, 0].astype(np.int16) - rgb[:, :, 2].astype(np.int16) >= 20)
        & (rgb[:, :, 1].astype(np.int16) - rgb[:, :, 2].astype(np.int16) >= 4)
    ).astype(np.uint8)
    count, labels, stats, _ = cv2.connectedComponentsWithStats(gold, connectivity=8)
    filtered = np.zeros_like(gold)
    for label in range(1, count):
        area = stats[label, cv2.CC_STAT_AREA]
        width = stats[label, cv2.CC_STAT_WIDTH]
        height = stats[label, cv2.CC_STAT_HEIGHT]
        if 5 <= area <= 12000 and width <= 320 and height <= 320:
            filtered[labels == label] = 1
    gold = filtered
    gold = cv2.morphologyEx(gold, cv2.MORPH_CLOSE, np.ones((5, 5), np.uint8), iterations=1)
    gold = cv2.dilate(gold, np.ones((5, 5), np.uint8), iterations=1)

    original_alpha = np.asarray(cutout.getchannel("A"))
    support = cv2.dilate((original_alpha >= 3).astype(np.uint8), np.ones((9, 9), np.uint8), iterations=1)
    gold &= support
    gold = cv2.morphologyEx(gold, cv2.MORPH_CLOSE, np.ones((7, 7), np.uint8), iterations=1)
    gold_alpha = cv2.GaussianBlur(gold.astype(np.float32) * 255.0, (0, 0), 1.1)
    alpha = gold_alpha.astype(np.uint8)
    restored = cutout.copy()
    restored.putalpha(Image.fromarray(alpha))
    return restored


def super_resolve(cutout: Image.Image, superres) -> Image.Image:
    if max(cutout.size) >= 760:
        return cutout
    background = Image.new("RGB", cutout.size, (250, 249, 246))
    background.paste(cutout.convert("RGB"), mask=cutout.getchannel("A"))
    bgr = cv2.cvtColor(np.asarray(background), cv2.COLOR_RGB2BGR)
    enhanced = cv2.cvtColor(superres.upsample(bgr), cv2.COLOR_BGR2RGB)
    result = Image.fromarray(enhanced).convert("RGBA")
    result.putalpha(
        cutout.getchannel("A").resize(result.size, Image.Resampling.LANCZOS)
    )
    return result


def fit_subject(
    cutout: Image.Image,
    original: Image.Image,
    superres,
    segmentation: str = "standard",
    modern_branding: bool = False,
) -> Image.Image:
    if segmentation == "gold":
        cutout = restore_gold_product_alpha(cutout, original)
    cutout = remove_small_fragments(cutout)
    if segmentation != "gold":
        cutout = suppress_translucent_background(cutout)
    cutout = cutout.crop(alpha_bbox(cutout))
    small_source = max(cutout.size) < 760
    cutout = super_resolve(cutout, superres)
    if modern_branding:
        max_width = 1180 if small_source else 1300
        max_height = 1120 if small_source else 1240
    else:
        max_width = 900 if small_source else 1100
        max_height = 860 if small_source else 1030
    ratio = min(max_width / cutout.width, max_height / cutout.height)
    size = (max(1, round(cutout.width * ratio)), max(1, round(cutout.height * ratio)))
    cutout = cutout.resize(size, Image.Resampling.LANCZOS)

    rgb = cutout.convert("RGB")
    rgb = ImageEnhance.Contrast(rgb).enhance(1.025)
    rgb = ImageEnhance.Sharpness(rgb).enhance(1.14)
    rgb.putalpha(cutout.getchannel("A"))
    return rgb


def add_shadow(canvas: Image.Image, cutout: Image.Image, x: int, y: int) -> None:
    alpha = cutout.getchannel("A")
    shadow_alpha = alpha.filter(ImageFilter.GaussianBlur(16)).point(lambda value: round(value * 0.09))
    shadow = Image.new("RGBA", cutout.size, (35, 31, 25, 0))
    shadow.putalpha(shadow_alpha)
    canvas.alpha_composite(shadow, (x + 8, y + 16))


def add_watermark(canvas: Image.Image) -> None:
    font = ImageFont.truetype(str(FONT_PATH), 50)
    strip = Image.new("RGBA", (2050, 130), (255, 255, 255, 0))
    draw = ImageDraw.Draw(strip)
    box = draw.textbbox((0, 0), WATERMARK, font=font)
    text_width = box[2] - box[0]
    draw.text(
        ((strip.width - text_width) / 2, 31),
        WATERMARK,
        font=font,
        fill=(42, 42, 42, 112),
        stroke_width=1,
        stroke_fill=(255, 255, 255, 66),
    )
    diagonal = strip.rotate(35, resample=Image.Resampling.BICUBIC, expand=True)
    canvas.alpha_composite(
        diagonal,
        ((CANVAS - diagonal.width) // 2, 690 - diagonal.height // 2),
    )


def add_footer(canvas: Image.Image) -> None:
    draw = ImageDraw.Draw(canvas)
    draw.line((150, FOOTER_TOP, CANVAS - 150, FOOTER_TOP), fill=(194, 188, 178, 150), width=2)
    font = ImageFont.truetype(str(FONT_PATH), 42)
    box = draw.textbbox((0, 0), WATERMARK, font=font)
    text_width = box[2] - box[0]
    draw.text(
        ((CANVAS - text_width) / 2, 1506),
        WATERMARK,
        font=font,
        fill=(66, 63, 58, 220),
    )


def add_modern_watermark(canvas: Image.Image) -> None:
    font = ImageFont.truetype(str(FONT_PATH), 48)
    strip = Image.new("RGBA", (2100, 120), (255, 255, 255, 0))
    draw = ImageDraw.Draw(strip)
    box = draw.textbbox((0, 0), MODERN_WATERMARK, font=font)
    text_width = box[2] - box[0]
    draw.text(
        ((strip.width - text_width) / 2, 28),
        MODERN_WATERMARK,
        font=font,
        fill=(126, 18, 55, 48),
        stroke_width=1,
        stroke_fill=(255, 255, 255, 54),
    )
    diagonal = strip.rotate(32, resample=Image.Resampling.BICUBIC, expand=True)
    canvas.alpha_composite(
        diagonal,
        ((CANVAS - diagonal.width) // 2, (CANVAS - diagonal.height) // 2),
    )


def process(
    source: Path,
    destination: Path,
    session,
    superres,
    segmentation: str = "standard",
    modern_branding: bool = False,
) -> dict[str, object]:
    original = ImageOps.exif_transpose(Image.open(source)).convert("RGB")
    buffer = io.BytesIO()
    original.save(buffer, format="PNG")
    cutout = Image.open(io.BytesIO(remove(buffer.getvalue(), session=session))).convert("RGBA")
    cutout = fit_subject(cutout, original, superres, segmentation, modern_branding)

    canvas = Image.new("RGBA", (CANVAS, CANVAS), IVORY)
    x = (CANVAS - cutout.width) // 2
    y = (CANVAS - cutout.height) // 2 if modern_branding else 76 + (1320 - cutout.height) // 2
    add_shadow(canvas, cutout, x, y)
    canvas.alpha_composite(cutout, (x, y))
    if modern_branding:
        add_modern_watermark(canvas)
    else:
        add_watermark(canvas)
        add_footer(canvas)

    destination.parent.mkdir(parents=True, exist_ok=True)
    canvas.convert("RGB").save(destination, format="WEBP", quality=94, method=6)
    alpha = cutout.getchannel("A")
    coverage = ImageStat.Stat(alpha).mean[0] / 255
    return {
        "source": str(source),
        "destination": str(destination),
        "subjectWidth": cutout.width,
        "subjectHeight": cutout.height,
        "alphaCoverage": round(coverage, 4),
    }


def process_prepared(source: Path, destination: Path) -> dict[str, object]:
    """Finalize an already restored studio image without segmenting it again."""
    prepared = ImageOps.exif_transpose(Image.open(source)).convert("RGB")
    prepared.thumbnail((1450, 1380), Image.Resampling.LANCZOS)

    canvas = Image.new("RGBA", (CANVAS, CANVAS), IVORY)
    x = (CANVAS - prepared.width) // 2
    y = max(20, (FOOTER_TOP - prepared.height) // 2)
    canvas.paste(prepared, (x, y))
    add_watermark(canvas)
    add_footer(canvas)

    destination.parent.mkdir(parents=True, exist_ok=True)
    canvas.convert("RGB").save(destination, format="WEBP", quality=94, method=6)
    return {
        "source": str(source),
        "destination": str(destination),
        "subjectWidth": prepared.width,
        "subjectHeight": prepared.height,
        "prepared": True,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", nargs="?", type=Path)
    parser.add_argument("destination", nargs="?", type=Path)
    parser.add_argument("--manifest", type=Path)
    parser.add_argument("--source-root", type=Path)
    parser.add_argument("--output-root", type=Path)
    parser.add_argument("--report", type=Path)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--prepared", action="store_true")
    parser.add_argument("--modern-branding", action="store_true")
    parser.add_argument("--segmentation", default="standard", choices=("standard", "gold"))
    parser.add_argument("--model", default="isnet-general-use")
    args = parser.parse_args()
    session = None
    superres = None
    if not args.prepared:
        session = new_session(args.model)
        superres = cv2.dnn_superres.DnnSuperResImpl_create()
        superres.readModel(str(SUPERRES_MODEL))
        superres.setModel("fsrcnn", 4)
    if args.manifest:
        if not args.source_root or not args.output_root:
            parser.error("--manifest requires --source-root and --output-root")
        products = json.loads(args.manifest.read_text(encoding="utf-8"))
        results = []
        errors = []
        for position, product in enumerate(products, start=1):
            source = args.source_root / product["sourceFile"]
            destination = args.output_root / f'{product["slug"]}-premium.webp'
            try:
                if args.resume and destination.exists():
                    result = {"source": str(source), "destination": str(destination), "skipped": True}
                else:
                    result = process(
                        source,
                        destination,
                        session,
                        superres,
                        product.get("segmentation", "standard"),
                        args.modern_branding,
                    )
                product["imagePath"] = f'images/new-products-2026-07-19/{destination.name}'
                results.append({"sourceIndex": product["sourceIndex"], **result})
                print(f'[{position:03}/{len(products):03}] OK {product["name"]}', flush=True)
            except Exception as error:
                errors.append({"sourceIndex": product["sourceIndex"], "name": product["name"], "error": str(error)})
                print(f'[{position:03}/{len(products):03}] ERROR {product["name"]}: {error}', flush=True)
        args.manifest.write_text(f"{json.dumps(products, indent=2)}\n", encoding="utf-8")
        report_path = args.report or args.manifest.with_name("new-products-2026-07-19-image-report.json")
        report_path.write_text(
            f"{json.dumps({'processed': len(results), 'errors': errors, 'results': results}, indent=2)}\n",
            encoding="utf-8",
        )
        print(json.dumps({"processed": len(results), "errors": len(errors), "report": str(report_path)}), flush=True)
        if errors:
            raise SystemExit(1)
    else:
        if not args.source or not args.destination:
            parser.error("source and destination are required without --manifest")
        if args.prepared:
            print(process_prepared(args.source, args.destination))
        else:
            print(process(args.source, args.destination, session, superres, args.segmentation, args.modern_branding))


if __name__ == "__main__":
    main()
