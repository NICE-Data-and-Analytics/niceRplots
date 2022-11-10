library(devtools)
library(dplyr)
library(ggplot2)

load_all()


# Histogram ---------------------------------------------------------------

# No theme
histogram <- iris %>%
  ggplot(aes(x=Sepal.Width)) +
  geom_histogram(aes(fill=Species), binwidth=0.2, color="black") +
  labs(title = "Species setosa has the longest sepal length",
       subtitle = "Distribution of sepal width by species",
       x = "Sepal Width",
       y = "Frequency")

histogram

# NICE theme

histogram +
  nice_gg_theme(legend = "right")

# Bar chart ---------------------------------------------------------------

# No theme
bar_chart <- iris %>%
  ggplot(aes(y = Sepal.Length, x = Species)) +
  geom_col(fill = "#228096", colour = "black") +
  labs(title = "Sepal Length-Width relationship",
       subtitle = "Example subtitle",
       x = "Species",
       y = "Sepal Length")

bar_chart

# NICE theme
bar_chart +
  nice_gg_theme()

# Scatter chart --------------------------------------------------------------

# No theme
scatter_chart <- iris %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Sepal Length-Width relationship",
       subtitle = "This is what a subtitle would look like",
       x = "Sepal Length",
       y = "Sepal Width")

scatter_chart

# NICE theme
scatter_chart +
  nice_gg_theme()

# Faceted chart ----------------------------------------------------------

# No theme
facet_chart <- iris %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width,
             color = Species)) +
  geom_point(size = 3) +
  facet_wrap(~Species) +
  labs(title = "This is what a title would look like",
       subtitle = "This is what a subtitle would look like",
       x = "Sepal Length",
       y = "Sepal Width")

facet_chart

# NICE theme
facet_chart +
  nice_gg_theme(legend = "right")




