library(dplyr)
#Downloading and unzipping file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir.create("UCI HAR Dataset")
download.file(url, "./UCI HAR Dataset/UCI-HAR-dataset.zip")
setwd("./UCI HAR Dataset")
unzip('./UCI-HAR-dataset.zip')

#Merges the training and the test sets to create one data set
x<-do.call("rbind",lapply(c("./train/X_train.txt","./test/X_test.txt"),read.table))
y<-do.call("rbind",lapply(c("./train/y_train.txt","./test/y_test.txt"),read.table))
subj<-do.call("rbind",lapply(c("./train/subject_train.txt","./test/subject_test.txt"),read.table))

summary(y) #To ensure values aren't out of range
summary(subj) #To ensure values aren't out of range

#Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table('./features.txt')
View(features)
mean.sd.list <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x.mean.sd<-x[,c(mean.sd.list)]
list<-features[c(mean.sd.list),]
colnames(x.mean.sd)<-list$V2
View(x.mean.sd)
remove(list,mean.sd.list)

#Uses descriptive activity names to name the activities in the data set
activity<-read.table('./activity_labels.txt')
View(activity)
act<-merge(y,activity,x.by="V1")

#Appropriately labels the data set with descriptive variable names
export<-cbind(subj,act$V2,x.mean.sd)
colnames(export)[1:2]<-c("Subject","Activity")
dir.create("./ToSubmit")
write.table(export,"./ToSubmit/Cleaned Data with Labels.csv",row.names = F)

#From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.

export2<-export%>%group_by(Activity,Subject)%>%summarise_each(funs(mean))
View(export)
write.table(export2,"./ToSubmit/Cleaned Data with Labels and averages.csv",row.names = F)

