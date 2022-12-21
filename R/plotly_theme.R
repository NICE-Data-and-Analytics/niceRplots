# Setup
if (!require(pacman)) install.packages("pacman")
pacman::p_load(tidyverse, plotly)

here::i_am("R/plotly_theme.R")

pacman::p_load(here)

# Load NICE colours
source(here("R", "load_nice_colours.R"))

nice_theme <- function(p,
                       title_text = "[Insert title]",
                       subtitle_text = "[Insert subtitle]",
                       horizontal = FALSE) {
  layout(p,
         font = list(family = "arial",
                     sze = 12),
         title = list(font = list(size = 24),
                      text = sprintf("<b>%s</b><br><span style='font-size: 14px'>%s</span>", title_text, subtitle_text)),
         margin = list(t = 80),
         xaxis = list(showgrid = horizontal),
         yaxis = list(showgrid = !horizontal))
}

economics_long %>%
  filter(variable != "pop") %>%
  plot_ly(x = ~date,
         y = ~value01,
         color = ~variable,
         colors = c("#00436C", "#D07B4D", "#000000", "#37906D"),
         type = "scatter",
         mode = "lines") %>%
  layout(title = list(text = "Example plot")) %>%
  nice_theme()

mpg %>%
  filter(manufacturer %in% c("hyundai", "nissan", "toyota")) %>%
  count(manufacturer) %>%
  plot_ly(y = ~manufacturer,
          x = ~n,
          color = ~manufacturer,
          type = "bar",
          orientation = "h") %>%
  nice_theme(horizontal = TRUE)

mpg %>%
  count(cyl) %>%
  plot_ly(y = ~cyl,
          x = ~n,
          type = "bar") %>%
  nice_theme()


# add source
# add NICE logo
# increase axis label font size
