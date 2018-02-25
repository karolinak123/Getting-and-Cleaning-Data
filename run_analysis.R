require(dplyr)

#loading test-related data tables into R
setwd("C:/Users/Kara/Desktop/Coursera/Getting and Cleaning Data Project/UCI HAR Dataset/test")
test_x<-as.data.frame(read.csv("X_test.txt", header = FALSE, sep = ""))
test_y<-as.data.frame(read.csv("y_test.txt", header = FALSE, sep = ""))
subject_test<-as.data.frame(read.csv("subject_test.txt", header = FALSE, sep = ""))

#binding all test-related datasets into one dataset
test_dataset<-cbind(subject_test, test_y, test_x)

#loading features table into R (colnames)
features<-as.data.frame(
  read.csv("C:/Users/Kara/Desktop/Coursera/Getting and Cleaning Data Project/UCI HAR Dataset/features.txt",
           header = FALSE, sep = ""))

#loading activity labels table into R
activity_labels<-as.data.frame(
  read.csv("C:/Users/Kara/Desktop/Coursera/Getting and Cleaning Data Project/UCI HAR Dataset/activity_labels.txt",
           header = FALSE, sep = ""))


#loading train-related data tables into R
setwd("C:/Users/Kara/Desktop/Coursera/Getting and Cleaning Data Project/UCI HAR Dataset/train")
train_x<-as.data.frame(read.csv("X_train.txt", header = FALSE, sep = ""))
train_y<-as.data.frame(read.csv("y_train.txt", header = FALSE, sep = ""))
subject_train<-as.data.frame(read.csv("subject_train.txt", header = FALSE, sep = ""))

#binding all train-related datasets into one dataset
train_dataset<-cbind(subject_train, train_y, train_x)

#merging test and train datasets into one and assigning colnames (features table)
dataset<-rbind(test_dataset, train_dataset)
colnames(dataset)<-c("subject","activity_code",as.character(features[,2]))

#joining activity labels to test&train dataset and asigning colnames
dataset_2<-merge(x=dataset,y= activity_labels, by.x="activity_code", by.y="V1", all=TRUE)
valid_features <- make.names(names=features[,2], unique=TRUE, allow_ = TRUE)
colnames(dataset_2)<-c("activity_code","subject",as.character(valid_features), "activity")

#selecting only columns that contain mean or std data
dataset_final<-select(dataset_2, c(subject, activity, contains("mean."), contains("std.")))

#subset of dataset_final, that contains mean() summarization per subject and activity

subset_dataset_final<- dataset_final %>% 
                              group_by( subject, activity) %>%
                              summarize_all(mean)

write.table(subset_dataset_final, "C:/Users/Kara/Desktop/Coursera/Getting and Cleaning Data Project/UCI HAR Dataset/Samsung_Tidy_Data_Set.txt",
                    row.name = FALSE) 
