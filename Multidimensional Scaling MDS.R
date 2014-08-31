setwd('C:\\Users\\Ivan.Liuyanfeng\\Desktop\\Data_Mining_Work_Space\\rdatamining')
url <- "http://rosetta.reltech.org/TC/v15/Mapping/data/dist-Aus.csv"
dist.au <- read.csv(url)
dist.au
row.names(dist.au) <- dist.au[, 1]
dist.au <- dist.au[, -1]
dist.au

fit <- cmdscale(dist.au, eig = TRUE, k = 2)
x <- fit$points[, 1]
y <- fit$points[, 2]

plot(x, y, pch = 19, xlim = range(x) + c(0, 600))
city.names <- c("Adelaide", "Alice Springs", "Brisbane", "Darwin", "Hobart", 
                "Melbourne", "Perth", "Sydney")
text(x, y, pos = 4, labels = city.names)

x <- 0 - x
y <- 0 - y
png('MDS_1.png')
plot(x, y, pch = 19, xlim = range(x) + c(0, 600))
text(x, y, pos = 4, labels = city.names)
dev.off()

library(igraph)
g <- graph.full(nrow(dist.au))
V(g)$label <- city.names
layout <- layout.mds(g, dist = as.matrix(dist.au))
png('MDS_igraph.png')
plot(g, layout = layout, vertex.size = 3)
dev.off()