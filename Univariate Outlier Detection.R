setwd('C:\\Users\\Ivan.Liuyanfeng\\Desktop\\Data_Mining_Work_Space\\rdatamining')
set.seed(3147)
x <- rnorm(100)
summary(x)
boxplot.stats(x)$out
boxplot(x)
y <- rnorm(100)
df <- data.frame(x, y)
rm(x, y)
head(df)
attach(df)
# find the index of outliers from x
(a <- which(x %in% boxplot.stats(x)$out))
# find the index of outliers from y
(b <- which(y %in% boxplot.stats(y)$out))
detach(df)
# outliers in both x and y
png('outlier-boxplot-stats.png')
par(mfcol=c(1,2))
(outlier.list1 <- intersect(a,b))
plot(df)
points(df[outlier.list1,], col="red", pch="+", cex=2.5)

(outlier.list2 <- union(a,b))
plot(df)
points(df[outlier.list2,], col="blue", pch="x", cex=2)
dev.off()