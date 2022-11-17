library(devtools)
library(dplyr)
library(ggplot2)

load_all()

doacs_df <- readr::read_csv("data/DOACs_data.csv")

# Histogram ---------------------------------------------------------------

# No theme
histogram <- iris %>%
  ggplot(aes(x = Sepal.Width)) +
  geom_histogram(aes(fill = Species), binwidth = 0.2, color = "black") +
  geom_hline(yintercept = 0, linewidth = 1, colour = "#333333") +
  scale_y_continuous(expand = c(0,0), limits = c(0,40)) +
  labs(title = "Species setosa has the longest sepal length",
       subtitle = "Distribution of sepal width by species",
       x = "Sepal Width",
       y = "Frequency")

histogram

# NICE theme
nice_hist <- histogram +
  nice_gg_theme(legend = "right", xlabel = TRUE) +
  labs(title = "Species setosa has the longest sepal length",
       subtitle = "Distribution of sepal width by species",
       x = "Sepal Width",
       y = "Frequency")

nice_hist

nice_hist <- finalise_plot(nice_hist,
              source_name = "Source: Iris dataset",
              logo_image_path = "data/NICE_short_logo_black.png")

nice_hist


# Working -----------------------------------------------------------------

nice_hist <- iris %>%
  ggplot(aes(x = Sepal.Width)) +
  geom_histogram(aes(fill = Species), binwidth = 0.2, color = "black") +
  geom_hline(yintercept = 0, linewidth = 1, colour = "#333333") +
  scale_y_continuous(expand = c(0,0), limits = c(0,40)) +
  nice_gg_simple() +
  theme(legend.position = "none") +
  labs(title = "Species setosa has the longest sepal length",
       subtitle = "Distribution of sepal width by species",
       x = "Sepal Width",
       y = "Frequency")

nice_hist

finalise_plot(nice_hist,
              source_name = "Source: Iris dataset",
              logo = )

