setwd('C:\\Users\\Ivan.Liuyanfeng\\Desktop\\ata_Mining_Work_Space\\rdatamining')

# by party
library(party)
str(iris)

set.seed(1234)
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
iris_ctree <- ctree(myFormula, data=trainData)
    # check the prediction
table(predict(iris_ctree), trainData$Species)
print(iris_ctree)
plot(iris_ctree)
plot(iris_ctree, type="simple")
    # predict on test data
testPred <- predict(iris_ctree, newdata = testData)
table(testPred, testData$Species)

# by rpart
    # train a decision tree
library(rpart)
iris_rpart <- rpart(myFormula, data = trainData,control = rpart.control(minsplit = 10))
attributes(iris_rpart)
print(iris_rpart$cptable)
print(iris_rpart)
plot(iris_rpart)
text(iris_rpart, use.n=T)

opt <- which.min(iris_rpart$cptable[,"xerror"])
cp <- iris_rpart$cptable[opt, "CP"]
iris_prune <- prune(iris_rpart, cp = cp)
print(iris_prune)
plot(iris_prune)
text(iris_prune, use.n=T)
    # make prediction
iris_pred <- predict(iris_prune, newdata=testData)
plot(iris_pred[,1] ~ Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=testData, xlab="Observed",ylab="Predicted")
abline(a=0, b=1)
