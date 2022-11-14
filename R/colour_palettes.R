library(unikn)
library(tidyverse)

# Create colour palette
nice_distinct <- c("#228096", # Bold teal
                   "#DED5CA", # Soft cream
                   "#37906D", # Balanced green
                   "#D07B4D", # Natural tan
                   "#EAD054", # Positive yellow
                   "#000000", # Black
                   "#00436C") # Deep blue

# Name colours to display with seecol()
see_distinct <- newpal(col = nice_distinct,
                        names = c("Bold teal",
                                  "Soft cream",
                                  "Balanced green",
                                  "Natural tan",
                                  "Positive yellow",
                                  "Black",
                                  "Deep blue"))

# Display colour palette
seecol(see_distinct)

# Test plot
# SOft cream is hard to see in line charts
economics_long %>%
    ggplot(aes(x = date, y = value01, colour = variable)) +
    geom_line() +
    scale_colour_manual(values = nice_distinct) +
    theme_bw()
