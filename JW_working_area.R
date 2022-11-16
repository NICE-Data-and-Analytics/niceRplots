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

finalise_plot(nice_hist,
              source_name = "Source: Iris dataset",
              save_filepath = "data/output.png",
              logo_image_path = "data/NICE_short_logo_black.png")

footer <- create_footer("Source: Iris dataset", logo_image_path = "data/NICE_short_logo_black.png")

#Draw your left-aligned grid
plot_left_aligned <- left_align(nice_hist, c("subtitle", "title", "caption"))
plot_grid <- ggpubr::ggarrange(plot_left_aligned, footer,
                               ncol = 1, nrow = 2,
                               heights = c(1, 0.045/(450/450)))

## print(paste("Saving to", save_filepath))
save_plot(plot_grid, 640, 450, "data/output.png")

ggplot2::ggsave(filename = "data/output.png",
                plot=plot_grid, width=(640/72), height=(450/72),  bg="white")

showtext::showtext_opts()
showtext::showtext_opts(dpi = 300)

# Bar chart ---------------------------------------------------------------

bar_df <- iris %>%
  group_by(Species) %>%
  summarise(Sepal.Length = mean(Sepal.Length, na.rm = TRUE)) %>%
  ungroup()

# No theme
bar_chart <- bar_df %>%
  ggplot(aes(y = Sepal.Length, x = Species)) +
  geom_hline(yintercept = 0, linewidth = 1, colour="#333333") +
  scale_y_continuous(expand = c(0,0), limits = c(0,8)) +
  geom_col(fill = "#228096", colour = "black", linewidth = 0.7) +
  labs(title = "Sepal length-width relationship",
       subtitle = "Example subtitle",
       x = "Species",
       y = "Sepal Length")

bar_chart

# NICE theme
bar_chart +
  nice_gg_theme(xlabel = FALSE)


# Line chart --------------------------------------------------------------

line_data <- doacs_df %>%
                group_by(date, chemical) %>%
                summarise(items = sum(items)) %>%
                ungroup()

# No theme
line_chart <- line_data %>%
  filter(chemical == "Edoxaban") %>%
  ggplot(aes(x = date, y = items, color = chemical)) +
  geom_line(linewidth = 0.8) +
  geom_point(size = 2) +
  scale_y_continuous(expand = c(0,0), limits = c(0,200000), label = scales::comma) +
  scale_x_date(date_labels = "%b\n%Y", date_breaks = "3 months", date_minor_breaks = "1 month") +
  geom_hline(yintercept = 0, linewidth = 1, colour="#333333")

line_chart

# NICE theme
line_chart +
  nice_gg_theme(xlabel = FALSE) +
  labs(title = "Edoxaban prescribing has increased",
       subtitle = "Edoxaban prescribing in England, 2020-2022",
       y = "Dispensed items")


# Scatter chart --------------------------------------------------------------

# No theme
scatter_chart <- iris %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 2, position = "jitter") +
  expand_limits(y = c(1.5,4.5)) +
  labs(title = "Sepal Length-Width relationship",
       subtitle = "This is what a subtitle would look like",
       x = "Sepal Length",
       y = "Sepal Width")

scatter_chart

# NICE theme
scatter_chart +
  nice_gg_theme(legend = "right", xlabel = TRUE, border = TRUE, vgrid = TRUE)

# Faceted chart ----------------------------------------------------------

# No theme
facet_chart <- iris %>%
  ggplot(aes(x = Sepal.Length, y = Sepal.Width,
             color = Species)) +
  geom_point(size = 3) +
  scale_y_continuous(expand = c(0,0), limits = c(1,5)) +
  facet_wrap(~Species) +
  labs(title = "This is what a title would look like",
       subtitle = "This is what a subtitle would look like",
       x = "Sepal Length",
       y = "Sepal Width")

facet_chart

# NICE theme
facet_chart +
  nice_gg_theme(legend = "right", border = TRUE)


