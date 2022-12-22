# Setup
if (!require(pacman)) install.packages("pacman")
pacman::p_load(tidyverse, plotly)

here::i_am("R/plotly_theme.R")

pacman::p_load(here)

# Load NICE colours
source(here("R", "load_nice_colours.R"))

# Criteria
# - Font: Inter Regular
# - White background (already a default) and no border
# - Axis labels font size 12, black. Margins
# - Grid lines - horizontal only if vertical bar chart, horizontal only if line chart, vertical only if horizontal bar chart, both if scatter
# - Tool bar icons - download
# - y axis label position
# - Plot margins

# - Black line around bars
# Title and subtitle and caption and data source as text below graph


nice_plotly_theme <- function(p,
                       chart_type = "bar",
                       x_title = "[x axis title]",
                       y_title = "[y axis title]",
                       font_size = 12,
                       pad_axes = TRUE) {

  chart_grids <- list(vertical_bar = list(xgrid = FALSE,
                                ygrid = TRUE),
                     horizontal_bar = list(xgrid = TRUE,
                                           ygrid = FALSE),
                     scatter = list(xgrid = TRUE,
                                    ygrid = TRUE),
                     line = list(xgrid = FALSE,
                                 ygrid = TRUE))

  layout(p,
         font = list(family = "inter regular",
                     size = font_size,
                     color = "#000000"),
         xaxis = list(showgrid = chart_grids[[chart_type]][["xgrid"]],
                      title = list(font = list(size = font_size),
                                   text = x_title,
                                   standoff = 10),
                      tickfont = list(size = font_size),
                      gridwidth = 1.5,
                      gridcolor = "#e6e6e6",
                      zerolinewidth = 1.5),
         yaxis = list(showgrid = chart_grids[[chart_type]][["ygrid"]],
                      title = list(font = list(size = font_size),
                                   text = y_title,
                                   standoff = 5),
                      tickfont = list(size = font_size),
                      gridwidth = 1.5,
                      gridcolor = "#e6e6e6",
                      zerolinewidth = 1.5),
         margin = list(pad = 10*pad_axes),
         legend = list(font = list(size = font_size))) %>%
    config(modeBarButtonsToRemove = c("zoom", "pan", "select", "lasso", "zoomIn2d", "zoomOut2d", "autoscale", "resetscale", "hovercompare", "hoverclosest"),
           displaylogo = FALSE)
}


