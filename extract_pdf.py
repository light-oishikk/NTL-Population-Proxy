import PyPDF2
import sys

def extract_pdf_text(path):
    with open(path, 'rb') as f:
        reader = PyPDF2.PdfReader(f)
        text = ""
        for i, page in enumerate(reader.pages):
            text += f"\n--- PAGE {i+1} ---\n"
            text += page.extract_text() or "[No text extracted]"
    return text

# Extract the final READ THIS paper
final_path = r"c:\Users\ok790\OneDrive\Desktop\remote\Research Paper\RESEARCH PAPER FINAL [ READ THIS ].pdf"
text = extract_pdf_text(final_path)
with open(r"c:\Users\ok790\OneDrive\Desktop\remote\_extracted\final_paper_text.txt", 'w', encoding='utf-8') as f:
    f.write(text)
print(f"Final paper: {len(text)} chars extracted")

# Extract the rough draft
rough_path = r"c:\Users\ok790\OneDrive\Desktop\remote\Research Paper\Research Paper (Rough Draft, single column).pdf"
text2 = extract_pdf_text(rough_path)
with open(r"c:\Users\ok790\OneDrive\Desktop\remote\_extracted\rough_draft_text.txt", 'w', encoding='utf-8') as f:
    f.write(text2)
print(f"Rough draft: {len(text2)} chars extracted")

# Extract IEEE format
ieee_path = r"c:\Users\ok790\OneDrive\Desktop\remote\Research Paper\Research Paper IEEE format.pdf"
text3 = extract_pdf_text(ieee_path)
with open(r"c:\Users\ok790\OneDrive\Desktop\remote\_extracted\ieee_format_text.txt", 'w', encoding='utf-8') as f:
    f.write(text3)
print(f"IEEE format: {len(text3)} chars extracted")
