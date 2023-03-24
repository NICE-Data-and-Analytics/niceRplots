#' Apply the NICE theme to a chart
#'
#'@description
#'
#' `nice_gg_theme()`applies a theme to a ggplot2 chart object to make it
#' consistent with the NICE style. Changes made are listed below:
#' - Changes the chart title font to Lora SemiBold
#' - Changes the base font to Inter Regular
#' - Applies a hierarchy for text size
#' - Adjusts the chart background and margins
#' - Adjusts the chart colour scheme
#' - Provides an option to remove axis titles
#' - Provides an option to alter grid lines
#' - Provides an option to alter axis lines
#' - Provides an option to alter axis ticks
#' - Provides an option to remove the legend
#' - Provides an option to add a panel border
#' - Provides an option to remove the axes
#'
#' @param base_size Minimum font size. Default is `12`.
#' @param x_title Option to remove the x axis title. If `TRUE` (default), the x axis
#' title will be present and can be renamed using the `labs()` function. If set to
#' `FALSE`, the x axis title will be removed.
#' @param y_title Option to remove the y axis title. If `TRUE` (default), the y axis
#' title will be present and can be renamed using the `labs()` function. If set to
#' `FALSE`, the y axis title will be removed.
#' @param grid_lines determines which major grid lines are shown:
#' - `"y"` (default): show y axis grid lines
#' - `"x"`: show x axis grid lines
#' - `"x+y"`: show both x and y axis grid lines
#' - `"none"`: remove grid lines
#' @param axis_lines determines which axis lines are shown:
#' - `"x"` (default): show x axis line
#' - `"y"`: show y axis line
#' - `"x+y"`: show both x and y axis lines
#' - `"none"`: remove axis lines
#' @param axis_ticks determines which axis ticks are shown:
#' - `"x"` (default): show ticks on x axis
#' - `"y"`: show ticks on y axis
#' - `"x+y"`: show ticks on both x and y axis
#' - `"none"`: remove ticks
#' @param show_legend Option to remove the chart legend. If `TRUE` (default), the legend
#' will be present above the chart. If set to `FALSE`, the legend will be removed.
#' @param panel_border Option to add a panel border. If `FALSE` (default), no border
#' will be present. If set to `TRUE`, a panel border will be added.
#' @param remove_axes Option to remove the axes. If `FALSE` (default), chart axes
#' will be present. If set to `TRUE`, the axes will be removed. This will overwrite
#' previous axis formatting options
#'
#' @return A ggplot2 chart object
#' @export
#'
#' @importFrom dplyr %>%
#'
#' @examples
#' library(dplyr)
#' library(ggplot2)
#'
#' iris_bar_df <- iris %>%
#' group_by(Species) %>%
#' summarise(Sepal.Width = mean(Sepal.Width)) %>%
#' ungroup()
#'
#' iris_bar <- ggplot(iris_bar_df) +
#' geom_col(aes(x = Species, y = Sepal.Width), fill = "#228096", colour = "#000000") +
#' geom_hline(yintercept = 0, linewidth = 1, colour = "#333333") +
#' scale_y_continuous(expand = c(0, 0), limits = c(0, 4)) +
#' nice_gg_theme(x_title = FALSE) +
#' labs(y = "Sepal width")

nice_gg_theme <- function(base_size = 12,
                          x_title = TRUE,
                          y_title = TRUE,
                          grid_lines = "y",
                          axis_lines = "x",
                          axis_ticks = "x",
                          show_legend = TRUE,
                          panel_border = FALSE,
                          remove_axes = FALSE){

  font <- "Inter Regular"
  heading_font <- "Lora SemiBold"

  nice_theme <- ggplot2::theme(

    text = ggplot2::element_text(size = base_size),

    # Format the background ---------------------------------------------------

    # Remove the standard grey background
    panel.background = ggplot2::element_blank(),
    panel.border = ggplot2::element_blank(),


    # Format the title, subtitle and caption ----------------------------------

    plot.title = ggplot2::element_text(family = heading_font,
                                       size = ggplot2::rel(1.5),
                                       color = "#000000"),

    plot.subtitle = ggplot2::element_text(family = font,
                                          size = ggplot2::rel(1.2),
                                          margin = ggplot2::margin(0,0,15,0),
                                          color = "#000000"),

    plot.caption = ggplot2::element_text(family = font,
                                         size = ggplot2::rel(1.1),
                                         margin = ggplot2::margin(10,0,0,0),
                                         hjust = 0,
                                         color = "#000000"),


    # Format the axes ---------------------------------------------------------

    axis.title.x = ggplot2::element_text(family = font,
                                         size = ggplot2::rel(1),
                                         color = "#000000",
                                         margin = ggplot2::margin(t = 8)),

    axis.title.y = ggplot2::element_text(family = font,
                                         size = ggplot2::rel(1),
                                         color = "#000000",
                                         margin = ggplot2::margin(r = 8)),

    axis.text = ggplot2::element_text(family = font,
                                      size = ggplot2::rel(1),
                                      color = "#000000"),


    # Format the grid lines ---------------------------------------------------

    # Adjust minor grid lines
    panel.grid.minor = ggplot2::element_blank(),


    # Format the legend -----------------------------------------------------

    legend.position = "top",
    legend.justification = "right",
    legend.box.margin = ggplot2::margin(-10, 0, -10, 0),
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(family = font,
                                        size = ggplot2::rel(1),
                                        color = "#000000"),
    legend.text.align = 0,


    # Set up faceting options ------------------------------------------------

    # Set the background of the facet titles to NICE teal
    strip.background = ggplot2::element_rect(fill = "#228096",
                                             color = "#000000",
                                             linewidth = 1,
                                             linetype = "solid"),

    # Make the facet title text white
    strip.text = ggplot2::element_text(family = font,
                                       size  = ggplot2::rel(1),
                                       hjust = 0.5,
                                       color = "#FFFFFF"),

    # Adjust plot spacing -----------------------------------------------------

    # Add spacing around the plot
    plot.margin = ggplot2::margin(0.25, 0.25, 0.25, 0.25,"cm")
  )


# Optional adjustments ----------------------------------------------------

  # Option to remove x axis title -------------------------------------------
  if (!x_title){

    nice_theme <- nice_theme +
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank())
  }


  # Option to remove y axis title -------------------------------------------
  if (!y_title){

    nice_theme <- nice_theme +
      ggplot2::theme(
        axis.title.y = ggplot2::element_blank())
  }


  # Option to add a panel border (useful for facet plots) -------------------
  if (panel_border){

    nice_theme <- nice_theme +
      ggplot2::theme(
        panel.border = ggplot2::element_rect(color = "#000000",
                                             linewidth = 0.3,
                                             fill = NA))
  }

  # Option to remove legend --------------------------------------
  if (!show_legend){

    nice_theme <- nice_theme +
      ggplot2::theme(
        legend.position = "none")
  }

  # Option to alter grid lines -----------------------------------------------
  if (grid_lines == "y"){

    nice_theme <- nice_theme +
      ggplot2::theme(
        panel.grid.major.y = ggplot2::element_line(color = "#BFBFBF"),
        panel.grid.major.x = ggplot2::element_blank()
      )

  } else if(grid_lines == "x"){

    nice_theme <- nice_theme +
      ggplot2::theme(
        panel.grid.major.y = ggplot2::element_blank(),
        panel.grid.major.x = ggplot2::element_line(color = "#BFBFBF"))


  } else if(grid_lines == "x+y"){

    nice_theme <- nice_theme +
      ggplot2::theme(
        panel.grid.major.y = ggplot2::element_line(color = "#BFBFBF"),
        panel.grid.major.x = ggplot2::element_line(color = "#BFBFBF")
      )

  } else if(grid_lines == "none"){

    nice_theme <- nice_theme +
      ggplot2::theme(
        panel.grid.major.y = ggplot2::element_blank(),
        panel.grid.major.x = ggplot2::element_blank()
      )
  }

  # Option to alter axis lines -----------------------------------------------
  if (axis_lines == "x"){

    nice_theme <- nice_theme +
      ggplot2::theme(
        axis.line.x = ggplot2::element_line(linewidth = 0.7,
                                            colour = "#000000"),
        axis.line.y = ggplot2::element_blank()
      )

  } else if(axis_lines == "y"){

    nice_theme <- nice_theme +
      ggplot2::theme(
        axis.line.x = ggplot2::element_blank(),
        axis.line.y = ggplot2::element_line(linewidth = 0.7,
                                            colour = "#000000")
      )

  } else if(axis_lines == "x+y"){

    nice_theme <- nice_theme +
      ggplot2::theme(
        axis.line.x = ggplot2::element_line(linewidth = 0.7,
                                            colour = "#000000"),
        axis.line.y = ggplot2::element_line(linewidth = 0.7,
                                            colour = "#000000")
      )

  } else if(axis_lines == "none"){

    nice_theme <- nice_theme +
      ggplot2::theme(
        axis.ticks.x = ggplot2::element_blank(),
        axis.ticks.y = ggplot2::element_blank()
      )
  }

  # Option to alter axis ticks ----------------------------------------------
  if (axis_ticks == "x"){

    nice_theme <- nice_theme +
      ggplot2::theme(
        axis.ticks.x = ggplot2::element_line(linewidth = 0.7),
        axis.ticks.y = ggplot2::element_blank()
      )

  } else if(axis_ticks == "y"){

    nice_theme <- nice_theme +
      ggplot2::theme(
        axis.ticks.x = ggplot2::element_blank(),
        axis.ticks.y = ggplot2::element_line(linewidth = 0.7)
        )

  } else if(axis_ticks == "x+y"){

    nice_theme <- nice_theme +
      ggplot2::theme(
        axis.ticks.x = ggplot2::element_line(linewidth = 0.7),
        axis.ticks.y = ggplot2::element_line(linewidth = 0.7)
      )

  } else if(axis_ticks == "none"){

    nice_theme <- nice_theme +
      ggplot2::theme(
        axis.ticks.x = ggplot2::element_blank(),
        axis.ticks.y = ggplot2::element_blank()
      )
  }

  # Option to fully remove axes (e.g. for choropleth map)
  if (remove_axes){

    nice_theme <- nice_theme +
      ggplot2::theme(
        axis.title.x = ggplot2::element_blank(),
        axis.title.y = ggplot2::element_blank(),
        axis.text = ggplot2::element_blank(),
        axis.ticks.x = ggplot2::element_blank(),
        axis.ticks.y = ggplot2::element_blank(),
        axis.line.x = ggplot2::element_blank(),
        axis.line.y = ggplot2::element_blank()
      )
  }

  return(nice_theme)
}
