#' Add the NICE theme to a chart
#'
#'This function will style your ggplot2 charts with the NICE theme. This will
#'adjust the fonts, text hierarchy, background, margins and colour scheme.
#'
#' @param base_size The base font size of your plot. Changing this will alter text
#' sizes throughout the plot. Defaults to size 12.
#'
#' @return A NICE styled ggplot2 object
#' @export
#'
#' @examples
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
#' nice_gg_theme(base_size = 12)

nice_gg_theme <- function(base_size = 12){

  font <- "Inter Regular"
  heading_font <- "Lora SemiBold"

  nice_theme <- ggplot2::theme(

    text = ggplot2::element_text(size = base_size),

    # Format the background ---------------------------------------------------

    # Remove the standard grey background
    panel.background = ggplot2::element_blank(),
    panel.border = ggplot2::element_blank(),


    # Format the title and subtitle -------------------------------------------

    plot.title = ggplot2::element_text(family = heading_font,
                                       size = ggplot2::rel(1.5),
                                       color = "#000000"),

    plot.subtitle = ggplot2::element_text(family = font,
                                          size = ggplot2::rel(1.2),
                                          margin = ggplot2::margin(0,0,15,0)),

    # Leave the caption empty, because we add this when finalizing the chart
    plot.caption = ggplot2::element_blank(),


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

    axis.ticks.x = ggplot2::element_line(linewidth = 1),
    axis.ticks.y = ggplot2::element_blank(),


    # Format the grid lines ---------------------------------------------------

    # Adjust major grid lines
    panel.grid.major.x = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(color = "#BFBFBF"),

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

  return(nice_theme)
}
