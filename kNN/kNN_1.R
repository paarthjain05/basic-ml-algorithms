library(caret) #confusion matrix
library(class) #classification implementation

serviceData<-read.csv("./kNN/serviceTrainData.csv")
serviceTest<-read.csv("./kNN/serviceTestData.csv")

View(serviceData)
View(serviceTest)

serviceData$Service<-factor(serviceData$Service,levels = c("No","Yes"))
serviceTest$Service<-factor(serviceTest$Service,levels = c("No","Yes"))

str(serviceData)
summary(serviceData)

predicKNN <- knn(serviceData[,-6], serviceTest[,-6] ,cl = serviceData$Service, k =3)
predicKNN

conf_matrix<-table(predicKNN,serviceTest[,6]) #Manual Method to get a confusion matrix
conf_matrix
confusion_matrix<- confusionMatrix(data = predicKNN,serviceTest$Service) #using caret library to get a confusion matrix
confusion_matrix
