library(tidyverse)
library(ggpubr)

setwd("")
library(dplyr)

rsvb <- read.csv("/Users/estefanyguzman/Downloads/neighborhood_counts_and_residuals.csv") |>
  dplyr::select(neighborhood, observed) |>
  dplyr::rename(Neighborhood = neighborhood, Count = observed) |>
  dplyr::mutate(Cluster = 1, Subtype = "RSV-B")
rsva <- read.csv("/Users/estefanyguzman/Downloads/contingency_table.csv") |>
  dplyr::rename(Cluster = Var1, Neighborhood = Var2, Count = Freq) |>
  dplyr::mutate(Subtype = "RSV-A") |>
  dplyr::select(Cluster, Neighborhood, Count, Subtype)

combined <- rbind(rsva, rsvb)

p1 <- ggplot(combined, aes(x = Neighborhood, y = Cluster, fill = Count)) +
  geom_tile(color = "white", linewidth = 0.75) +
  geom_text(aes(label = Count), color = "white", fontface = "bold", size = 4) +
  scale_fill_gradient(low = "#e3e3e5", high = "#422977", name = "Count") +
  labs(
    x = "Geographic Group",
    y = "Genetic Cluster"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    plot.subtitle = element_text(size = 10, hjust = 0.5),
    axis.text = element_text(size = 11, hjust = 0.8),
    axis.title = element_text(size = 12),
    panel.grid = element_blank()
  )

facet(p1, facet.by = "Subtype", nrow = 2, scales = "fixed")

ggsave("combined_contingency_heatmap_ERG.pdf",
       width = 7, height = 6, dpi = 600
)
