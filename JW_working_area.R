library(devtools)
library(dplyr)
library(ggplot2)

load_all()

doacs_df <- readr::read_csv("data/DOACs_data.csv")

# Histogram ---------------------------------------------------------------

### Options from ONS cookbook ###

## Done
#- maintained a consistent font
#- gridlines should be light gra




## Not done
#- Keep axis font same size as surrounding text
#- Generally between 4 and 8 grid lines per chart
#-
#-
#-
#-
