# Cold Storage Temperature Analysis

A statistical analysis of cold‐storage temperature data to assess seasonal behavior, penalty calculations, and hypothesis testing for maintenance performance.

---

## 📄 Project Overview

This project examines two datasets from a cold‐storage facility:

1. **Cold_Storage_Temp_Data.csv**  
   - Population data: daily temperatures (°C) over a full year, labeled by season (Rainy, Summer, Winter).

2. **Cold_Storage_Mar2018.csv**  
   - Sample data: daily temperatures (°C) for February–March 2018.

Key questions addressed:
- Seasonal mean and dispersion of temperatures.
- Probability of breaching the 2–4 °C operating range.
- Penalty calculation for maintenance contractor.
- ANOVA & post-hoc analysis to compare seasons.
- Z-test and t-test to determine if corrective action was needed in Mar 2018.

---

## 🗂️ Repository Structure

📁 data/
├─ Cold_Storage_Temp_Data.csv # Full-year population data
└─ Cold_Storage_Mar2018.csv # Feb–Mar 2018 sample data

📁 reports/
├─ Cold-Storage-Project.pdf # Full write-up and results
└─ Cold-Storage-Project.Rmd # R Markdown source

📁 scripts/
└─ analysis.R # R script pulled from Rmd (via purl)

README.md # This file

---

## 🛠️ Setup & Dependencies

1. **Install R** (>= 4.0) and RStudio (recommended).  
2. Install required packages:
   ```r
   install.packages(c(
     "readr", "dplyr", "ggplot2", "gridExtra", "car",
     "knitr", "rmarkdown", "markdown"
   ))


