setwd('C:\\Users\\Ivan.Liuyanfeng\\Desktop\\Data_Mining_Work_Space\\rdatamining')
library(fpc)
iris2 <-iris
iris2$Species <- NULL
pamk.result <- pamk(iris2)
# number of clusters
pamk.result$nc
# check clustering against actual species
table(pamk.result$pamobject$clustering, iris$Species)
layout(matrix(c(1,2),1,2)) # 2 graphs per page
png('k-medoids.png')
plot(pamk.result$pamobject)
dev.off()
layout(matrix(1)) # change back to one graph per page

# with 3 clusters
pam.result <- pam(iris2, 3)
table(pam.result$clustering, iris$Species)
layout(matrix(c(1,2),1,2)) # 2 graphs per page
png('k-medoids-2.png')
plot(pam.result)
dev.off()
layout(matrix(1)) # change back to one graph per page
