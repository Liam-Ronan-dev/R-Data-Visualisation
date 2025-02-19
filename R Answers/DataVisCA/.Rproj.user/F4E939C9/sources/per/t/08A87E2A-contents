library(ggplot2)
library(plotly)

my_colors <- c("#75DDDD", "#E9B44C")

influenzaJitterplot <- ggplot(Influenza, aes(x = Gender, y = Age, fill = Gender)) + geom_jitter() +
  scale_fill_manual(values = my_colors) +
  facet_grid(Influenza$Disease ~ `Patient Type`) +
  theme_dark() +
  labs(title = "Jitter Plot comparing gender by disease")

ggplotly(influenzaJitterplot)