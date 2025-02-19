% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SCP-plot.R
\name{panel_fix}
\alias{panel_fix}
\title{Set the panel width/height of a plot object to a fixed value.}
\usage{
panel_fix(
  x = NULL,
  panel_index = NULL,
  respect = NULL,
  width = NULL,
  height = NULL,
  margin = 0.5,
  space = 0.1,
  units = "in",
  raster = FALSE,
  dpi = 300,
  return_grob = FALSE,
  bg_color = "white",
  save = NULL,
  verbose = TRUE,
  ...
)
}
\arguments{
\item{x}{A ggplot or grob object.}

\item{respect}{}

\item{width}{The width of the panel.}

\item{height}{The height of the panel.}

\item{margin}{Margins around the plot when \code{file} is specified.}

\item{units}{The units in which \code{height}, \code{width} and \code{margin} are given. Can be \code{mm}, \code{cm}, \code{inches}, etc. See \code{\link[grid]{unit}}.}

\item{save}{NULL or the file name to save.}
}
\value{
If \code{filename} is not specified, no return; otherwise return a list objects:
\itemize{
\item{\code{grob} An R object of class "grob", a graphical object.}
\item{\code{plot_size} Plot size after fixing the panel size and the margin.}
\item{\code{units} The units used.}
}
}
\description{
The ggplot object, when stored, can only specify the height and width of the plot, not the panel.
The latter is obviously more important to control the final result of a plot.
This function can set the panel width/height of plot to a fixed value.
The plot to be fixed can be a ggplot or a plot combined using plot_grid or patchwork functions.
}
\examples{
library(ggplot2)
p <- ggplot(data = mtcars, aes(x = mpg, y = wt, colour = cyl)) +
  geom_point() +
  facet_wrap(~gear, nrow = 2)
p_fix1 <- panel_fix(p, width = 5, height = 3, units = "cm")
p_fix1
p_fix2 <- panel_fix(p, width = 5, height = 3, units = "cm", raster = TRUE, dpi = 50)
p_fix2

## Save the plot with appropriate size
# plot_size <- attr(p_fix1, "size")
# ggsave(
#   filename = "p_fix.png", plot = p_fix1,
#   units = plot_size$units, width = plot_size$width, height = plot_size$height
# )

## or save the plot directly
# p_fix1 <- panel_fix(p, width = 5, height = 3, units = "cm", save = "p_fix.png")

data("pancreas_sub")
p1 <- ClassDimPlot(pancreas_sub, "Phase") # ggplot object
p2 <- ExpDimPlot(pancreas_sub, "Ins1") # ggplot object
p <- p1 / p2 # plot is generated by patchwork
panel_fix(p, height = 2)

library(cowplot)
p1 <- ClassDimPlot(pancreas_sub, c("Phase", "SubCellType"), label = TRUE) # plot is generated by plot_grid
p2 <- ExpDimPlot(pancreas_sub, "Ins1") + ExpDimPlot(pancreas_sub, "Ins2") # plot is generated by patchwork
p <- plot_grid(p1, p2, nrow = 2) # plot is generated by plot_grid
panel_fix(p, height = 2)
panel_fix(p, height = 2, raster = TRUE, dpi = 50)

ht1 <- GroupHeatmap(pancreas_sub,
  features = c(
    "Sox9", "Anxa2", "Bicc1", # Ductal
    "Neurog3", "Hes6", # EPs
    "Fev", "Neurod1", # Pre-endocrine
    "Rbp4", "Pyy", # Endocrine
    "Ins1", "Gcg", "Sst", "Ghrl" # Beta, Alpha, Delta, Epsilon
  ),
  group.by = c("CellType", "SubCellType"),
  show_row_names = TRUE
)
panel_fix(ht1$plot)
panel_fix(ht1$plot, raster = TRUE, dpi = 50)
panel_fix(ht1$plot, height = 5, width = 10, bg_color = "grey")

ht2 <- GroupHeatmap(pancreas_sub,
  features = c(
    "Sox9", "Anxa2", "Bicc1", # Ductal
    "Neurog3", "Hes6", # EPs
    "Fev", "Neurod1", # Pre-endocrine
    "Rbp4", "Pyy", # Endocrine
    "Ins1", "Gcg", "Sst", "Ghrl" # Beta, Alpha, Delta, Epsilon
  ),
  group.by = c("CellType", "SubCellType"),
  show_row_names = TRUE,
  nlabel = 5, height = 3, width = 6
)
panel_fix(ht2$plot)
panel_fix(ht2$plot, raster = TRUE, dpi = 50)
panel_fix(ht2$plot, height = 5, width = 10)

}
