# NTL Population Proxy — Urban-Rural Stratification

**Paper:** *Urban-Rural Stratification for NTL-Based Population Proxy Estimation* · Submitted to ICCCNT 2026

[![IEEE Paper](https://img.shields.io/badge/Paper-PDF-red)](./Research%20Paper/RESEARCH_PAPER_FINAL_ICCCNT_Oishik.pdf)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## Overview

Night-time light (NTL) satellite imagery is a powerful proxy for population estimation in data-scarce environments. Standard approaches fit a single global regression between NTL radiance and population — ignoring the fact that urban and rural districts have fundamentally different NTL-to-population relationships.

This project proposes a simple, fully data-driven stratification approach:

1. Cluster districts into **urban** and **rural** groups using **KMeans (k=2)** on NTL features alone (no census or land-cover data required)
2. Fit **separate Linear Regression models** for each cluster
3. Evaluate with **5-fold cross-validation + paired t-tests** for rigorous statistical validation

### Key Results

| Country | n | Baseline R² | Stratified R² | Δ | p-value |
|---|---|---|---|---|---|
| **India** | 670 districts | 0.8289 | **0.8582** | +0.0293 | 0.027 |
| **Nigeria** | 695 LGAs | 0.1676 | **0.2511** | +0.0835 | **0.004** |
| Bangladesh | 64 | 0.5342 | — | — | n/a (too few) |

> KMeans k=2 outperforms median-threshold stratification (silhouette: 0.54 vs 0.51). Testing k=3 (peri-urban) yielded only +0.002 R² (p=0.41) — not significant, so k=2 is retained.

### Notable Findings

- 🇮🇳 **Kerala Effect** — 4 of 6 most under-illuminated districts are in Kerala: dense population living in dispersed rural homesteads with minimal commercial lighting
- 🏚️ **Dharavi Effect** — Mumbai Suburban is severely under-illuminated due to informal settlements with low grid electrification
- 🌿 **NDVI Correction Backfires** — Adding NDVI *hurts* model performance in tropical India (Kerala), because high NDVI ≠ sparse settlement in wet tropics
- 🇳🇬 **Nigeria Failure Mode** — Gas flares in the Niger Delta and low rural electrification in northern states cause low baseline R²; stratification still significantly improves it (p=0.004)

---

## Repository Structure

```
NTL-Population-Proxy/
├── Research Paper/
│   └── RESEARCH_PAPER_FINAL_ICCCNT_Oishik.pdf   ← Final submission PDF
├── latex_src/
│   ├── main.tex                                   ← Full LaTeX source
│   ├── *.png                                      ← All figures
│   └── main.pdf                                   ← Compiled PDF
├── Collab Notebook FULL step by step/
│   └── population_proxy (3).ipynb                 ← Full experiment notebook
├── Remote Datasets/
│   ├── ind_ppp_2019_1km_Aggregated.tif            ← WorldPop India 2019
│   ├── nga_ppp_2019_1km_Aggregated.tif            ← WorldPop Nigeria 2019
│   └── modis_ndvi_india_2019.tif                  ← MODIS NDVI India 2019
├── Research Diary Step by Step/
│   └── NTL_Research_Diary (2).pdf                 ← Full experiment log
└── README.md
```

---

## Data

| Dataset | Source | Notes |
|---|---|---|
| VIIRS VNL V2.1 2019 | [EOG / Mines](https://eogdata.mines.edu/products/vnl/) | Annual average, cloud-masked global composite |
| WorldPop 2019 (1km) | [WorldPop](https://www.worldpop.org/) | UN-adjusted, 1km resolution |
| GADM v4.1 | [GADM](https://gadm.org/) | Level-2 district boundaries |
| MODIS NDVI 2019 | Google Earth Engine | MOD13A3, annual mean |

> The VIIRS global raster (~1.3 GB compressed) is not included in this repo. Download it from EOG or use the download script in the notebook. WorldPop TIFs for India and Nigeria are included.

---

## Reproducing the Results

The full pipeline runs on **Google Colab** (free tier is sufficient):

1. Open `Collab Notebook FULL step by step/population_proxy (3).ipynb` in Colab
2. Mount your Google Drive and place the VIIRS `.tif.gz` there
3. Run cells sequentially — the notebook handles all downloads (GADM, WorldPop) automatically
4. Key outputs: CV R² scores, residual maps, KMeans classification map

**Local reproduction** requires: `geopandas`, `rasterio`, `rasterstats`, `scikit-learn`, `scipy`, `matplotlib`

```bash
pip install geopandas rasterio rasterstats scikit-learn scipy matplotlib
```

---

## Citation

If you use this work, please cite:

```bibtex
@inproceedings{kar2026ntl,
  title     = {Urban-Rural Stratification for NTL-Based Population Proxy Estimation},
  author    = {Kar, Oishik and [Co-author]},
  booktitle = {Proceedings of the International Conference on Computing, Communication
               and Networking Technologies (ICCCNT)},
  year      = {2026},
  note      = {Submitted}
}
```

---

## Authors

- **Oishik Kar** — IIIT Dharwad · [ok7908813714@gmail.com](mailto:ok7908813714@gmail.com)

---

## License

Code and LaTeX source: [MIT License](LICENSE)  
Paper text: © Authors, submitted to IEEE ICCCNT 2026
