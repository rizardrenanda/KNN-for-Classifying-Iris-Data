data(iris)
str(iris)
table(iris$Species)
head(iris)

#Set random data

set.seed(9850)
runif(5) #check what is runif
runif(nrow(iris))
gp<-runif(nrow(iris))
gp
order(gp)
iris <-iris[order(gp),]
head(iris)
head(iris,10)
iris
str(iris)
summary(iris)

#3Normalization of Data
normalize <-function(x) {
  return((x-min(x))/(max(x)-min(x)))
}
normalize(c(1,2,3,4,5))
iris_n<-as.data.frame(lapply(iris[,c(1,2,3,4)],normalize))
str(iris_n)
summary(iris_n)

#4 Create data sets of train, test, and target.
iris_train<-iris_n[1:129,]
iris_test<-iris_n[130:150,]
iris_train_target<-iris[1:129,5]
iris_test_target<-iris[130:150,5]

#5Use KNN
require(class)
ml <-knn(train=iris_train,test=iris_test, cl=iris_train_target,k=13)
ml
table(iris_test_target,ml)