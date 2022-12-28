#' Apply NICE Plotly theme
#'
#' @description
#' `nice_plotly_theme()` applies a NICE theme to a Plotly chart object. It makes
#' some basic changes, including:
#' - Changing the font to Inter
#' - Setting the minimum font size
#' - Adding or removing grid lines depending on the chart type
#' - Reminds users to add x and y axis titles
#' - Removes icons from the default Plotly tool bar
#'
#' @param p Plotly chart object.
#' @param chart_type Type of chart, determines which grid lines are shown:
#' - `"vertical_bar"` (default): For bar charts and histograms. Only shows
#' horizontal grid lines.
#' - `"horizontal_bar"`: For horizontal bar charts. Only shows vertical grid
#' lines.
#' - `"scatter"`: For scatter plots. Shows both horizontal and vertical grid
#' lines.
#' - `"line"`: For line charts. Only shows horizontal grid lines.
#' @param x_title,y_title String to use as X or y axis title.
#' @param font_size Minimum font size. Default is `12`.
#' @param pad_axes Add space between the axis lines and the axis title or tick
#'    marks? If `TRUE` (default), adds some space between the tick labels and
#'    the axis lines. If using tick marks, set to `FALSE` to avoid a gap between
#'    the axis lines and the tick marks.
#'
#' @returns A Plotly chart object.
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
#'    marker = list(color = nice_colours_full[["bold_teal_100"]],
#'                  line = list(color = nice_colours_full[['black_100']], width = 1.5))) %>%
#'    # Apply NICE theme
#'    nice_plotly_theme(chart_type = "vertical_bar",
#'                      x_title = "Species",
#'                      y_title = "Sepal Width")

nice_plotly_theme <- function(p,
                       chart_type = "vertical_bar",
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


