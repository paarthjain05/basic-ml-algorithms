arrests<- read.csv("./k-means/USArrests.csv",row.names = 1)
View(arrests)

set.seed(123)

normalized_arrests<-scale(arrests)
View(normalized_arrests)

arrestCluster<-kmeans(normalized_arrests,centers = 4,nstart = 20)
arrestCluster$totss
