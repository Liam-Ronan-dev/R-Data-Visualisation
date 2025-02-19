library(ggplot2)
library(ggmosaic)
library(plotly)

# Adjust order to match my drawing
Insurance$Policy <- factor(Insurance$Policy, levels = c("third party fire and theft", "Comprehensive"))

# mosaic plot
p <- ggplot(data = Insurance) +
  geom_mosaic(aes(weight = Exposure, x = product(Company), fill = Policy)) +
  scale_fill_manual(values = c("third party fire and theft" = "#009FFD", "Comprehensive" = "#FBBFCA")) +
  theme_classic() +
  labs(title = "Insurance Policy Distribution by Company Size",
       x = "Company",
       y = "Exposure")
ggplotly(p)

