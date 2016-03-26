library(data.table)
# Download the data files and place them in a folder called "data". The file in the folder "UCI_HAR_dataset.zip" will include collected from the accelerometers from the Samsung Galaxy S smartphone.
# For details on please visit the UCI site "Human Activity Recognition Using Smartphones Data Set"(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from where this data was originally obtained
# The script was created based on the dataset provided on 03/25/2016, please see the link used to obtain the data for any changes on the original dataset

# Create "data" folder, download the data

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/UCI_HAR_dataset.zip",method="curl")

#  Unzip the file "UCI_HAR_dataset.zip
unzip(zipfile="./data/UCI_HAR_dataset.zip",exdir="./data")

# read data from files into data frames
featureNames <- read.table("./data/UCI HAR Dataset/features.txt")
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)

subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activityTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
featuresTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)

subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activityTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
featuresTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)

#merge data sets
subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

#set meaningful column names
colnames(features) <- t(featureNames[2])

colnames(activity) <- "Activity"
colnames(subject) <- "Subject"

#merge complete data set
completeData <- cbind(features,activity,subject)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(completeData), ignore.case=TRUE)

requiredColumns <- c(columnsWithMeanSTD, 562, 563)


Data <- completeData[,requiredColumns]


# Uses descriptive activity names to name the activities in the data set 
Data$Activity <- as.character(Data$Activity)
for (i in 1:6){
  Data$Activity[Data$Activity == i] <- as.character(activityLabels[i,2])
}

Data$Activity <- as.factor(Data$Activity)

# Appropriately labels the data set with descriptive variable names
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("^t", "Time", names(Data))
names(Data)<-gsub("^f", "Frequency", names(Data))
names(Data)<-gsub("tBody", "TimeBody", names(Data))
names(Data)<-gsub("-mean()", "Mean", names(Data), ignore.case = TRUE)
names(Data)<-gsub("-std()", "STD", names(Data), ignore.case = TRUE)
names(Data)<-gsub("-freq()", "Frequency", names(Data), ignore.case = TRUE)
names(Data)<-gsub("angle", "Angle", names(Data))
names(Data)<-gsub("gravity", "Gravity", names(Data))

Data$Subject <- as.factor(Data$Subject)
Data <- data.table(Data)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidyDataset <- aggregate(. ~Subject + Activity, Data, mean)
tidyDataset <- tidyDataset[order(tidyDataset$Subject,tidyDataset$Activity),]
write.table(tidyDataset, file = "UCI_HAR_tidy_dataset.txt", row.names = FALSE)


