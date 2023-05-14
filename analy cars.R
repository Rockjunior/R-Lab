cars
str(cars)
names(cars) #cars attributes
head(cars) #the  first 6 cars on the list
head(cars,10) #specific no of cars
plot(data=cars,dist~speed, xlab="SPEED",ylab = "DISTANCE",col="blue",main="DISTANCE-SPEED PLOT", cex=1.4)#creating a scatterplot
(model=lm(dist~speed,data = cars)) ##model
cor(cars$speed,cars$dist)
abline(model,col="green",lwd=5,pch="17")
summary(model)
anova(model)#test appropriateness of the model/validity
