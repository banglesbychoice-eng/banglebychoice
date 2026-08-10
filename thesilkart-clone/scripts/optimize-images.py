from pathlib import Path
import json
from PIL import Image, ImageOps

ROOT = Path(__file__).resolve().parents[1]
IMAGE_ROOT = ROOT / "public" / "images"
SOURCE_SUFFIXES = {".jpg", ".jpeg", ".png"}


def convert_image(source: Path) -> Path:
    destination = source.with_suffix(".webp")
    with Image.open(source) as opened:
        image = ImageOps.exif_transpose(opened)
        if image.mode not in {"RGB", "RGBA"}:
            image = image.convert("RGBA" if "transparency" in image.info else "RGB")
        image.save(destination, "WEBP", quality=82, method=6, lossless=image.mode == "RGBA")
    source.unlink()
    return destination


def update_product_catalog(replacements: dict[str, str]) -> None:
    catalog_path = ROOT / "data" / "products.json"
    catalog = json.loads(catalog_path.read_text(encoding="utf-8"))
    for product in catalog["products"]:
        product["images"] = [replacements.get(image.replace("\\", "/"), image.replace("\\", "/")) for image in product["images"]]
    catalog_path.write_text(json.dumps(catalog, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def update_text_references(replacements: dict[str, str]) -> None:
    paths = [ROOT / "scripts" / "seed.sql"]
    paths.extend((ROOT / "app").rglob("*.js"))
    paths.extend((ROOT / "components").rglob("*.js"))
    paths.extend((ROOT / "components").rglob("*.css"))
    for path in paths:
        text = path.read_text(encoding="utf-8")
        updated = text
        for old, new in replacements.items():
            updated = updated.replace(f"/{old}", f"/{new}").replace(old, new)
        if updated != text:
            path.write_text(updated, encoding="utf-8")


def main() -> None:
    replacements = {}
    before = 0
    after = 0
    for source in sorted(IMAGE_ROOT.rglob("*")):
        if not source.is_file() or source.suffix.lower() not in SOURCE_SUFFIXES:
            continue
        before += source.stat().st_size
        old = source.relative_to(ROOT / "public").as_posix()
        destination = convert_image(source)
        new = destination.relative_to(ROOT / "public").as_posix()
        replacements[old] = new
        after += destination.stat().st_size

    update_product_catalog(replacements)
    update_text_references(replacements)
    saved = before - after
    print(f"Converted {len(replacements)} images to WebP; saved {saved / 1024 / 1024:.1f} MB.")


if __name__ == "__main__":
    main()
