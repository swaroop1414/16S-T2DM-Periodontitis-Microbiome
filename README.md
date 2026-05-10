# 16S rRNA Microbiome Analysis: T2DM and Periodontitis Comorbidity

## Overview

This project investigates the oral microbiome composition across four clinical groups to characterize microbial dysbiosis associated with Type 2 Diabetes Mellitus (T2DM), Periodontitis, and their comorbidity. 16S rRNA amplicon sequencing (V3-V4 region) data was obtained from NCBI SRA (PRJNA1240053) and processed through a reproducible QIIME2-based pipeline.

| Group | Condition | n |
|-------|-----------|---|
| H | Healthy controls | 10 |
| P | Periodontitis only | 10 |
| T2DM | Type 2 Diabetes only | 20 |
| T2DM_P | T2DM + Periodontitis | 20 |

**Total samples:** 60 | **ASVs generated:** 2,230 | **Rarefaction depth:** 31,147 reads/sample

---

## Pipeline
```
Raw FASTQ (PRJNA1240053)
└── Quality Control (FastQC, MultiQC)
└── Adapter trimming (Cutadapt)
└── QIIME2 import (paired-end manifest)
└── Denoising (Deblur, trim length 240bp)
└── 2,230 ASVs across 59 samples
└── Taxonomic classification (SILVA 138-99 NB classifier)
└── Phylogenetic tree (MAFFT alignment → FastTree → midpoint root)
└── Diversity analysis
├── Alpha: Shannon, Faith's PD, Observed ASVs, Evenness
└── Beta: Bray-Curtis, Weighted/Unweighted UniFrac (PERMANOVA)
└── Differential abundance (ANCOM-BC, genus level)
└── Downstream visualization (phyloseq, ggplot2)

```
**Note:** Deblur was used instead of DADA2 due to binned quality scores in NovaSeq data, which violate DADA2's error model assumptions.

---

## Key Results

### Alpha Diversity
No significant differences in within-sample diversity (Shannon, Faith's PD) across groups (Kruskal-Wallis, p > 0.05). This suggests T2DM and periodontitis do not broadly reduce microbial richness in this cohort.

### Beta Diversity
Weighted and unweighted UniFrac PERMANOVA showed no significant community-level separation between groups (p > 0.05), confirmed visually by overlapping PCoA ellipses (PC1 = 45.9%, PC2 = 8.8%).

### Differential Abundance (ANCOM-BC)
Despite similar global community structure, targeted genus-level analysis identified significant taxa:

| Genus | Comparison | Log Fold Change | Direction | q-value |
|-------|-----------|----------------|-----------|---------|
| *Prevotella* (uncultured) | T2DM_P vs H | +2.21 | Enriched | 0.008 |
| *Catonella* | T2DM_P vs H | -1.38 | Depleted | 0.044 |
| *Butyrivibrio* | T2DM vs H | +1.49 | Enriched | 0.016 |

*Prevotella* enrichment in the T2DM+Periodontitis group is consistent with its established role as a periodontal pathogen and its association with systemic inflammation. *Catonella* depletion suggests displacement of healthy oral commensals under comorbid conditions.

---

## Figures

| Figure | Description |
|--------|-------------|
| `figures/taxonomy/taxa_barplot.tiff` | Phylum-level relative abundance per group |
| `figures/diversity/pcoa_weighted_unifrac.tiff` | Weighted UniFrac PCoA |
| `figures/diversity/alpha_diversity.tiff` | Shannon and Observed ASV boxplots |
| `figures/differential_abundance/ancombc_lfc.tiff` | ANCOM-BC log fold changes |

---

## Repository Structure

```
├── data/               # Metadata and manifest
├── qiime2/             # QIIME2 artifacts (.qza) and visualizations (.qzv)
│   ├── demux/          # Import and trimming
│   ├── denoising/      # Deblur outputs, aligned sequences, tree intermediates
│   ├── taxonomy/       # SILVA classification
│   └── diversity/      # Alpha and beta diversity outputs
├── phylogeny/          # Rooted phylogenetic tree
├── differential_abundance/ # ANCOM-BC results
├── exports/            # TSV exports from QIIME2 artifacts
├── figures/            # Publication-quality TIFF figures (600 DPI)
├── r_analysis/         # phyloseq R scripts
├── scripts/            # Pipeline bash scripts
├── qc/                 # FastQC and MultiQC reports
└── logs/               # Run logs

```
---

## Environment

- QIIME2 2024.x (conda)
- R 4.5 — phyloseq, ggplot2, patchwork
- Python 3.9
- WSL2 / Ubuntu 24.04

## Data Availability

Raw sequencing data: [PRJNA1240053](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1240053)
EOF

echo "README updated."

---

## Environment

- QIIME2 2024.x (conda)
- R 4.5 — phyloseq, ggplot2, patchwork
- Python 3.9
- WSL2 / Ubuntu 24.04

## Data Availability

Raw sequencing data: [PRJNA1240053](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1240053)
