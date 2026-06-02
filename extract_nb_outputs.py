import json, sys
sys.stdout.reconfigure(encoding='utf-8')

NB_PATH = r"c:\Users\ok790\OneDrive\Desktop\remote\Collab Notebook FULL step by step\population_proxy (3).ipynb"

with open(NB_PATH, 'r', encoding='utf-8') as f:
    nb = json.load(f)

# Save all outputs to file
out_lines = []
for i, cell in enumerate(nb['cells']):
    if cell['cell_type'] == 'code' and cell.get('outputs'):
        for out in cell['outputs']:
            text = ''.join(out.get('text', []))
            if text.strip():
                out_lines.append(f"=== Cell {i} output ===")
                out_lines.append(text)
                out_lines.append("")

with open(r"c:\Users\ok790\OneDrive\Desktop\remote\_extracted\nb_outputs.txt", 'w', encoding='utf-8') as f:
    f.write('\n'.join(out_lines))
print(f"Saved {len(out_lines)} lines")
