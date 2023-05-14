library(readr)
#import using the code below(remove # - sign)
#mydata = readxl::excel_sheets("D:/MYDATA/Analytic data/LungCapData.xls")

#scatter plot

plot(x = LungCapData$Age, y = LungCapData$Height,pch = 18, cex = 0.8, frame = FALSE,xlab = "Age", ylab = "Height")

#Boxplot of Age by gender

boxplot(Age ~ Gender,data = LungCapData, ylab = "Age", frame = FALSE, col = "lightgray")

#Boxplot of Age and smoking

boxplot(Age ~ Smoke ,data = LungCapData, ylab = "Age", frame = FALSE, col = "lightblue")

#Boxplot of Age and Caeseran

boxplot(Age ~ Caesarean,data = LungCapData, ylab = "Age", frame = FALSE, col = "blue")


#install.packages(lattice)
library(lattice)

#smoking xyplot

xyplot(Age ~ Height, groups = Smoke,data = LungCapData,auto.key = TRUE,pch = 19,cex = 0.5)

xyplot(Age ~ Height | Smoke, groups = Smoke,layout = c(2,1), data = LungCapData,type = c("p","smooth"),auto.key = TRUE,pch = 19,cex = 0.5,scales = "free")


library(ggplot2)
ggplot(LungCapData,aes(x = Age, y = Height))+ geom_point(size = 1.2, color = "blue", shape = 21)

ggplot(LungCapData, aes(x = Age, y = Height))+ geom_point(aes(color = Gender, shape = Gender))
ggplot(LungCapData,aes(x = Age, y = Height))+ geom_point(aes(color = Gender, shape = Gender))+ scale_color_manual(values = c("blue","red"))

ggplot(LungCapData,aes(x = Age, y = Height))+ geom_point(aes(color = Gender))+ geom_smooth(aes(color = Gender, fill = Gender))+ facet_wrap(~Gender,ncol = 2,nrow = 1)+ scale_color_manual(values = c("green","grey"))+ scale_fill_manual(values = c("lightblue","green"))

ggplot(LungCapData,aes(x = Age, y = Height))+ geom_point()


#install.packages(ggpur)
library(ggpubr)
#add mean line and marginal rugs
#color by groups
#use jco journal color palette

ggdensity(LungCapData,x = "Age", add = "mean", rug = TRUE, color = "Gender",fill = "Gender", palette = "jco")

#compare groups
my_comparison = list(c("male","female"))
ggboxplot(LungCapData, x = "Gender",y = "Age",color = "Gender",palette = c("blue","red"),add = "jitter")+ stat_compare_means(comparisons = my_comparison,method = "t.test")














