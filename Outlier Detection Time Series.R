setwd('C:\\Users\\Ivan.Liuyanfeng\\Desktop\\Data_Mining_Work_Space\\rdatamining')
# use robust fitting
f <- stl(AirPassengers, "periodic", robust=TRUE)
(outliers <- which(f$weights<1e-8))
# set layout
op <- par(mar=c(0, 4, 0, 3), oma=c(5, 0, 4, 0), mfcol=c(4, 1))
png('outlier-time-series.png')
plot(f, set.pars=NULL)
sts <- f$time.series
# plot outliers
points(time(sts)[outliers], 0.8*sts[,"remainder"][outliers], pch="x", col="red")
dev.off()
par(op) # reset layout
