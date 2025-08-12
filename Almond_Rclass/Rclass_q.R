# Basic calculstion 
7+5
9-6
8*2
9/7
9^2
9^(-2)
9^(1/2)

#install.packages("ggplot2")
library(ggplot2)
ggplot(mpg$model,)

?ggplot()

help(ggplot)





# Data Types
## Numeric e.g 1,7.8,65
## integer -8,7,9
## complex e.g 3 + 2i
## logical e.g TRUE AND FALSE
## character e.g "Ali", "1 plus 2" 


# Data structure 
# 1. Vectors
x = c(24,56,87,65,54)
x
y <- c(3,6,8,9)
y

y<- c("Ali", 30)
y

a <- c(1:10)
a

seq(from = 1.5, to = 5.5, by = 0.1)
seq(17,2,-3)

rep("Ali",10)

z<- c(x,rep(seq(1,9,2),3),c(1,2,3),24,2:4)
z

length(z)

### subsetting vectors name[position of element]
z[1]
z[5]

z[-2]
z[-4]

x[c(1,2,3)]
x[-c(4,5)]

x[1:3]
x[-(4:5)]

x[T]
x[c(T,T,F,F,F)]

age <- c(28,25,20,24,22,47)
age[c(3,4)]
age[3:4]
age[c(F,F,T,T,F,F)]
age[-c(1,2,5,6)]
age[-c(1:2,5:6)]
age[print(3:4)]

x<- 1:100
x + 1
2*x
age <- 2023 - x
age

sqrt(x)

# logical operators 
age
age>18

age > 25

age == 20

age != 20

age !=20 & age == 20

age != 20 | age == 20

# Matrices
x <- 1:9
x

X <- matrix(x,nrow = 3, ncol = 3, TRUE)
X

Z<- matrix(5,3,2)
Z

X[2,1]

X[1,]
X[1,c(1,2,3)]

X[,2]

X[2,c(2,3)]
X[2,2:3]
X[2,-1]

X[c(2,3),c(2,3)]
X[2:3,2:3]
X[-1,-1]

x<-1:9
x
y=rev(x)
z=rep(1,9)

rbind(x,y,z)
cbind(x,y,z)


X<-matrix(x,3,3)
Y<-matrix(y,3,3)
X
Y

X+Y
Y-X
Y/X
Y*X
Y%*%X

Y
t(Y)
solve(Y)

Z<-matrix(c(9,2,-3,2,4,-2,-3,-2,16),3, byrow = T)
Z
solve(Z)

S<-solve(Z)%*%Z
I<-diag(3)
S
I

all.equal(S,I)

dim(S)
X

rowSums(X)
colSums(X)
rowMeans(X)
colMeans(X)

diag(X)
diag(2)
diag(1:5)

# lists
# create a list  list()
list("Ali",30,36692426,"Male")

data<-list(
  Name = c("Ali","Mukami","Justus","Sanyo","Emma"),
  Age = c(32,22,24,23,20,65),
  weight = c(60,58,59,59,58)
)
data
data$Name
data$Age

data[]
data[1]
data[[1]]

data[1:2]
data["Name"]
data[c("Name","weight")]


data[[2]]==32
data$Age == 32

attach(data)
Name
Age



#Data Frame 
mydata <- data.frame(
  Name = c("Ali","Mukami","Justus","Sanyo","Emma"),
  Age = c(32,22,24,23,20),
  weight = c(60,58,59,59,58)
)

mydata
View(mydata)

attach(mydata)
Age
weight

mydata$Name
mydata$weight

mydata[]
mydata[1]
mydata[1:2]

mydata[[2]] == 24

#install.packages("readr")
library(readr)
?read_csv()

mydata2 <- read_csv("C:/Users/hp/Desktop/Rclass/lab2_data.csv")
mydata2

library(tibble)
mydata <- as_tibble(mydata)
mydata

library(ggplot2)
head(mpg,n=10)
mpg
str(mpg)

?mpg

names(mpg)

mpg$manufacturer

dim(mpg)
nrow(mpg)
ncol(mpg)

mpg[]
mpg[1]

mpg$hwy
mpg[mpg$hwy>22, ]
mpg[mpg$hwy>22,c("manufacturer","model","year") ]

subset(mpg, subset = hwy>22)
subset(mpg, subset = hwy>22,select = c("manufacturer","model","year") )

library(dplyr)
mpg %>% filter(hwy >22)
mpg %>% filter(hwy >22) %>% select(manufacturer,model,year)


# Basic Programming 
## If/else
## if () {
#R code 1
} else {
  #R code 2
}

x=6
y=3

if  (x>y){
  print("X is greater than Y")
} else {
  print("X is less than or equal to Y")
}

ifelse(4>1,1,0)

ifelse(x>y,"X is greater than Y","X is less than or equal to Y")

ifelse(x>20,"Greater","Less")


#loop
x=11:15

for (i in 1:5) {
  x[i] = x[i]*2
}
x

x=11:15
x=x*2
x

# Functions  

Z = function(x){
  m = mean(x)
  std = sd(x)
  result = (x-m)/std
  result
}

Age = c(40,65,98,9,2,7,100)

Z(Age)

z = function(x){
  (x-mean(x))/sd(x)
}

z(Age)


# Summarizing Data
library(ggplot2)
?mpg

## Central tendency
mean(mpg$cty)
median(mpg$cty)
mode(mpg$cty)

# Spread
attach(mpg)
var(cty)
sd(cty)
IQR(cty)
min(cty)
max(cty)
range(cty)

# Categorical 
table(drv)

round((table(drv) / nrow(mpg))*100,2)


# Plotting
## hist()

hist(mpg$cty,
     xlab = "Miles per Gallon", 
     main = "Histogram of Cty",
     breaks = 12, 
     col = "red",
     border = "dodgerblue")

## Barplot

barplot(table(drv),
        xlab = "Drivetrain",
        ylab = "Frequency",
        main = "Drivetrain Barplot",
        col = "dodgerblue",
        border = "darkorange")

# Boxplot
boxplot(mpg$hwy)

boxplot(hwy ~ drv, data = mpg,
        pch = 20,
        cex = 2,
        col = "darkorange",
        border = "dodgerblue")

# Scatterplot
plot(hwy ~ displ, data = mpg,
     pch = 20,
     cex = 2,
     col = "dodgerblue")


# Probability and Statas
## dname() to obatain pdf
## pname() to get cdf
## qname() to get quatile at an input p
## rname() random draw

## X~N(u=2,sd=5) get probability that x =3
pnorm(q=3, mean = 2, sd = 5)

dnorm(x =3,mean = 2, sd=5)

qnorm(p=0.975, mean = 2, sd =5)

x<-rnorm(n=10,mean = 2, sd = 5)
mean(x)
sd(x)

dbinom(x=6, size = 10, prob = 0.75)


#=====================Univariate Graphs=================================
##1. Categorical 
library(ggplot2)
data(Marriage, package = "mosaicData")
Marriage

## 1.1 Bar chart 
# plot race
ggplot(Marriage, aes(x  = race, y = after_stat(count))) +
  geom_bar(fill = "blue",
           color = "black") +
  labs(x = "Race",
       y = "Frequency",
       title = "Participants by Race")
# plot the bar as %
ggplot(Marriage, aes(x  = race, y = after_stat(count/sum(count)))) +
  geom_bar(fill = "blue",
           color = "black") +
  labs(x = "Race",
       y = "%",
       title = "Participants by Race") +
  scale_y_continuous(labels = scales::percent)

# Sorting categories
# calculate Frq
library(dplyr)
plotdata <- Marriage %>%
  count(race)

#bar ascending order
ggplot(plotdata, aes(x = reorder(race, n), y = n)) +
  geom_bar(stat = "identity")+
  labs(x = "Race",
       y = "Frequency",
       title = "Participants by Race") +
  geom_text(aes(label = n),vjust = -0.5)

# Overlapping labels 
ggplot(Marriage, aes(x=officialTitle))+
  geom_bar() +
  labs(x = "Race",
       y = "official Title",
       title = "Participants by official Title")
  
# horizontal bar chart 
ggplot(Marriage, aes(x=officialTitle))+
  geom_bar() +
  labs(x = "Race",
       y = "official Title",
       title = "Participants by official Title")+
  coord_flip()

#  bar with rotated labels
ggplot(Marriage, aes(x=officialTitle))+
  geom_bar() +
  labs(x = "Race",
       y = "official Title",
       title = "Participants by official Title")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
# bar with staggered labels
lbls <- paste0(c("", "\n"), levels(Marriage$officialTitle))

ggplot(Marriage, aes(x = factor(officialTitle,label = lbls)))+
  geom_bar()

# 2. Pie chart
colnames(Marriage)
library(ggpie)
ggpie( Marriage, race)

# 3. Tree Map 
#install.packages("treemapify")
library(treemapify)

plotdata <- Marriage %>% 
  count(officialTitle)

ggplot(plotdata,
       aes(fill = officialTitle,
           area = n,
           label = officialTitle))+
  geom_treemap()+
  geom_treemap_text(colour = "white", place = "centre")+
  labs(title = "Marriage by officialTitle")+
  theme(legend.position = "none")


#create a waffle chart
#install.packages("waffle")
library(waffle)
ggplot(plotdata, aes(fill = officialTitle, values = n))+
  geom_waffle(na.rm = T)

# customized waffle chart
cap <- paste0("1 square =", ceiling(sum(plotdata$n)/100), "case(s).","   ", "@AliTheAnalyst")

ggplot(plotdata, aes(fill = officialTitle, values = n))+
  geom_waffle(na.rm = T,
              n_rows = 10,
              size = 0.4,
              color = "white")+
  scale_fill_brewer(palette = "Spectral")+
  coord_equal()+
  theme_minimal()+
  theme_enhance_waffle()+
  theme(legend.title = element_blank())+
  labs(title = "Proportion of Wedding Officials", caption = cap)



## Quantitative Variable
### 1) Histogram 
ggplot(Marriage, aes(x = age)) +
  geom_histogram(fill = "blue",
                 color = "white",
                 bins = 30) +
  labs(title = "Participants by Age", x = "Age")
# plot the histogram with %
library(scales)
ggplot(Marriage, aes(x = age, y = after_stat(count/sum(count)))) +
  geom_histogram(fill = "blue",
                 color = "white",
                 bins = 30) +
  labs(title = "Participants by Age", x = "Age", y = "Percentage") +
  scale_y_continuous(labels = percent)

# Kernel Density plot
ggplot(Marriage, aes(x=age)) +
  geom_density(fill = "red",
               color = "black",
               bw = 1) +
  labs(title = "Participants by Age")

bw.nrd0(Marriage$age)


# Dot charts
ggplot(Marriage, aes(x=age)) +
  geom_dotplot(fill = "yellow",
               color = "black") +
  labs(title = "Participants by Age", x = "Age", y = "Propotion") 


# Bivariate Graphs
## categorical vs. Categorical
library(ggplot2)

### 1. Stacked Bar Chart
ggplot(mpg,aes(x = class, fill = drv)) +
  geom_bar(position = "stack")

### 2. Grouped Bar Chart
ggplot(mpg,aes(x = class, fill = drv)) +
  geom_bar(position = position_dodge(preserve = "single"))

### 3. Segmented Bar chart
### 1. Stacked Bar Chart
ggplot(mpg,aes(x = class, fill = drv)) +
  geom_bar(position = "fill") +
  labs(y = "Proportion")


# Bar plot in %
# bar plot, with each bar representing 100%, 
# reordered bars, and better labels and colors
library(scales)
ggplot(mpg, 
       aes(x = factor(class,
                      levels = c("2seater", "subcompact", 
                                 "compact", "midsize", 
                                 "minivan", "suv", "pickup")),
           fill = factor(drv, 
                         levels = c("f", "r", "4"),
                         labels = c("front-wheel", 
                                    "rear-wheel", 
                                    "4-wheel")))) + 
  geom_bar(position = "fill") +
  scale_y_continuous(breaks = seq(0, 1, .2), 
                     label = percent) +
  scale_fill_brewer(palette = "Set2") +
  labs(y = "Percent", 
       fill="Drive Train",
       x = "Class",
       title = "Automobile Drive by Class") +
  theme_minimal()


# create a summary dataset
library(dplyr)
plotdata <- mpg %>%
  group_by(class, drv) %>%
  summarize(n = n()) %>% 
  mutate(pct = n/sum(n),
         lbl = scales::percent(pct))
plotdata

# create segmented bar chart
# adding labels to each segment

ggplot(plotdata, 
       aes(x = factor(class,
                      levels = c("2seater", "subcompact", 
                                 "compact", "midsize", 
                                 "minivan", "suv", "pickup")),
           y = pct,
           fill = factor(drv, 
                         levels = c("f", "r", "4"),
                         labels = c("front-wheel", 
                                    "rear-wheel", 
                                    "4-wheel")))) + 
  geom_bar(stat = "identity",
           position = "fill") +
  scale_y_continuous(breaks = seq(0, 1, .2), 
                     label = percent) +
  geom_text(aes(label = lbl), 
            size = 3, 
            position = position_stack(vjust = 0.5)) +
  scale_fill_brewer(palette = "Set2") +
  labs(y = "Percent", 
       fill="Drive Train",
       x = "Class",
       title = "Automobile Drive by Class") +
  theme_minimal()

### 4. Mosaic plots 

## Quantitative vs Quantitative 
# 1.scatter plot
library(ggplot2)
data(Salaries, package = "carData")

ggplot(Salaries, aes(x = yrs.since.phd, y = salary)) +
  geom_point(color = "blue",
             size = 2,
             alpha = .8) +
  scale_y_continuous(label = scales::dollar,
                     limits = c(50000,250000)) +
  scale_x_continuous(breaks = seq(0,60,10),
                     limits = c(0,60)) +
  labs(x = "Years since PhD",
       y = "Salary",
       title = "Experience Vs Salary",
       subtitle = "9 months Salary (2008-2009")


# scatter plot with linear fit line
ggplot(Salaries, aes(x = yrs.since.phd, y = salary)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm")


# scatter plot with quadratic line of best fit 
ggplot(Salaries, aes(x = yrs.since.phd, y = salary)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm",
              formula = y ~ poly(x,2),
              color = "red")

# scatter plot with loess smothed line of best fit 
ggplot(Salaries, aes(x = yrs.since.phd, y = salary)) +
  geom_point(color = "blue") +
  geom_smooth(color = "red")
 
# line plot
data(gapminder, package = "gapminder")
library(dplyr)
plotdata <- filter(gapminder, country == "United States")

# simple line plot
ggplot(plotdata, aes(x = year,y = lifeExp)) +
  geom_line()

# improved line plot
ggplot(plotdata, aes(x = year,y = lifeExp)) +
  geom_line( size = 1.5,
             color = "orange") +
  geom_point(size = 2,
             color = "blue") +
  labs(y = "Life Expectancy (Year)",
       x = "Year",
       title = "Life expectancy changes over time",
       caption = "@Ali The Analyst")
## Categorical vs Quantitative

getwd()

##Grouped Kernel density plots
#Plot the Distribution of salaries by rank using Kernel density plots
ggplot(Salaries, aes(x = salary,
                     fill = rank)) +
  geom_density(alpha = 0.4)



###Box plots
ggplot(Salaries, aes(x = rank, y = salary)) +
  geom_boxplot(notch = TRUE, fill = 'blue', alpha = 0.7) +
  labs(title = "Salary by rank.")

### Violin plots
###Distribution of salaries by rank using violin plots
ggplot(Salaries, aes(x = rank, y = salary)) +
  geom_violin() +
  labs(title = "Salary by rank.")


###Distribution of salaries by rank using violin and box plots
ggplot(Salaries, aes(x = rank, y = salary)) +
  geom_violin(fill = 'blue') +
  geom_boxplot(width = .15,
               fill = 'orange',
               outliercolor = 'orange',
               outlier.size = 2,
               notch = T)+
  labs(title = "Salary by rank.")

###Ridgeline plot
install.packages("ggridges")
ggplot(mpg, aes(x = cty, y = class, fill = class))+
  geom_density_ridges() +
  labs(title = "Highway mileage by auto class") +
  theme(legend.position = "none")





