library("dplyr")
library("tidyr")

## Get feature Data
features = read.table("features.txt",stringsAsFactors = FALSE,col.names=c("id","feature"))
pattern = "(-mean|-std)\\(\\)$"
## list with only columns of the measurements on the mean and standard deviation for each measurement.
features = mutate(features[ grepl( pattern , features$feature), ],id=paste("V",id,sep=""))

## Get activity Data
activities = read.table("activity_labels.txt",col.names=c("id_activity","activity"))

## Get and merge train and test subjects
subjects_train = mutate(read.table("train/subject_train.txt",col.names="subject"),set="TRAIN")
subjects_test = mutate(read.table("test/subject_test.txt",col.names="subject"),set="TEST")
subjects = rbind(subjects_train,subjects_test)

## Get measurements and labels
X_train = read.table("train/X_train.txt")
X_test = read.table("test/X_test.txt")

y_train = read.table("train/y_train.txt",col.names="id_activity")
y_test = read.table("test/y_test.txt",col.names="id_activity")

## Only mean and std measurements and add "set" column
X_train = select(X_train, as.numeric(substr(features$id,2,length(features$id)))) %>% mutate(set="TRAIN")
X_test = select(X_test, as.numeric(substr(features$id,2,length(features$id)))) %>% mutate(set="TEST")

## Merge train and test measurements
X = rbind(X_train,X_test)

## Merge train and test labels
y = rbind(y_train,y_test)

## Name the activities 
y =  merge(y,activities,by.x="id_activity",by.y="id_activity")["activity"]

## Merge measurements and labels
xy = cbind(X,y)
xy = cbind(xy,subjects)

# Collapse feature columns into one key-value (feature,measurement) pair for measurements  
xy = gather(xy,id_feature,measurement,-c(activity,set,subject))
xy = merge(xy,features, by.x="id_feature", by.y="id")
xy = xy[,c("subject","set","activity","feature","measurement")]

# independent tidy data set with the average of each variable for each activity and each subject.
by_subject_activity = group_by(xy,subject,activity,feature)
xy2 = summarize(by_subject_activity,mean=mean(as.numeric(measurement)))

write.table(xy,'tidy_dataset_1.txt', row.name=FALSE)
write.table(xy2,'tidy_dataset_2.txt', row.name=FALSE)
