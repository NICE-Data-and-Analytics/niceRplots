
nice_colours <- c("bold_teal_100" = "#228096",
                  "bold_teal_75" = "#59A0B0",
                  "bold_teal_50" = "#91C0CB",
                  "bold_teal_25" = "#C8E0E6",
                  "soft_cream_100" = "#DED5CA",
                  "soft_cream_75" = "#E6E0D7",
                  "soft_cream_50" = "#EEEAE4",
                  "soft_cream_25" = "#F7F4F1",
                  "deep_blue_100" = "#00436C",
                  "deep_blue_75" = "#407291",
                  "deep_blue_50" = "#80A1B5",
                  "deep_blue_25" = "#BFD0DA",
                  "black_100" = "#000000",
                  "black_75" = "#404040",
                  "black_50" = "#808080",
                  "black_25" = "#BFBFBF",
                  "positive_yellow_100" = "#EAD054",
                  "positive_yellow_75" = "#EFDC7F",
                  "positive_yellow_50" = "#F4E8AA",
                  "positive_yellow_25" = "#FAF3D4",
                  "warm_pink_100" = "#EDD8CD",
                  "warm_pink_75" = "#F2E2D9",
                  "warm_pink_50" = "#F6ECE6",
                  "warm_pink_25" = "#FBF5F2",
                  "balanced_green_100" = "#37906D",
                  "balanced_green_75" = "#69AC91",
                  "balanced_green_50" = "#9BC8B6",
                  "balanced_green_25" = "#CDE3DA",
                  "natural_tan_100" = "#D07B4D",
                  "natural_tan_75" = "#DC9C7A",
                  "natural_tan_50" = "#E7BDA6",
                  "natural_tan_25" = "#F3DED3",
                  "white_100" = "#FFFFFF")

gaf_colours <- c("dark blue" = "#12436D",
                 "turquoise" = "#28A197",
                 "dark pink" = "#801650",
                 "orange" = "#F46A25",
                 "dark grey" = "#3D3D3D",
                 "light purple" = "#A285D1",
                 "dark blue" = "#12436D",
                 "mid blue" = "#2073BC",
                 "light blue" = "#6BACE6")


# Set up palettes ---------------------------------------------------------

nice_palettes <- list(

  "cat"  = nice_colours[c("bold_teal_100",
                          "natural_tan_100",
                          "balanced_green_100",
                          "deep_blue_100")],

  "seq" = nice_colours[c("black_25",
                         "deep_blue_100")],

  "div" = nice_colours[c("deep_blue_100",
                         "black_25",
                         "positive_yellow_100")],

  "cat_gaf" = gaf_colours[c("dark blue",
                            "turquoise",
                            "dark pink",
                            "orange",
                            "dark grey",
                            "light purple")],

  "seq_gaf" = gaf_colours[c("dark blue",
                            "mid blue",
                            "light blue")]
)


# Function to select individual colours -----------------------------------

#' Select NICE brand colours
#'
#' @description
#' `nice_cols()` is used to select individual colours from the NICE brand colours.
#'
#' @param ... Colour names
#'
#' @returns A named vector containing specified colours
#' @export
#'
#' @examples
#' library(niceRplots)
#'
#' nice_cols()
#' nice_cols("black_25")
#' nice_cols("bold_teal_100")
#' nice_cols("bold_teal_100", "deep_blue_100")
nice_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (nice_colours)

  return(nice_colours[cols])
}


# Function to select a palette --------------------------------------------

#' Select NICE palettes
#'
#' @description
#' `nice_pal()` is used to select a NICE palette for use in charts
#'
#' @param palette name of palette to return.
#' - `"cat"` (default): Categorical palette using NICE brand colours.
#' - `"seq"`: Sequential palette using NICE brand colours.
#' - `"div"`: Diverging palette using NICE brand colours.
#' - `"cat_gaf"`: Categorical palette using Government Analysis Function colours.
#' - `"seq_gaf"`: Sequential palette using Government Analysis Function colours.
#' @param reverse option to reverse palette. Default is `FALSE`.
#'
#' @returns A vector containing hex colours for the selected palette
#' @export
#'
#' @examples
#' library(niceRplots)
#'
#' nice_pal("cat")
#' nice_pal("div", reverse = TRUE)
#' nice_pal("seq")
#' nice_pal("cat_gaf", reverse = TRUE)
#' nice_pal("seq_gaf")
nice_pal <- function(palette = "cat", reverse = FALSE) {
  pal <- nice_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  unname(pal)
}
