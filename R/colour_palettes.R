library(unikn)
library(tidyverse)

nice_distinct <- c("#228096", # Bold teal
                   "#DED5CA", # Soft cream
                   "#37906D", # Balanced green
                   "#D07B4D", # Natural tan
                   "#EAD054", # Positive yellow
                   "#000000", # Black
                   "#00436C") # Deep blue

see_distinct <- newpal(col = nice_distinct,
                        names = c("Bold teal",
                                  "Soft cream",
                                  "Balanced green",
                                  "Natural tan",
                                  "Positive yellow",
                                  "Black",
                                  "Deep blue"))

seecol(see_distinct)

# SOft cream is hard to see in line charts

economics_long %>%
    ggplot(aes(x = date, y = value01, colour = variable)) +
    geom_line() +
    scale_colour_manual(values = nice_distinct) +
    theme_bw()
