# Spotify Data Analysis Project

#Installing libraries
install.packages("dplyr")
install.packages("ggplot2")
install.packages("corrplot")
install.packages("GGally")

# Load libraries
library(dplyr)
library(ggplot2)
library(corrplot)
library(GGally)

# Load dataset
spotify <- read.csv("cleaned_spotify_data.csv")

# View data
head(spotify)

#Correlation analysis Code
numeric_data <- spotify %>%
  select(popularity,
         danceability,
         energy,
         loudness,
         speechiness,
         acousticness,
         instrumentalness,
         liveness,
         valence,
         tempo,
         duration_min)

cor_matrix <- cor(numeric_data, use = "complete.obs")

print(cor_matrix)

#Correlation heatmap
corrplot(cor_matrix,
         method = "color",
         type = "upper",
         tl.col = "black",
         tl.srt = 45)

#Feature Relationships Graphs

# Danceability vs Popularity
ggplot(spotify, aes(danceability, popularity)) +
  geom_point(color = "purple", alpha = 0.5) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Danceability vs Popularity",
       x = "Danceability",
       y = "Popularity") +
  theme_minimal()


# Energy vs Popularity
ggplot(spotify, aes(energy, popularity)) +
  geom_point(color = "blue", alpha = 0.5) +
  geom_smooth(method = "lm", color = "darkorange", se = FALSE) +
  labs(title = "Energy vs Popularity",
       x = "Energy",
       y = "Popularity") +
  theme_minimal()


# Valence vs Popularity
ggplot(spotify, aes(valence, popularity)) +
  geom_point(color = "darkgreen", alpha = 0.5) +
  geom_smooth(method = "lm", color = "magenta", se = FALSE) +
  labs(title = "Valence vs Popularity",
       x = "Valence",
       y = "Popularity") +
  theme_minimal()


# Acousticness vs Popularity
ggplot(spotify, aes(acousticness, popularity)) +
  geom_point(color = "brown", alpha = 0.5) +
  geom_smooth(method = "lm", color = "cyan4", se = FALSE) +
  labs(title = "Acousticness vs Popularity",
       x = "Acousticness",
       y = "Popularity") +
  theme_minimal()


