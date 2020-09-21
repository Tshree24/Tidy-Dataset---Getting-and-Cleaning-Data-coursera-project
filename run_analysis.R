#Merging the train and test data.
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

#Creating a table with all the merged data set.
mergeddata <- cbind(subject, y,x)

#Extracting/ selecting the respective measurements of mean and standard deviation.
tidydata <- Merged_Data %>% select(subject, code, contains("mean"), contains("std")) 

#Using descriptive activity names to name the activities in the data set
tidydata$code <- activities[tidydata$code, 2]
names(tidydata)[2] = "activity"
names(tidydata)<-gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata)<-gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata)<-gsub("BodyBody", "Body", names(tidydata))
names(tidydata)<-gsub("Mag", "Magnitude", names(tidydata))
names(tidydata)<-gsub("^t", "Time", names(tidydata))
names(tidydata)<-gsub("^f", "Frequency", names(tidydata))
names(tidydata)<-gsub("tBody", "TimeBody", names(tidydata))
names(tidydata)<-gsub("-mean()", "Mean", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("-std()", "STD", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("-freq()", "Frequency", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("angle", "Angle", names(tidydata))
names(tidydata)<-gsub("gravity", "Gravity", names(tidydata))

#Final data set
finalset <- tidydata %>%
  group_by(activity, subject) %>%
  summarise_all(funs(mean = mean))
write.table(finalset, "finaldataset.txt", row.name=FALSE)
  
  