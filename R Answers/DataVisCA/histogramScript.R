library(ggplot2)
library(plotly)

my_colors <- c("#98C1D9")

influenzaHistogram <- ggplot(Influenza, aes(x = Age, fill = Gender)) + geom_histogram() +
  facet_grid(Influenza$Disease ~ `Patient Type`) +
  labs(title = "Histogram comparing gender by disease") +
  theme_dark()

ggplotly(influenzaHistogram)