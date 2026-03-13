# R Analysis – Spotify Data Cleaning & Exploratory Data Analysis (EDA)

## Overview

This part of the project focuses on **data cleaning and exploratory data analysis (EDA)** of the Spotify Tracks dataset using R.

The objective of this stage is to:
- Clean and preprocess the raw dataset
- Explore relationships between different audio features
- Generate insights about song characteristics and popularity
- Produce a cleaned dataset that can be used for visualization in Power BI

---

## Tools Used

- R
- RStudio

### Libraries

The following R libraries are used:

- tidyverse – data manipulation and visualization
- ggplot2 – data visualization
- corrplot – correlation heatmaps
- skimr – summary statistics

Install them using:

```r
install.packages("tidyverse")
install.packages("corrplot")
install.packages("skimr")
```

---

## Dataset

Dataset used: **Spotify Tracks Audio Features (50K songs)**

The dataset includes various audio characteristics of songs such as:

- track_name
- artist
- genre
- popularity
- danceability
- energy
- loudness
- tempo
- valence
- duration_ms
- explicit

---

## Folder Structure

```
r_analysis/
│
├── spotify_cleaning_eda.R
├── cleaned_spotify_data.csv
└── README.md
```

- `spotify_cleaning_eda.R` → main R script for cleaning and analysis  
- `cleaned_spotify_data.csv` → cleaned dataset used in Power BI  

---

## Project Workflow

### 1. Load Libraries
Required packages are loaded for data manipulation and visualization.

### 2. Load Dataset
The raw dataset is imported using:

```r
data <- read.csv("spotify_tracks.csv")
```

### 3. Data Inspection
Initial exploration of the dataset using:

- `head()`
- `str()`
- `summary()`
- `skim()`

This helps understand the dataset structure and variable types.

---

### 4. Data Cleaning

The following preprocessing steps are performed:

- Remove missing values
- Remove duplicate rows
- Convert categorical variables to factors
- Convert duration from milliseconds to minutes

Example transformation:

```r
data$duration_min <- data$duration_ms / 60000
```

---

### 5. Exploratory Data Analysis (EDA)

EDA is performed to understand patterns and relationships within the dataset.

Key visualizations include:

#### Popularity Distribution
Histogram showing how popularity scores are distributed.

#### Genre Distribution
Bar chart showing number of songs in each genre.

#### Feature Relationships
Scatter plots showing relationships between:

- Danceability vs Popularity
- Energy vs Popularity
- Valence vs Popularity
- Acousticness vs Popularity

#### Correlation Heatmap
Correlation matrix showing relationships between audio features such as:

- popularity
- danceability
- energy
- loudness
- speechiness
- acousticness
- instrumentalness
- liveness
- tempo
- valence
- duration_min
  

---

## Output

The R script produces:

- Cleaned dataset (`cleaned_spotify_data.csv`)
- Multiple EDA visualizations
- Statistical summaries

The cleaned dataset is used as input for the **Power BI dashboard**.

---

## How to Run the Script

1. Open the project in RStudio
2. Place the dataset in the project folder
3. Run the script:

```r
source("spotify_cleaning_eda.R")
```

The script will automatically perform cleaning and generate analysis outputs.

---

## Key Objectives

- Prepare a clean dataset for visualization
- Identify patterns in music features
- Analyze relationships between audio features and popularity
- Support dashboard development using Power BI

---

## Next Stage

The cleaned dataset generated from this analysis will be used to build an **interactive Power BI dashboard** for visual exploration of Spotify music trends.
