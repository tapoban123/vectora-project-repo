import re
import time


# def normalise_image_to_jpg(image_bytes: bytes) -> str:
#     img = Image.open(BytesIO(image_bytes))
#     if img.mode == "RGB":
#         img = img.convert("RGB")
#
#     buffer = BytesIO()
#     img.save(buffer, format="JPEG")
#     return base64.b64decode(buffer.getvalue()).decode("utf-8")

def get_current_time_milliseconds_epoch():
    return int(time.time() * 1000)


def clean_content_text(text: str) -> str:
    # Remove Markdown bold, italics, code ticks
    text = re.sub(r"[*_`]+", "", text)

    # Remove bullet points like *, -, • and numbered lists (1., 2.)
    text = re.sub(r"^\s*[\-*•]\s*", "", text, flags=re.MULTILINE)
    text = re.sub(r"^\s*\d+\.\s*", "", text, flags=re.MULTILINE)

    # Remove parenthetical UI hints like (Top), (Bottom), etc.
    text = re.sub(r"\([^)]*\)", "", text)

    # Replace newlines and multiple spaces with single space
    text = re.sub(r"\s+", " ", text)

    # Remove stray spaces before punctuation
    text = re.sub(r"\s+([.,!?])", r"\1", text)

    return text.strip()
