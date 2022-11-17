#' nice_gg_theme
#'
#' @return
#' @export
#'
#' @examples
#' line_chart <- ggplot(line_df, aes(x = year, y = people)) +
#' geom_line(colour = "#228096") +
#' nice_gg_style()

nice_gg_simple <- function(){

  font <- "Inter"
  heading_font <- "Lora SemiBold"

  nice_theme <- ggplot2::theme(

    # Format the background ---------------------------------------------------

    # Remove the standard grey background
    panel.background = ggplot2::element_blank(),
    panel.border = ggplot2::element_blank(),


    # Format the title and subtitle -------------------------------------------

    plot.title = ggplot2::element_text(family = heading_font,
                                       size = 18,
                                       color = "#000000"),

    plot.subtitle = ggplot2::element_text(family = font,
                                          size = 14,
                                          margin = ggplot2::margin(0,0,15,0)),

    # Leave the caption empty, because we add this when finalizing the chart
    plot.caption = ggplot2::element_blank(),


    # Format the axes ---------------------------------------------------------

    axis.title.x = ggplot2::element_text(family = font,
                                         size = 12,
                                         color = "#000000",
                                         margin = ggplot2::margin(t = 8)),

    axis.title.y = ggplot2::element_text(family = font,
                                         size = 12,
                                         color = "#000000",
                                         margin = ggplot2::margin(r = 8)),

    axis.text = ggplot2::element_text(family = font,
                                      size = 12,
                                      color = "#000000"),

    axis.ticks.x = ggplot2::element_line(linewidth = 1),
    axis.ticks.y = element_blank(),


    # Format the grid lines ---------------------------------------------------

    # Adjust major grid lines
    panel.grid.major.x = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(color = "#BFBFBF"),

    # Adjust minor grid lines
    panel.grid.minor = ggplot2::element_blank(),


    # Format the legend -----------------------------------------------------

    legend.position = "right",
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(family = font,
                                        size = 12,
                                        color = "#000000"),
    legend.text.align = 0,


    # Set up faceting options ------------------------------------------------

    # Set the background of the facet titles to NICE teal
    strip.background = ggplot2::element_rect(fill = "#228096",
                                             color = "#000000",
                                             size = 1,
                                             linetype = "solid"),

    # Make the facet title text white
    strip.text = ggplot2::element_text(family = font,
                                       size  = 12,
                                       hjust = 0.5,
                                       color = "#FFFFFF"),

    # Adjust plot spacing -----------------------------------------------------

    # Add spacing around the plot
    plot.margin = margin(0.25, 0.25, 0.25, 0.25,"cm")

  )

  return(nice_theme)
}
