import fitz
from pymupdf import Document


class PdfDataAndEmbeddingHelper:
    """Open a PDF document in memory and extract the texts from each page.
    Returns a string combined of the texts from each page of the PDF document."""
    def __init__(self, pdf_contents: bytes):
        self.contents: bytes = pdf_contents
        self.doc: Document = fitz.open(stream=self.contents, filetype="pdf")

    def extract_text(self):
        """Extract texts from each page."""
        text = ""
        for page in self.doc:
            text += page.get_text()

        return text

    def extract_images(self):
        """Extract images from each page."""
        image_list = []
        for page in self.doc:
            image_list = page.get_images(full=True)

        return f"Found {len(image_list)} images."
