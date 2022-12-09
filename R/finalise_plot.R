
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
                                          gp = grid::gpar(fontsize=12,
                                                          fontfamily = "Inter")),
                           grid::rasterGrob(png::readPNG(logo_image_path), x = 0.944))
  return(footer)
}


# Finalise plot function --------------------------------------------------

finalise_plot <- function(plot_name,
                          source_name,
                          logo = "NICE") {

  if (logo == "NICE"){
    logo_image_path <- file.path(system.file("data", package = 'niceRplots'),"NICE_short_logo_black.png")
  } else if (logo == "none") {
    logo_image_path <- file.path(system.file("data", package = 'niceRplots'),"placeholder.png")
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

