library(caret)
crashTest<-read.csv("./logistic_regression/crashTest_1.csv", row.names = 1)
View(crashTest)

crashTest_test<-read.csv("./logistic_regression/crashTest_1_TEST.csv",row.names = 1)
View(crashTest_test)

str(crashTest)

crashTest$CarType<-factor(crashTest$CarType,levels = c("Hatchback","SUV"))
crashTest_test$CarType<-factor(crashTest_test$CarType,levels = c("Hatchback","SUV"))

logisfit<-glm(formula = crashTest$CarType~., family = 'binomial', data=crashTest)
logisfit

summary(logisfit)

logisTrain<-predict(logisfit,type = 'response')
plot(logisTrain)

tapply(logisTrain,crashTest$CarType,mean)

logisPred<-predict(logisfit,newdata = crashTest_test,type = 'response')
plot(logisPred)

crashTest_test[logisPred<=0.5,"LogisPred"]<-"Hatchback"
crashTest_test[logisPred>0.5,"LogisPred"]<-"SUV"

View(crashTest_test)

confusionMatrix(table(crashTest_test[,7],crashTest_test[,6]),positive = 'Hatchback')
