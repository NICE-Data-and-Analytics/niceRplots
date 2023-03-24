#' Apply NICE Plotly theme
#'
#' @description
#' `nice_plotly_theme()` applies a NICE theme to a Plotly chart object. It makes
#' some basic changes, including:
#' - Changing the font to Inter Regular
#' - Setting the minimum font size
#' - Reminds users to edit the x and y axis titles
#' - Provides options to adjust the grid lines, axis lines and axis ticks
#' - Removes icons from the default Plotly tool bar
#'
#' @param p Plotly chart object.
#' @param x_title,y_title String to use as x or y axis title. Defaults to
#'     `"[x axis title]"` and `"[y axis title]"` respectively.
#' @param font_size Minimum font size in px. Default is `16`.
#' @param grid_lines determines which major grid lines are shown:
#' - `"y"` (default): show y axis grid lines
#' - `"x"`: show x axis grid lines
#' - `"both"`: show both x and y axis grid lines
#' - `"none"`: remove grid lines
#' @param axis_lines determines which axis lines are shown:
#' - `"x"` (default): show x axis line
#' - `"y"`: show y axis line
#' - `"both"`: show both x and y axis lines
#' - `"none"`: remove axis lines
#' @param axis_ticks determines which axis ticks are shown:
#' - `"x"` (default): show ticks on x axis
#' - `"y"`: show ticks on y axis
#' - `"both"`: show ticks on both x and y axis
#' - `"none"`: remove ticks
#' @param show_legend Option to remove the chart legend. If `TRUE` (default), the legend
#' will be present above the chart. If set to `FALSE`, the legend will be removed.
#' @param panel_border Option to add a panel border. If `FALSE` (default), no border
#' will be present. If set to `TRUE`, a panel border will be added.
#'
#' @returns A Plotly chart object.
#' @export
#'
#' @importFrom dplyr %>%
#' @importFrom plotly layout
#' @importFrom plotly config
#'
#' @examples
#'# Load data
#' iris_bar_df <- iris %>%
#'    group_by(Species) %>%
#'    summarise(Sepal_Width = mean(Sepal.Width)) %>%
#'    ungroup()
#'
#' # Create formatted chart
#' plot_ly(iris_bar_df,
#'    x = ~Species,
#'    y = ~Sepal_Width,
#'    type = "bar",
#'    marker = list(color = nice_cols("bold_teal_100"),
#'                  line = list(color = nice_cols("black_100"), width = 1.5))) %>%
#'    # Apply NICE theme
#'    nice_plotly_theme(x_title = "Species",
#'                      y_title = "Sepal Width")

nice_plotly_theme <- function(p,
                              x_title = "[x axis title]",
                              y_title = "[y axis title]",
                              font_size = 16,
                              grid_lines = "y",
                              axis_lines = "x",
                              axis_ticks = "x",
                              show_legend = TRUE,
                              panel_border = FALSE){

  # Set up options for the axis and gridlines
  options <- list(x = list(show_x = TRUE,
                           show_y = FALSE),
                  y = list(show_x = FALSE,
                           show_y = TRUE),
                  both = list(show_x = TRUE,
                              show_y = TRUE),
                  none = list(show_x = FALSE,
                              show_y = FALSE))

  # Set up options for axis ticks
  tick_options <- list(x = list(show_x = "outside",
                                show_y = ""),
                       y = list(show_x = "",
                                show_y = "outside"),
                       both = list(show_x = "outside",
                                   show_y = "outside"),
                       none = list(show_x = "",
                                   show_y = ""))

  # Set values for axis lines, overwrite these if the panel border option is TRUE
  axis_x <- options[[axis_lines]][["show_x"]]
  axis_y <- options[[axis_lines]][["show_y"]]

  if (panel_border) {
    axis_x <- TRUE
    axis_y <- TRUE
  }

  plot <- layout(p,
                 font = list(family = "Inter Regular",
                             size = font_size,
                             color = "#000000"),
                 xaxis = list(title = list(font = list(size = font_size),
                                           text = x_title,
                                           standoff = 10),
                              # Set up grid formatting
                              showgrid = options[[grid_lines]][["show_x"]],
                              gridwidth = 1.5,
                              gridcolor = "#e6e6e6",
                              # Set up axis line formatting
                              showline = axis_x,
                              linewidth = 1.5,
                              linecolor = "#000000",
                              # Set up tick formatting
                              ticks = tick_options[[axis_ticks]][["show_x"]],
                              tickfont = list(size = font_size),
                              # Options to add panel border (mirrors x and y axis)
                              mirror = panel_border),
                 yaxis = list(title = list(font = list(size = font_size),
                                           text = y_title,
                                           standoff = 5),
                              # Set up grid formatting
                              showgrid = options[[grid_lines]][["show_y"]],
                              gridwidth = 1.5,
                              gridcolor = "#e6e6e6",
                              # Set up axis line formatting
                              showline = axis_y,
                              linewidth = 1.5,
                              linecolor = "#000000",
                              # Set up tick formatting
                              ticks = tick_options[[axis_ticks]][["show_y"]],
                              tickfont = list(size = font_size),
                              # Options to add panel border (mirrors x and y axis)
                              mirror = panel_border),
                 # Remove axis margins so axis lines are not offset
                 margin = list(pad = 0),
                 # Set up legend formatting (above chart)
                 showlegend = show_legend,
                 legend = list(orientation = "h",
                               yanchor = "bottom",
                               y = 1.01,
                               xanchor = "right",
                               x = 1,
                               font = list(size = font_size))) %>%
    # Remove unnecessary plotly options
    config(modeBarButtonsToRemove = c("zoom", "pan", "select", "lasso", "zoomIn2d", "zoomOut2d",
                                      "autoscale", "resetscale", "hovercompare", "hoverclosest"),
           displaylogo = FALSE)

  return(plot)
}
