############################################################
# SPOTIFY DATA ANALYSIS PROJECT
# DATA CLEANING + EXPLORATORY DATA ANALYSIS (EDA)
############################################################

# ----------------------------------------------------------
# STEP 1: INSTALL REQUIRED PACKAGES
# ----------------------------------------------------------

# These packages help with data manipulation and visualization
install.packages("tidyverse")
install.packages("corrplot")
install.packages("skimr")
install.packages("DataExplorer")

# ----------------------------------------------------------
# STEP 2: LOAD LIBRARIES
# ----------------------------------------------------------

# tidyverse -> data cleaning + visualization
# corrplot -> correlation heatmap
# skimr -> quick summary statistics
# DataExplorer -> quick dataset exploration

library(tidyverse)
library(corrplot)
library(skimr)
library(DataExplorer)

# ----------------------------------------------------------
# STEP 3: LOAD DATASET
# ----------------------------------------------------------

# Replace the file path if your dataset is in another folder
# file.choose() opens a file browser to select the dataset

data <- read.csv("spotify_tracks.csv")

# ----------------------------------------------------------
# STEP 4: INSPECT DATASET STRUCTURE
# ----------------------------------------------------------

# Display first few rows of dataset
head(data)

# Display structure of dataset
str(data)

# Check number of rows and columns
dim(data)

# Summary statistics for all columns
summary(data)

# Detailed summary statistics
skim(data)

# ----------------------------------------------------------
# STEP 5: CHECK FOR MISSING VALUES
# ----------------------------------------------------------

# Count missing values in each column
colSums(is.na(data))

# Remove rows with missing values
data <- na.omit(data)

# ----------------------------------------------------------
# STEP 6: REMOVE DUPLICATE RECORDS
# ----------------------------------------------------------

# Remove duplicate rows from dataset
data <- distinct(data)

# Check dimensions again after cleaning
dim(data)

# ----------------------------------------------------------
# STEP 7: FEATURE ENGINEERING
# ----------------------------------------------------------

# Convert duration from milliseconds to minutes
data$duration_min <- data$duration_ms / 60000

# Convert categorical columns to factors
data$genre <- as.factor(data$genre)
data$explicit <- as.factor(data$explicit)

# ----------------------------------------------------------
# STEP 8: DATA DISTRIBUTION ANALYSIS
# ----------------------------------------------------------

# Plot distribution of song popularity
ggplot(data, aes(x = popularity)) +
  geom_histogram(bins = 30, fill = "blue") +
  ggtitle("Distribution of Song Popularity")

# ----------------------------------------------------------
# STEP 9: GENRE DISTRIBUTION
# ----------------------------------------------------------

# Count number of songs per genre
ggplot(data, aes(x = genre)) +
  geom_bar(fill = "purple") +
  theme(axis.text.x = element_text(angle = 90)) +
  ggtitle("Number of Songs per Genre")
# ----------------------------------------------------------
# STEP 11: BOXPLOT ANALYSIS
# ----------------------------------------------------------

# Compare popularity distribution across genres
ggplot(data, aes(x = genre, y = popularity)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90)) +
  ggtitle("Popularity Distribution by Genre")

# ----------------------------------------------------------
# STEP 13: AUTOMATED DATA EXPLORATION REPORT
# ----------------------------------------------------------

# Generate automatic exploratory report
create_report(data)

# ----------------------------------------------------------
# STEP 14: SAVE CLEANED DATASET
# ----------------------------------------------------------

# Save cleaned dataset for Power BI dashboard
write.csv(data, "cleaned_spotify_data.csv", row.names = FALSE)

############################################################
# END OF SCRIPT
############################################################