import json

with open(r'c:\Users\ok790\OneDrive\Desktop\remote\Collab Notebook FULL step by step\population_proxy (3).ipynb', 'r', encoding='utf-8') as f:
    nb = json.load(f)

out = []
for i, cell in enumerate(nb['cells']):
    if cell['cell_type'] == 'code':
        src = ''.join(cell['source'])
        if len(src.strip()) > 20:
            out.append(f'--- CELL {i} ---\n{src}\n')

text = '\n'.join(out)
with open(r'c:\Users\ok790\OneDrive\Desktop\remote\_extracted\notebook_code.txt', 'w', encoding='utf-8') as f:
    f.write(text)
print(f"Extracted {len(out)} code cells, {len(text)} chars")
