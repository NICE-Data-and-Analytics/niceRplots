% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nice_plotly_theme.R
\name{nice_plotly_theme}
\alias{nice_plotly_theme}
\title{Apply NICE Plotly theme}
\usage{
nice_plotly_theme(
  p,
  x_title = "[x axis title]",
  y_title = "[y axis title]",
  font_size = 16,
  grid_lines = "y",
  axis_lines = "x",
  axis_ticks = "x",
  show_legend = TRUE,
  panel_border = FALSE
)
}
\arguments{
\item{p}{Plotly chart object.}

\item{x_title, y_title}{String to use as x or y axis title. Defaults to
\code{"[x axis title]"} and \code{"[y axis title]"} respectively.}

\item{font_size}{Minimum font size in px. Default is \code{16}.}

\item{grid_lines}{determines which major grid lines are shown:
\itemize{
\item \code{"y"} (default): show y axis grid lines
\item \code{"x"}: show x axis grid lines
\item \code{"both"}: show both x and y axis grid lines
\item \code{"none"}: remove grid lines
}}

\item{axis_lines}{determines which axis lines are shown:
\itemize{
\item \code{"x"} (default): show x axis line
\item \code{"y"}: show y axis line
\item \code{"both"}: show both x and y axis lines
\item \code{"none"}: remove axis lines
}}

\item{axis_ticks}{determines which axis ticks are shown:
\itemize{
\item \code{"x"} (default): show ticks on x axis
\item \code{"y"}: show ticks on y axis
\item \code{"both"}: show ticks on both x and y axis
\item \code{"none"}: remove ticks
}}

\item{show_legend}{Option to remove the chart legend. If \code{TRUE} (default), the legend
will be present above the chart. If set to \code{FALSE}, the legend will be removed.}

\item{panel_border}{Option to add a panel border. If \code{FALSE} (default), no border
will be present. If set to \code{TRUE}, a panel border will be added.}
}
\value{
A Plotly chart object.
}
\description{
\code{nice_plotly_theme()} applies a NICE theme to a Plotly chart object. It makes
some basic changes, including:
\itemize{
\item Changing the font to Inter Regular
\item Setting the minimum font size
\item Reminds users to edit the x and y axis titles
\item Provides options to adjust the grid lines, axis lines and axis ticks
\item Removes icons from the default Plotly tool bar
}
}
\examples{
# Load data
iris_bar_df <- iris \%>\%
   group_by(Species) \%>\%
   summarise(Sepal_Width = mean(Sepal.Width)) \%>\%
   ungroup()

# Create formatted chart
plot_ly(iris_bar_df,
   x = ~Species,
   y = ~Sepal_Width,
   type = "bar",
   marker = list(color = nice_cols("bold_teal_100"),
                 line = list(color = nice_cols("black_100"), width = 1.5))) \%>\%
   # Apply NICE theme
   nice_plotly_theme(x_title = "Species",
                     y_title = "Sepal Width")
}
