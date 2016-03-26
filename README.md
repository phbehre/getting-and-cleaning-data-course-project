# getting-and-cleaning-data-course-project

The repository contains the R script to download data collected from the accelerometers from the Samsung Galaxy S smartphone. The data was collected in the context of the UCI Human Activity Recognition Using Smartphones Data Set. Please see more details on the project and the related dataset [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Please find the dataset used via the following link [Project Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). After extracting the zip file, you can find detailed information  about the structure of the dataset in /UCI HAR Dataset/README.txt.

The R script in this repository:


1. Downloads the original data set from the project [Project Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

2. Merges the training and the test sets to create one data set
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

For detailled information, please see the file "Codebook.md"





