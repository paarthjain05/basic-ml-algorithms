tripDetails<-read.csv("./k-means/tripDetails.csv",row.names = 1)

str(tripDetails)
summary(tripDetails)

tripCluster<-kmeans(tripDetails,3)
tripCluster

#Elbow Method - Method to calculate optimal k
k.max<-10 #Maximum 10 clusters assumed
wss<- rep(NA, k.max)
nClust<- list()
for (i in 1:k.max) {
  driveClasses<-kmeans(tripDetails,i)
  wss[i]<-driveClasses$tot.withinss
  nClust[[i]]<-driveClasses$size
}
plot(
  1:k.max,wss,
  type="b",pch=19,
  xlab="Number of Clusters",
  ylab="Total within-cluster sum of squares:Trips"
)

