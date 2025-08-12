# unsual observations
set.seed(42)
ex_data = data.frame(x = 1:10,
                     y= 10:1 + rnorm(n=10))

View(ex_data)

ex_mode1=lm(y~x, data = ex_data)

# low leverage , large residual, small influence 
point_1 = c(5.4,11)
ex_data_1 = rbind(ex_data,point_1)
model_1 =lm(y~x, data = ex_data_1)
plot(y~x, data = ex_data_1, cex = 2, pch = 2, col = "grey",
     main = "low leverage , large residual, small influence ")
points(x = point_1[1], y=point_1[2], pch= 1, cex = 4, col = "black", lwd=2)
abline(ex_mode1, col = "dodgerblue", lwd=2)
abline(model_1, col = "darkorange",lwd=2,lty=2)



# high leverage , small residual, small influence 
point_2 = c(18,-5.7)
ex_data_2 = rbind(ex_data,point_2)
model_2 =lm(y~x, data = ex_data_2)
plot(y~x, data = ex_data_2, cex = 2, pch = 2, col = "grey",
     main = "high leverage , large residual, small influence ")
points(x = point_2[1], y=point_2[2], pch= 1, cex = 4, col = "black", lwd=2)
abline(ex_mode1, col = "dodgerblue", lwd=2)
abline(model_2, col = "darkorange",lwd=2,lty=2)


# high leverage , large residual, large influence 
point_3 = c(14,5.1)
ex_data_3 = rbind(ex_data,point_3)
model_3 =lm(y~x, data = ex_data_3)
plot(y~x, data = ex_data_3, cex = 2, pch = 2, col = "grey",
     main = "low leverage , large residual, small influence ")
points(x = point_3[1], y=point_3[2], pch= 1, cex = 4, col = "black", lwd=2)
abline(ex_mode1, col = "dodgerblue", lwd=2)
abline(model_3, col = "darkorange",lwd=2,lty=2)
legend("bottomleft", c("Original Data", "Added point"), lty = c(1,2), col = c("dodgerblue","darkorange"))

