# remotes::install_github("matt-dray/coloratio")

if (!require(pacman)) install.packages("pacman")

pacman::p_load(tidyverse, colorblindcheck)

library(coloratio)

# Import NICE colours
read_colours <- read_csv("R/nice_new_brand_colours.csv",
                         col_types = "cc")
# Create named vector
nice_colours <- read_colours$hex_code

names(nice_colours) <- read_colours$colour

# Contrast testing ------
# All combinations of colours
all_combos <- read_colours %>%
  expand(hex_code, hex_code) %>%
  rename(hex_code1 = hex_code...1,
         hex_code2 = hex_code...2) %>%
  mutate(colour1 = map_chr(hex_code1, ~ names(nice_colours[nice_colours == .x])),
         .before = hex_code1) %>%
  mutate(colour2 = map_chr(hex_code2, ~ names(nice_colours[nice_colours == .x])),
         .before = hex_code2) %>%
  # Remove duplicates
  # filter(!duplicated(paste0(pmax(hex_code1, hex_code2), pmin(hex_code1, hex_code2)))) %>%
  mutate(contrast = map2_dbl(hex_code1, hex_code2, ~ cr_get_ratio(.x, .y)))

# Filter for combos with contrast greater than three
three_or_more <- all_combos %>%
  filter(contrast >= 3)

# Number of satisfactory combos per colour
print(three_or_more %>%
        count(colour1, hex_code1) %>%
        arrange(desc(n)),
      n = 40)

# Test palette for colour blindness
# https://projects.susielu.com/viz-palette?colors=[%22#00436c%22,%22#d07b4d%22,%22#000000%22,%22#37906d%22]&backgroundColor=%22#ffffff%22&fontColor=%22black%22&mode=%22normal%22

nice_palettes <- list(
  discrete_4 = nice_colours[c("deep_blue_100",
                            "natural_tan_100",
                            "black_75",
                            "balanced_green_100")])

palette_check(nice_palettes[["discrete_4"]], plot = T)

write_csv(all_combos, "R/output/all_combos.csv")
write_csv(three_or_more, "R/output/contrast_three_or_more_combos.csv")
