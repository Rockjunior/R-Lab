# Download dataset

dataset_url = "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet.zip")
unzip("diet.zip", exdir = "diet_data")


list.files("diet_data") #list of files

andy = read.csv("diet_data/Andy.csv") # import dataset
head(andy)

length(andy$Day)
str(andy)

summary(andy)

dim(andy)

andy[1, "Weight"]
