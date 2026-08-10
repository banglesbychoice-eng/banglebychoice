from pathlib import Path
from PIL import Image, ImageDraw, ImageFont


ROOT = Path(__file__).resolve().parents[1] / "public" / "images"
FONT_PATH = Path("C:/Windows/Fonts/segoeuib.ttf")
BRAND_TEXT = "www.banglebychoice.in   •   +91 95536 55562"
SUPPORTED = {".jpg", ".jpeg", ".png", ".webp"}


def make_ribbon(width: int, height: int) -> Image.Image:
    diagonal = int((width * width + height * height) ** 0.5 * 1.18)
    ribbon_height = max(54, int(min(width, height) * 0.115))
    font_size = max(18, int(ribbon_height * 0.31))
    font = ImageFont.truetype(str(FONT_PATH), font_size)
    ribbon = Image.new("RGBA", (diagonal, ribbon_height), (103, 18, 52, 255))
    draw = ImageDraw.Draw(ribbon)
    box = draw.textbbox((0, 0), BRAND_TEXT, font=font)
    text_width = box[2] - box[0]
    text_height = box[3] - box[1]
    draw.text(
        ((diagonal - text_width) / 2, (ribbon_height - text_height) / 2 - box[1]),
        BRAND_TEXT,
        fill=(255, 246, 224, 255),
        font=font,
    )
    return ribbon.rotate(45, expand=True, resample=Image.Resampling.BICUBIC)


def rebrand(path: Path) -> None:
    with Image.open(path) as source:
        image = source.convert("RGBA")
        ribbon = make_ribbon(*image.size)
        position = ((image.width - ribbon.width) // 2, (image.height - ribbon.height) // 2)
        image.alpha_composite(ribbon, position)
        suffix = path.suffix.lower()
        if suffix in {".jpg", ".jpeg"}:
            image.convert("RGB").save(path, quality=92, optimize=True)
        elif suffix == ".webp":
            image.save(path, quality=92, method=6)
        else:
            image.save(path, optimize=True)


def main() -> None:
    images = [
        path
        for path in ROOT.rglob("*")
        if path.is_file() and path.suffix.lower() in SUPPORTED and "generated" not in path.parts
    ]
    for index, path in enumerate(images, start=1):
        rebrand(path)
        if index % 100 == 0 or index == len(images):
            print(f"Rebranded {index}/{len(images)} images")


if __name__ == "__main__":
    main()
