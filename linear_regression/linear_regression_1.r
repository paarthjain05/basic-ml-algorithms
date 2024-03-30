bonds<- read.delim("./linear_regression/bonds.txt",row.names = 1)
View(bonds) #shows dataset
str(bonds)  #shows structure
summary(bonds)
plot(bonds$CouponRate,bonds$BidPrice,xlab = "Coupon Rate",ylab = "Bid Price")
bondsmod<-lm(bonds$BidPrice~bonds$CouponRate)
abline(bondsmod)
summary(bondsmod)


plot(bondsmod$fitted.values,rstandard(bondsmod), xlab = "Predicted Value", ylab = "Standardized Residual")
abline(h=2)
abline(h=-2)
identify(bondsmod$fitted.values,rstandard(bondsmod))


bondsNew<-bonds[-c(4,13,34,35),]
bondsmod1<-lm(bondsNew$BidPrice~bondsNew$CouponRate)
summary(bondsmod1)

plot(bondsNew$CouponRate,bondsNew$BidPrice,xlab = "Coupon Rate", ylab = "Bid Price")
abline(bondsmod1)