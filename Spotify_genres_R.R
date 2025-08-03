library(ggplot2)
library(dplyr)

df <- read.csv("C:/Users/SweetHome/Downloads/rolling_stone.csv")

genre_popularity <- df %>%
  filter(!is.na(genre) & genre != "" & !is.na(spotify_popularity)) %>%
  group_by(genre) %>%
  summarise(
    avg_popularity = mean(spotify_popularity),
    .groups = 'drop'
  ) %>%
  arrange(desc(avg_popularity))

genre_popularity %>%
  head(10) %>%
  ggplot(aes(x = reorder(genre, avg_popularity), y = avg_popularity)) +
  geom_col(fill = "#1DB954") +  # Цвет Spotify
  geom_text(
    aes(label = paste0(round(avg_popularity, 1))), 
    hjust = -0.3,
    size = 3
  ) +
  coord_flip() +
  labs(title = "ТОП 10 жанров в Spotify",
       x = "Жанр",
       y = "Средняя популярность (0-100)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = .5, face = "bold"))
