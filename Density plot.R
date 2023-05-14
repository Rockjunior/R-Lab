data("iris")
library(ggpubr)
#density plot with mean lines and marginal rug
View(iris)

#plot

dnstplot = ggdensity(iris, x = "Sepal.Length",add = "mean", rug = TRUE,color = "Species",fill = "Species",pellete = "jco")
plot(dnstplot)
