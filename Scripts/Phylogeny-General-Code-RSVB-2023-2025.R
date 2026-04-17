#Note that this code was used for all ggtree-generated figures (all of Fig.4)
#Tree Visualization
library("treeio")
library("ggtree")
library("ape")
library(ggtreeExtra)
library(ggplot2)
library(RColorBrewer)

#note this is for newick files, if you need nexus, find it elsewhere
time_tree <- read.tree('/Users/estefanyguzman/Downloads/Phylogeny/Joint/2023-2025/RSVB/updated/011526-RSVB-NMH-LCH-USA-2023-2025.v3.nwk')
Global_Metadata <- read.csv('/Users/estefanyguzman/Downloads/Phylogeny/CPGME/RSV-B/General/2023-2025/121525-CPGME-RSVB-2023-2025.csv')
TreeData<-as.data.frame(time_tree$tip.label)

names(TreeData)[1]<-"name"

Global_Metadata_Tree<-merge(TreeData,Global_Metadata,by="name",sort = F)

rownames(Global_Metadata_Tree) <- Global_Metadata_Tree$name
#Global_Metadata_Tree_Clades<-as.data.frame(Global_Metadata_Tree%>%dplyr::select(Source))

#Setting the most recent sampling date if there is a temporal component to the tree
ggtree(time_tree,mrsd = "2025-03-01",as.Date = T)

#
palette1 <- brewer.pal(9, "Paired")
palette2 <- brewer.pal(9, "Set3")

palette <- c(palette1, palette2)
#

palette_custom <- c(
  "B.D"         = "#68C4A6",
  "B.D.1"       = "#7EE0BD",
  "B.D.1.1"     = "#A8F4D5",
  "B.D.4"       = "#F26330",
  "B.D.4.1"     = "#EF8665",
  "B.D.4.1.1"   = "#F2A691",
  "B.D.4.1.3"   = "#EDB7AB",
  "B.D.E.1"     = "#2A6596",
  "B.D.E.1.1"   = "#3380B5",
  "B.D.E.1.2"   = "#429ED1",
  "B.D.E.1.3"   = "#51C1F2",
  "B.D.E.1.4"   = "#78DCFF",
  "B.D.E.1.7"   = "#9EE6FF",
  "B.D.E.1.8"   = "#C5F1FF",
  "B.D.E.2"     = "#BC7FB7",
  "B.D.E.4"     = "#74CE72",
  "B.D.E.4.1.3" = "#74CE72",
  "B.D.E.5"     = "#F69999",
  "B.D.E.6"     = "#001999"
)

palette_status <- c(
  "pediatric"         = "#009999",
  "adult"         = "#0000FF"
)

palette_state <- c(
  "Illinois - NU"         = "#F46B5D"
)

palette <- c(palette_custom, palette_status, palette_state)

#Setting p as variable for tree (genetic diversity in this case)
p<-ggtree(time_tree,layout = "circular",)%<+% Global_Metadata_Tree +
  geom_tippoint(aes(color = Patient_status), size=8) +
  scale_color_manual(values = palette) +
  geom_treescale(x=0.003, y = 0.9)
p


a <- p + geom_fruit(
  geom = geom_tile,
  mapping = aes(fill = Lineage),
  width = .0015, offset = 0.15, show.legend = TRUE) +
  scale_fill_manual(values = palette)
a


b <- a + geom_fruit(
  geom = geom_tile,
  mapping = aes(fill = Patient_status),
  width = .0015, offset = 0.13, show.legend = TRUE) +
  scale_fill_manual(values = palette)
b

ggsave("/Users/estefanyguzman/Downloads/Phylogeny/CPGME/RSV-B/General/2023-2025/121525-CPGME-RSVB-2023-2025.pdf", plot = b, width = 20, height = 12, dpi = 1200)
