library("dplyr")
library("tidyr")

# download zip file 
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- "UCI HAR Dataset.zip"
if (!file.exists(file)) {
  download.file(fileURL, file, mode = "wb")
}

## Get feature Data
features = read.table("features.txt",stringsAsFactors = FALSE,col.names=c("id","feature"))

## Get activity Data
activities = read.table("activity_labels.txt",col.names=c("id_activity","activity"))

## Get measurements 
X_train = read.table("train/X_train.txt")
X_test = read.table("test/X_test.txt")

## Get labels
y_train = read.table("train/y_train.txt",col.names="id_activity")
y_test = read.table("test/y_test.txt",col.names="id_activity")

## Get and merge train and test subjects
subjects_train = mutate(read.table("train/subject_train.txt",col.names="subject"),set="TRAIN")
subjects_test = mutate(read.table("test/subject_test.txt",col.names="subject"),set="TEST")
subjects = rbind(subjects_train,subjects_test)
colnames(subjects) <- c("subject","set")

# (1) Merges the training and the test sets to create one data set.

## Merge train and test measurements
X = rbind(X_train,X_test)
## Merge train and test labels
y = rbind(y_train,y_test)

# (2) Extracts only the measurements on the mean and standard deviation for each measurement.

## assign features as column names
colnames(X) <- features[,2]

## Keep only the measurements on the mean and standard deviation 
pattern = "(-mean|-std)"
X =  X[ ,grepl(pattern, colnames(X))]

# (3) Uses descriptive activity names to name the activities in the data set

## merge labels and activities on id_activity 
y =  select(merge(y,activities),-id_activity)

# (4) Appropriately labels the data set with descriptive variable names.

newcols <- colnames(X)
newcols <- gsub("[\\(\\)-]", "", newcols)
newcols <- gsub("^f", "freq", newcols)
newcols <- gsub("^t", "time", newcols)
newcols <- gsub("mean", "Mean", newcols)
newcols <- gsub("std", "Std", newcols)
colnames(X) <- newcols

## Merge subjects, measurements and labels
measurements = cbind(subjects,y,X)

# (5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

by_subject_activity = group_by(measurements,subject,activity)
summary = summarise_at(by_subject_activity,4:82,mean)

write.table(measurements,'tidy_dataset.txt', row.name=FALSE)
