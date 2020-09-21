#The following operations are performed for the completion of the course project

1. Prepartion stage : Downloading the dataset
Dataset is downloaded and extracted from the given zip files and saved in the folder named UCI HAR Dataset

2. Assigning varibale to each data 
features <- features.txt : 561 rows, 2 columns
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
activities <- activity_labels.txt : 6 rows, 2 columns
List of activities performed when the corresponding measurements were taken and its codes (labels)
subject_test <- test/subject_test.txt : 2947 rows, 1 column
contains test data of 9/30 volunteer test subjects being observed
x_test <- test/X_test.txt : 2947 rows, 561 columns
contains recorded features test data
y_test <- test/y_test.txt : 2947 rows, 1 columns
contains test data of activities'code labels
subject_train <- test/subject_train.txt : 7352 rows, 1 column
contains train data of 21/30 volunteer subjects being observed
x_train <- test/X_train.txt : 7352 rows, 561 columns
contains recorded features train data
y_train <- test/y_train.txt : 7352 rows, 1 columns
contains train data of activities'code labels

3. The run_analysis.R script performs the following data operations 
  *Merges the training and the test sets to create one data set
    -x (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function
    -y (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function
    -Subject (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function
    -mergeddata (10299 rows, 563 column) is created by merging Subject, x and y using cbind() function

  *Extracts the respective measurements on the mean and standard deviation 
    -tidydata(10299 rows, 88 columns) is created by subsetting mergeddata, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

  *Use of descriptive activity names for different activity names in the data set
    -Entire numbers in code column of the tidydata isreplaced by the respective activity taken from second column of the activities variable

  *Appropriately labels the data set with descriptive variable names
code column in tidydata renamed into activities
    - Acc in every column name is replaced by Accelerometer
    - Gyro in every column name is replaced by Gyroscope
    - BodyBody in every column name is replaced by Body
    - Mag in every column name is replaced by Magnitude
    - Column names starting with f are replaced by  Frequency
    - Column names starting with t are replaced by  Time
  

  * From the tidydata set obtained we create a final dataset with average of each variable for each activity and each subject
    - tidysdata is grouped by activity and subject columns and finalset (180 rows, 88 columns) is created by sumarizing tidydata by taking the means of each variable for each activity and each subject
    - finalset is exported into finaldataset.txt file.