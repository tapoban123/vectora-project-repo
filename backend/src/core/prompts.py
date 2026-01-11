IMAGE_DESCRIPTION_PROMPT: str = """
Analyze the image and generate a retrieval-optimized semantic description.

Rules:
1. Do NOT use labels like "SECTION", headings, or bullet titles.
2. Write short, declarative phrases separated by newlines.
3. No filler text, no introductions, no conclusions.
4. Focus on concepts, entities, actions, and attributes useful for search.
5. Do not speculate beyond what is visible.

Output format (strict order, one line each):
1. Image type
2. Domain or context
3. Primary user action or purpose
4. Main visible elements
5. Visible text
6. Visual attributes and states
7. Keywords (comma-separated)

Follow the order exactly. Do not repeat field names.
"""
