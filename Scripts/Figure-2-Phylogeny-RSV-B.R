library(tidyverse)
library(treeio)
library(ggtree)
library(ggtreeExtra)
library(ape)
library(TreeTools)
library(scales)

setwd("")

#Loading Bayesian Tree
tree <- read.beast("/Users/estefanyguzman/Downloads/rsvb_tree (1).tree")

#Loading Metadata
metadata <- read.csv("/Users/estefanyguzman/Desktop/adult_pediatric_RSV_transmission_cluster/RSV-B/seqs-with-age-metadata/adult-ped-USA/121025-RSVB-CPGME-USA-metadata.csv")

metadata <- metadata %>% rename(ID = Virus.name)

meta <- tree |>
  dplyr::filter(isTip == TRUE) |>
  dplyr::select(label) |>
  dplyr::distinct()

meta[c("Sequence", "Date", "Group")] <- str_split_fixed(
  meta$label,
  "\\|",
  3
)

tree_meta <- left_join(meta, as.data.frame(as_tibble(tree)), by = "label")

tree_meta_ammend <- tree_meta %>%
  mutate(ID = sub("\\|.*", "", label))

tree_meta_ammend2 <- tree_meta_ammend %>%
  left_join(metadata, by = "ID")





p <- ggtree(
  tree,
  options(ignore.negative.edge = TRUE),
  alpha = 0.8,
  mrsd = "2025-03-03"
) %<+% tree_meta_ammend2 +
  geom_tippoint(aes(color = location),
                show.legend = TRUE,
                alpha = 0.8
  ) +
  geom_nodepoint(aes(color = location, size = as.numeric(location.prob))) +
  theme_tree2() +
  labs(color = "Group") +
  scale_size_continuous(name = "Posterior Prob.", range = c(0.2, 4)) +
  xlim(2020, 2026.5)

p

ggsave("/Users/estefanyguzman/Downloads/041426-RSVB-Bayesian-USA-location-prob.pdf", plot = p, width = 6, height = 10, dpi = 600)

ggsave("bdsky/rsvb_group_tree.pdf", height = 15, width = 8)