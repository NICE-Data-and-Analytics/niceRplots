
<!-- README.md is generated from README.Rmd. Please edit that file -->

# niceRplots

<!-- badges: start -->
<!-- badges: end -->

This repository contains the functions of the `niceRplots` package,
which provides functions to create graphics in the NICE style, inspired
by the similar [bbplot](https://github.com/bbc/bbplot) package. These
functions can be used to style static charts created using `ggplot2`, or
interactive charts created using `plotly`.

Examples of plots created using the nicerplots package can be found in
the niceRplots cookbook.

## Installation

`niceRplots` is not on CRAN, so you will have to install it directly
from [GitHub](https://github.com/) using the `devtools` package.

If you do not have the `devtools` package installed, you will have to
run the first line in the code below as well.

``` r
# install.packages("devtools")
devtools::install_github("GitWray1/niceRplots")
```

## Functions to style `ggplot2` charts

The package has two functions to style ggplot2 charts: `nice_gg_theme()`
and `finalise_plot()`.

A basic explanation for each is as follows

### `nice_gg_theme()`

1.  `nice_gg_theme(legend, xlabel, border, vgrid)`:

The function arguments are as follows: `nice_gg_theme(plot_name, )`

-   `legend`:
-   `xlabel`:
-   `border`:
-   `vgrid`:

### `finalise_plot`

2.  `finalise_plot`: will save out your plot with the correct guidelines
    for publication for a BBC News graphic. It is made up of functions
    that will left align your title, subtitle and source, add the BBC
    blocks at the bottom right and save it to your specified location.
    The function has six arguments, three of which need to be explicitly
    set and three that are defaults unless you overwrite them.

Here are the function arguments:
`finalise_plot(plot_name, source_name, save_filepath, width_pixels, height_pixels, logo_image_path)`

-   `plot_name`: the variable name that you have called your plot, for
    example for the chart example above `plot_name` would be `"line"`  
-   `source_name`: the source text that you want to appear at the bottom
    left corner of your plot. You will need to type the word `"Source:"`
    before it, just the source, so for example `source = "Source: ONS"`
    would be the right way to do that.
-   `save_filepath`: the precise filepath that you want your graphic to
    save to, including the `.png` extension at the end. This does depend
    on your working directory and if you are in a specific R project. An
    example of a relative filepath would be: `/charts/line_chart.png`.  
-   `width_pixels`: this is set to 640px by default, so only call this
    argument and specify the width you want your chart to be.
-   `height_pixels`: this is set to 450px by default, so only call this
    argument and specify the height you want your chart to be.
-   `logo_image_path`: this argument specifies the path for the
    image/logo in the bottom right corner of the plot. The default is
    for a placeholder PNG file with a background that matches the
    background colour of the plot, so do not specify the argument if you
    want it to appear without a logo. If you want to add your own logo,
    just specify the path to your PNG file. The package has been
    prepared with a wide and thin image in mind.

``` r
library(niceRplots)
## basic example code
```
