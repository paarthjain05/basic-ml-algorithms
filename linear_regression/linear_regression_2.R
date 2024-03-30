wom<-read.csv("./linear_regression/women.csv",row.names = 1)
summary(wom)
plot(wom$height,wom$weight,xlab="Height",ylab="Weight")
wom_mod<-lm(wom$weight~wom$height)
summary(wom_mod)
abline(wom_mod)

plot(wom_mod$fitted.values,rstandard(wom_mod))
abline(h=2)
abline(h=-2)
identify(wom$height,wom$weight)
wom_mod$fitted.values

womNew<-wom[-c(15,14),]
wom_mod1<-lm(womNew$weight~womNew$height)
summary(wom_mod1)

plot(wom_mod1$fitted.values,rstandard(wom_mod1))
abline(h=2)
wom_mod1$fitted.values

plot(womNew$height,womNew$weight,xlab = "height",ylab = "weight")
abline(wom_mod1)
