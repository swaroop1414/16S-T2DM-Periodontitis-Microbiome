if (!require("BiocManager")) install.packages("BiocManager")
BiocManager::install(c("phyloseq", "microbiome"), ask = FALSE)
install.packages(c("tidyverse", "vegan", "ggplot2", "patchwork", "RColorBrewer"))

# Load
library(phyloseq)
library(tidyverse)
library(vegan)
library(ggplot2)
library(patchwork)
library(RColorBrewer)