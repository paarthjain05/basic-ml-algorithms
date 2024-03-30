nyc<-read.csv("./linear_regression/nyc.csv")
summary(nyc)
View(nyc)

plot(nyc,main="Pairwise Scatter Plot")

round(cor(nyc),3)

nycmod1<-lm(nyc$Price~nyc$Food+nyc$Decor+nyc$Service+nyc$East) #alternative -> nycmod1<-lm(nyc$Price~.)
summary(nycmod1)

nycmod2<-lm(nyc$Price~nyc$Food+nyc$Decor+nyc$East)
summary(nycmod2)

plot(nycmod2$fitted.values,rstandard(nycmod2))
abline(h=2)
abline(h=-2)
identify(nycmod2$fitted.values,rstandard(nycmod2))

nycNew1<-nyc[-c(56),]
nycmod3<-lm(nycNew1$Price~nycNew1$Food+nycNew1$Decor+nycNew1$East)
summary(nycmod3)

plot(nycmod3$fitted.values,rstandard(nycmod3))
abline(h=2)
abline(h=-2)
identify(nycmod3$fitted.values,rstandard(nycmod3))