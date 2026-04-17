library(tidyverse)
library(treeio)
library(ggtree)
library(ggtreeExtra)
library(ape)
library(TreeTools)
library(scales)
library(dplyr)
library("treeio")
library("ggtree")
library("ape")
library(ggtreeExtra)
library(ggplot2)
library(RColorBrewer)

setwd("")

tree <- read.beast("/Users/estefanyguzman/Downloads/rsva_tree (1).tree")
metadata <- read.csv("/Users/estefanyguzman/Desktop/adult_pediatric_RSV_transmission_cluster/RSV-A/seqs-with-age-metadata/combined/121025-RSVA-CPGME-USA-metadata.csv")

metadata <- metadata %>% rename(ID = Virus.name)


meta <- tree |>
  dplyr::filter(isTip == TRUE) |>
  dplyr::select(label) |>
  dplyr::distinct()


tree_meta <- left_join(meta, as.data.frame(as_tibble(tree)), by = "label")
#-------------------------



tree_meta_ammend <- tree_meta %>%
  mutate(ID = sub("\\|.*", "", label))

tree_meta_ammend2 <- tree_meta_ammend %>%
  left_join(metadata, by = "ID")


p <- ggtree(
  tree,
  options(ignore.negative.edge = TRUE),
  alpha = 0.8,
  mrsd = "2025-03-21"
) %<+% tree_meta_ammend2 +
  geom_tippoint(aes(color = location),
                show.legend = TRUE,
                alpha = 0.8
  ) +
  geom_nodepoint(aes(color = location, size = as.numeric(location.prob))) +
  theme_tree2() +
  labs(color = "Group") +
  scale_size_continuous(name = "Posterior Prob.", range = c(0.2, 4)) +
  xlim(c(2018, 2026.8))

p

palette_custom <- c(
  "A"         = "#F46B5D",
  "A.3.1.1"   = "#EC5DA0",
  "A.D"       = "#2F6154",
  "A.D.1"     = "#3F7661",
  "A.D.1.1"   = "#459D79",
  "A.D.1.2"   = "#54A98A",
  "A.D.1.3"   = "#65B79B",
  "A.D.1.4"   = "#75C8AA",
  "A.D.1.5"   = "#84D7B7",
  "A.D.1.6"   = "#6FDDC0",
  "A.D.1.7"   = "#94E5CE",
  "A.D.1.8"   = "#B2E3D7",
  "A.D.2"     = "#8C513D",
  "A.D.2.1"   = "#A65D45",
  "A.D.2.2"   = "#C06753",
  "A.D.2.2.1" = "#E27E5D",
  "A.D.3"     = "#75577B",
  "A.D.3.1"   = "#845B8F",
  "A.D.3.2"   = "#9570A2",
  "A.D.3.3"   = "#AB82B8",
  "A.D.3.4"   = "#C896D1",
  "A.D.3.5"   = "#E1A7EA",
  "A.D.4"     = "#3F9295",
  "A.D.4.1"   = "#47B3B3",
  "A.D.5"     = "#6C6992",
  "A.D.5.1"   = "#7F78A7",
  "A.D.5.2"   = "#8C88BA",
  "A.D.5.3"   = "#A3A3DA"
)

p <- ggtree(
  tree,
  options(ignore.negative.edge = TRUE),
  alpha = 0.8,
  mrsd = "2025-03-21"
) %<+% tree_meta_ammend2 +
  geom_tippoint(aes(color = Lineage),
                show.legend = TRUE,
                alpha = 0.8
  ) +
  scale_color_manual(values = palette_custom) +   # <-- custom palette
  geom_nodepoint(aes(color = Lineage, size = as.numeric(posterior))) +
  theme_tree2() +
  labs(color = "Group") +
  scale_size_continuous(name = "Posterior Prob.", range = c(0.2, 4)) +
  geom_cladelab(node = 472, label = "Cluster 1", align = TRUE, offset = -40, offset.text = -20) +
  geom_cladelab(node = 434, label = "Cluster 2", align = TRUE, offset = -40, offset.text = -20) +
  geom_cladelab(node = 723, label = "Cluster 3", align = TRUE, offset = -40, offset.text = -20) +
  geom_cladelab(node = 650, label = "Cluster 4", align = TRUE, offset = -40, offset.text = -20) +
  xlim(c(2013.5, 2026.8))

p


ggsave("/Users/estefanyguzman/Downloads/041426-RSVA-Bayesian-USA-location-prb.pdf", plot = p, width = 6, height = 10, dpi = 600)

ggsave("bdsky/rsvb_group_tree.pdf", height = 15, width = 8)