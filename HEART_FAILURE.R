#regression model
#load the package to import data

library(readr)

#import

HF = read.csv("D:/MYDATA/Analytic data/heart_failure.csv")
View(HF)

summary(HF)

#make categorical data into factor

HF$age = as.factor(HF$age)
HF$anaemia = as.factor(HF$anaemia)
HF $creatinine_phosphokinase = as.factor(HF$creatinine_phosphokinase)
HF$diabetes = as.factor(HF$diabetes)
HF$ejection_fraction = as.factor(HF$ejection_fraction)
HF$high_blood_pressure = as.factor(HF$high_blood_pressure)
HF$platelets = as.factor(HF$platelets)
HF$serum_creatinine = as.factor(HF$serum_creatinine)
HF$serum_sodium = as.factor(HF$serum_sodium)
HF$sex = as.factor(HF$sex)
HF$smoking = as.factor(HF$smoking)
HF$time = as.factor(HF$time)
HF$DEATH_EVENT = as.factor(HF$DEATH_EVENT)


#summary of the factor data of HF

summary(HF)

#here we need to ask questions
#   Q1.  What are causetive agents of heart failure?
#   Q2   what variables that can cause heart failure (HF)?

HFmodel = glm(age ~ anaemia+creatinine_phosphokinase+diabetes+ejection_fraction+high_blood_pressure+platelets+serum_creatinine+serum_sodium+sex+smoking+time,data = HF)
summary(HFmodel)

