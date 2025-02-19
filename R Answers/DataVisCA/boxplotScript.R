library(ggplot2)
library(plotly)

my_colors <- c("#F67E7D", "#C0E0DE")

influenzaBoxplot <- ggplot(Influenza, aes(x = Gender, y = Age, fill = Gender)) + geom_boxplot() +
  scale_fill_manual(values = my_colors) + 
  facet_grid(Influenza$Disease ~ `Patient Type`) +
  theme_dark() +
  labs(title = "Boxplot comparing gender by disease")

ggplotly(influenzaBoxplot)





