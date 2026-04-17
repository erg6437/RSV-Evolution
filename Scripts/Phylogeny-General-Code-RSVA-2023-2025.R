#Note that this code was used for all ggtree-generated figures (all of Fig.4)
#Tree Visualization

library("treeio")
library("ggtree")
library("ape")
library(ggtreeExtra)
library(ggplot2)
library(RColorBrewer)

#note this is for newick files, if you need nexus, find it elsewhere
time_tree <- read.tree('/Users/estefanyguzman/Downloads/Phylogeny/CPGME/RSV-A/Pediatric/110725-RSVA-NMH-LCH-peds.mafft.nwk')
Global_Metadata <- read.csv("/Users/estefanyguzman/Downloads/111325_RSVA_NMH-LCH-metadata.csv")
TreeData<-as.data.frame(time_tree$tip.label)

names(TreeData)[1]<-"seqName"

Global_Metadata_Tree<-merge(TreeData,Global_Metadata,by="seqName",sort = F)

rownames(Global_Metadata_Tree) <- Global_Metadata_Tree$name
#Global_Metadata_Tree_Clades<-as.data.frame(Global_Metadata_Tree%>%dplyr::select(Source))

#Setting the most recent sampling date if there is a temporal component to the tree
ggtree(time_tree,mrsd = "2018-01-1",as.Date = T)

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
  "A.D.5.3"   = "#A3A3DA",
  "A.D.1.10" = "#7AC17A",
  "A.D.1.11" = "#729B70",
  "A.D.1.9" = "#D6EDE9",
  "A.D.3.10" = "#F9CDE1",
  "A.D.3.12" = "#F9EDF3",
  "A.D.3.7" = "#C9A1C1",
  "A.D.3.9" ="#DDA8D3"
)

palette_state <- c(
  "AZ" = "#A6CEE2",
  "CT" = "#2179B4",
  "IL - NU" = "#613E98",
  "MI" = "#36A047",
  "MN" = "#F6999A",
  "NY" = "#E21F26",
  "OR" = "#FDBF6F",
  "TX" ="#F57F20",
  "WA" = "#CAB3D6"
)
palette1 <- brewer.pal(9, "Paired")

#Setting p as variable for tree (genetic diversity in this case)
p<-ggtree(time_tree,layout = "circular",)%<+% Global_Metadata_Tree +
  geom_tippoint(aes(color = USA), size=2) +
  scale_color_manual(values = palette_state) +
  geom_treescale(x=0.003, y =0.9)
p 

#aes(color = escape)

a <- p + geom_fruit(
  geom = geom_tile,
  mapping = aes(fill = clade),
  width = 0.0042, offset = 0.18, show.legend = TRUE) +
  scale_fill_manual(values = palette_custom)

a

palette1 <- brewer.pal(9, "Paired")
palette2 <- brewer.pal(9, "Set3")
palette3 <- brewer.pal(8, "Set2")

palette <- c(palette1, palette2, palette_custom)

b <- a + geom_fruit(
  geom = geom_tile,
  mapping = aes(fill = G_clade),
  width = 0.0042, offset = 0.18, show.legend = TRUE) +
  scale_fill_manual(values = palette) + geom_tippoint() 

b

ggsave("/Users/estefanyguzman/Downloads/Phylogeny/CPGME/RSV-A/110325-USA-RSV-A-only-state.pdf", plot = p, width = 10, height = 6, dpi = 600)
