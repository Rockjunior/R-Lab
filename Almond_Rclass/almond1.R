#Matrices
x = 1:9
x

X = matrix(x, nrow = 3, ncol = 3,TRUE)
X

#constant/scalar matrix
z = matrix(6,3,2)
z

#subsetting the matrix
#element on row 2 and col 1
X[2,1]

#subsetting to get the all row
X[1,]

#or

X[1,c(1,2,3)]

#subseting the colunm
X[,2]

#specify the specific elements within rows and cols
X[2,c(2,3)]
X[2,2:3]
X[2,-1]

#subseting to a particular matrix
X[2:3,2:3]#us
X[2:3,c(2,3)]#use combination operator
X[-1,-1]#removing first row and first column
X[c(2,3),c(2,3)]
diag(X)


X
y = rev(matrix(X))
y
z = rep(1,9)
z

rbind(X,y,z)
cbind(X,y,z)
X
y

X-y
y-X
y/X
y*X
y%*%X

y
t(y)

#data frame
mydata = data.frame(
  Name = c("Ali","Mukami","Justus","Sanyo","Emma"),
  Age = c(32,22,24,23,20),
  Weight = c(60,58,59,59,58)
)

mydata
View(mydata)

attach(mydata)
Age
Weight

mydata$Name
mydata$Weight

#subsetting
mydata[]
mydata[1]
mydata[1:2]

mydata[[2]] = 24

#importing data
#install.packages("readr")
library(readr)
?read.csv()
mydata_2 = read.csv("C:/Users/ROMROM/Desktop/RClass/lab2_data.csv")

attach(mydata_2)
View(mydata_2)
mydata_2

#data informations
library(tibble)
mydata_2 = as.tibble(mydata_2)
mydata_2

summary(mydata_2)

library(ggplot2)
boxplot(mydata_2$weight)

#sample inbuilt data
#head fxn
head(mpg,n = 10)#prints only the 1st 10 variables
mpg

#structure fxn
str(mpg)

?mpg

#names fxn
names(mpg)

#susetting
mpg$manufacturer

#no of dimensions
dim(mpg)

#no of rows and cols
nrow(mpg)
ncol(mpg)

#subsetting
mpg[] #top 10 vars
mpg[2]

mpg$hwy
mpg[mpg$hwy>22, ]
mpg[mpg$hwy>22, c("manufacturer", "model", "year") ]

subset(mpg, subset = hwy>22)
subset(mpg, subset = hwy>22, select = c("manufacturer", "model", "year"))

library(dplyr)
mpg %>% filter(hwy>22)
mpg %>% filter(hwy > 22) %>% select(manufacturer,model,year)



#Basic Programming
#if/else
#if(){
#or
# Rcode1
#}else{
#Rcodee2
#}

x = 6
y = 6

#loop
if (x>6){
  print("x is greater than y")
} else {
  print("x is less than or egual to Y")
}

#lets have t =100 and y=34

t = 100
s = 34

if (t>s)
{
  print("Then programming is wonderful!")
}else 
{
  print("But We can still program no matter what.")
}

#ifelse statements
ifelse(4>1,1,0)
ifelse(x>y,"x is greater than y","x is less or equal to y")
ifelse(x>20,"Greater","Less")


#loop
c = 11:15

for (i in 1:5) {
  c[i] = c[i]*2
}
c

#functions
#creating the std fxn

z = function(x){
  m = mean(x)
  std = sd(x)
  result = (x-m)/std
  result
}

age = c(20,31,34,36,22,27,37)

z(age)
#using sd
z = function(x){
  m = mean(x)
  result = (x-m)/sd(x)
  result
}

z(age)

#just by plot
scatter.smooth(age)
box()

#summarizing data

library(ggplot2)
?mpg

#central tendancy

mean(mpg$cty)
median(mpg$cty)
mode(mpg$cty)


#spread or dispersion
attach(mpg)
var(cty)
sd(cty)
IQR(cty) #interquartelie range
max(cty)
min(cty)
range(cty)

#scatterplot
plot(x = mpg$cyl,
     y = mpg$displ,
     pch = 19,
     cex = 0.8,
     frame = FALSE,
     xlab = 'Cyl',
     ylab = 'displ'
     )
#box plot
boxplot(cyl~displ,
        data = mpg,
        ylab = 'cyl',
        frame = FALSE,
        col = "lightgray"
        )

#categorical
?table
table(drv)

(table(drv) / nrow(mpg))*100 
round((table(drv) / nrow(mpg))*100,2)#roundoff to 2 decimal places

#plotting
##histogram

hist(mpg$cty,
     xlab = "Miles per Gallon",
     main = "Histogram of CTY.",
     breaks = 12,
     col = "red",
     border = "dodgerblue")

#barplot

barplot(table(drv),
        xlab = "Drivetrain",
        ylab = "Frequency",
        main = "Drivetarin Barplot",
        col = "dodgerblue",
        border = "darkorange")

#Boxplot
boxplot(mpg$hwy)

boxplot(hwy ~ drv,
        data = mpg,
        pch = 20,
        cex = 2,
        col = "darkorange",
        border = "dodgerblue")

#scatterplot
plot(hwy ~ displ,
     data = mpg,
     pch = 20,
     cex = 2,
     col = "dodgerblue")

#Probability and Statas

##dname()  to obtain pdf
##pname() to get cdf
##gname() to get quatile at an input p
##rname() generate random draw

##"name"refers to the name of the distribution

#x~N(u=2,sd=5) get probability of x=3

pnorm(q = 3, mean = 2, sd = 5)

dnorm(x = 3, mean = 2, sd = 5)

qnorm(p = 0.975, mean = 2, sd = 5)

t = rnorm(n = 10, mean = 2, sd = 5)
mean(t)
sd(t)

pnorm(q = 3,mean = 6, sd = 4, lower.tail = TRUE,log.p = FALSE)



























































