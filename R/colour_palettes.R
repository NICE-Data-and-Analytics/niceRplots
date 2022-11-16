if (!require(pacman)) install.packages("pacman")

pacman::p_load(tidyverse, unikn)

# Following https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2

# Import NICE colours
read_colours <- read_csv("R/nice_new_brand_colours.csv",
                         col_types = "cc")

  # https://indepth.nice.org.uk/colour-palette/index.html
  # Soft cream and warm pink are really hard to see
  # Brand guidelines are that soft cream only be used as a background colour
  # Yellow and pink should only be used as highlight colours for infographics and illustrations

# Create named vector
nice_colours <- read_colours$hex_code

names(nice_colours) <- read_colours$colour

# Display colour palette
seecol(nice_colours)

# Plot using named colour
mtcars %>%
  ggplot(aes(hp, mpg)) +
  geom_point(colour = nice_colours["bold_teal_100"], size = 4)

# Make palettes
nice_palettes <- list(
  discrete = nice_colours[c("bold_teal_100",
                            "natural_tan_100",
                            "deep_blue_100",
                            "balanced_green_100",
                            "positive_yellow_100",
                            "black_100")],
  sequential_teal = nice_colours[c("bold_teal_100",
                                                       "bold_teal_75",
                                                       "bold_teal_50",
                                                       "bold_teal_25")],
  diverging_teal_yellow = nice_colours[c("bold_teal_100",
                                        "bold_teal_75",
                                        "bold_teal_50",
                                        "bold_teal_25",
                                        "white_100",
                                        "positive_yellow_25",
                                        "positive_yellow_50",
                                        "positive_yellow_75",
                                        "positive_yellow_100")]
)

seecol(nice_palettes[["discrete"]])

# Manually inputting colour palette
## Note, need to remove names from vector, otherwise ggplot will be trying to use the
## names to assign colours to the colour variable levels
## e.g. will be looking for an item with name "pce" to use as the colour for level "pce"
economics_long %>%
  ggplot(aes(x = date, y = value01, colour = variable)) +
  geom_line(size = 1) +
  scale_colour_manual(values = unname(nice_palettes[["discrete"]])[1:6]) +
  theme(panel.background = element_rect(fill = nice_colours[["white_100"]]),
        axis.line = element_line(colour = nice_colours[["black_100"]]),
        panel.grid = element_line(colour = "grey90"))

# Interpolation method ----
## Colours look a bit off but able to interpolate if more colours needed in a graph than are specified

# Create function which returns function which interpolates a given palette

nice_palette_fn <- function(palette = "discrete", reverse = FALSE, ...) {
  # Select named palette
  pal <- nice_palettes[[palette]]

  # Reverse palette?
  if (reverse) pal <- rev(pal)

  # Returns function that interpolates a set of given colours to create a new colour palette
  colorRampPalette(pal, ...)
}

seecol(nice_palette_fn("discrete")(12))

seecol(nice_palette_fn("sequential_teal")(8))

# Functions for ggplot
scale_colour_nice <- function(palette = "discrete", discrete = TRUE, reverse = FALSE, ...) {
  pal <- nice_palette_fn(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("nice_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

scale_fill_nice <- function(palette = "discrete", discrete = TRUE, reverse = FALSE, ...) {
  pal <- nice_palette_fn(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("nice_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

# Test plots
economics_long %>%
  ggplot(aes(x = date, y = value01, colour = variable)) +
  geom_line(size = 1) +
  scale_colour_nice() +
  theme_bw()

ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Sepal.Length)) +
  geom_point(size = 4) +
  scale_colour_nice(palette = "sequential_teal", discrete = FALSE)

mpg %>%
  filter(!(manufacturer %in% c("lincoln", "mercury", "pontiac"))) %>%
  ggplot(aes(manufacturer, fill = manufacturer)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_nice()


# R bloggers method - Limited to number of colours specified in each palette ----

nice_palette_fn_rblog <- function(name, n, all_palettes = nice_palettes, type = c("discrete", "continuous")) {
  palette <- all_palettes[[name]] %>% unname()
  if (missing(n)) {
    n <- length(palette)
  }
  type <- match.arg(type)
  out <- switch(type,
               continuous = grDevices::colorRampPalette(palette)(n),
               discrete = palette[1:n]
  )
  structure(out, name = name, class = "palette")
}

nice_palette_fn_rblog("discrete", type = "discrete")

# Functions for ggplot
scale_colour_nice_d <- function(name = "discrete") {
  ggplot2::scale_colour_manual(values = nice_palette_fn_rblog(name,
                                                     type = "discrete"))
}

scale_colour_nice_c <- function(name = "sequential_teal") {
  ggplot2::scale_colour_gradientn(colours = nice_palette_fn_rblog(name = name,
                                                         type = "continuous"))
}

scale_fill_nice_d <- function(name = "discrete") {
  ggplot2::scale_fill_manual(values = nice_palette_fn_rblog(name,
                                                   type = "discrete"))
}

# Test plots
# Soft cream 25% panel background
economics_long %>%
    ggplot(aes(x = date, y = value01, colour = variable)) +
    geom_line(size = 1) +
    scale_colour_nice_d() +
    theme(panel.background = element_rect(fill = nice_colours[["soft_cream_25"]],
                                         colour = nice_colours[["soft_cream_25"]]),
          panel.grid.major = element_line(size = 1.2),
          panel.grid.minor = element_line(size = 0.8))

  # White background
  economics_long %>%
    ggplot(aes(x = date, y = value01, colour = variable)) +
    geom_line(size = 1) +
    scale_colour_nice_d() +
    theme(panel.background = element_rect(fill = nice_colours[["white_100"]]),
          axis.line = element_line(colour = nice_colours[["black_100"]]),
          panel.grid = element_line(colour = "grey90"))

ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Sepal.Length)) +
  geom_point(size = 4) +
  scale_colour_nice_c()

mpg %>%
  filter(manufacturer %in% c("audi", "ford", "honda", "hyundai", "nissan", "toyota")) %>%
  ggplot(aes(manufacturer, fill = manufacturer)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_nice_d()



