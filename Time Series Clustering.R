setwd('C:\\Users\\Ivan.Liuyanfeng\\Desktop\\Data_Mining_Work_Space\\rdatamining')
# Dynamic Time Warping
library(dtw)
idx <- seq(0, 2*pi, len=100)
a <- sin(idx) + runif(100)/10
b <- cos(idx)
align <- dtw(a, b, step=asymmetricP1, keep=T)
png('ts-clustering.png')
dtwPlotTwoWay(align)
dev.off()

