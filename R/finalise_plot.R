
# Helper functions --------------------------------------------------------

#Left align text
left_align <- function(plot_name, pieces){
  grob <- ggplot2::ggplotGrob(plot_name)
  n <- length(pieces)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}


create_footer <- function (source_name, logo_image_path) {

  #Make the footer
  footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"),
                                           y = grid::unit(1.1, "npc")),
                           grid::textGrob(source_name,
                                          x = 0.004, hjust = 0,
                                          gp = grid::gpar(fontsize = 12,
                                                          fontfamily = "Inter Regular")),
                           grid::rasterGrob(png::readPNG(logo_image_path), x = 0.944))
  return(footer)
}


# Finalise plot function --------------------------------------------------

#' Finalise a plot
#'
#' This function will format your plot and add a footer containing the data source and a NICE logo.
#' It will left align your title, subtitle and source, add the NICE logo to the bottom right.
#'
#' @param plot_name A ggplot2 object
#' @param source_name The source of the data within the plot
#' @param logo A string of either "NICE" to include the NICE logo in the footer,
#' or "none" to include a blank placeholder. defaults to "NICE"
#'
#' @return A formatted ggplot2 object
#' @export
#'
#' @examples
#' my_plot <- ggplot2::ggplot()
#'
#' finalise_plot(plot_name = my_plot,
#' source_name = "My data source",
#' logo = "NICE")

finalise_plot <- function(plot_name,
                          source_name,
                          logo = "NICE") {

  if (logo == "NICE"){
    logo_image_path <- file.path(system.file("extdata", package = 'niceRplots'),"NICE_short_logo_black.png")
  } else if (logo == "none") {
    logo_image_path <- file.path(system.file("extdata", package = 'niceRplots'),"placeholder.png")
  } else {
    stop('Logo should have a value of "NICE" or "none"')
  }

  source_name <- paste0("Source: ", source_name)

  footer <- create_footer(source_name, logo_image_path)

  #Draw your left-aligned grid
  plot <- left_align(plot_name, c("subtitle", "title", "caption"))
  plot <- ggpubr::ggarrange(plot, footer,
                            ncol = 1, nrow = 2,
                            heights = c(1, 0.045/(450/450)))

  return(plot)
}

