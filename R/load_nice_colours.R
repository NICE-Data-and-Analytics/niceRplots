if (!require(pacman)) install.packages("pacman")
pacman::p_load(tidyverse)

read_colours <- as_tibble(read.csv(text = "colour,hex_code
bold_teal_100,#228096
bold_teal_75,#59A0B0
bold_teal_50,#91C0CB
bold_teal_25,#C8E0E6
soft_cream_100,#DED5CA
soft_cream_75,#E6E0D7
soft_cream_50,#EEEAE4
soft_cream_25,#F7F4F1
deep_blue_100,#00436C
deep_blue_75,#407291
deep_blue_50,#80A1B5
deep_blue_25,#BFD0DA
black_100,#000000
black_75,#404040
black_50,#808080
black_25,#BFBFBF
positive_yellow_100,#EAD054
positive_yellow_75,#EFDC7F
positive_yellow_50,#F4E8AA
positive_yellow_25,#FAF3D4
warm_pink_100,#EDD8CD
warm_pink_75,#F2E2D9
warm_pink_50,#F6ECE6
warm_pink_25,#FBF5F2
balanced_green_100,#37906D
balanced_green_75,#69AC91
balanced_green_50,#9BC8B6
balanced_green_25,#CDE3DA
natural_tan_100,#D07B4D
natural_tan_75,#DC9C7A
natural_tan_50,#E7BDA6
natural_tan_25,#F3DED3
white_100,#FFFFFF"))

nice_colours <- read_colours$hex_code

names(nice_colours) <- read_colours$colour

nice_palettes <- list(
  discrete_4 = nice_colours[c("deep_blue_100",
                              "natural_tan_100",
                              "black_100",
                              "balanced_green_100")])
