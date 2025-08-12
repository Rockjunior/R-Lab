###Strip Plots
#Distribution of Salary and rank
ggplot(Salary, aes(x = rank, y = salary)) +
    geom_point() +
    labs(title = "Salary Distribution by Rank")

library(scales)
#Distribution of Salary and rank using jitter.
    #Provides room for interpretation
ggplot(Salary,
    aes(y = factor(rank,
                labels = c("Assistant\nProfessor,
                            Associate\nProfessor",
                            "Full\nProfessor")),
        x = salary, color = rank)) +
    geom_jitter(alpha = 0.6) +
    scale_x_continuous (labels = dollar) +
    labs(title = "Salary Distribution by Rank",
            x = "",
            y = ""),
    theme_minimal() +
    themw(legend.position = "none")


#Superimpose a Box Plots
ggplot(Salary,
    aes(y = factor(rank,
                labels = c("Assistant\nProfessor,
                            Associate\nProfessor",
                            "Full\nProfessor")),
        x = salary, color = rank)) +
    geom_boxplot(size = 1,
                 outlier.shape = 1,
                 outlier.color = 'black',
                 outlier.size = 3) +
    geom_jitter(alpha = 0.5,
                width = 0.2) +
    scale_y_continuous (labels = dollar) +
    labs(title = "Salary Distribution by Rank",
         x = "",
         y = ""),
    theme_minimal() +
    themw(legend.position = "none") +
    coord_flip()



#############################PRACTICE############################
###Cleveland dot charts
#For categorical data when categorical variables are so many




####################################INFERENTIAL ANALYSIS###################










