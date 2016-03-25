# work in progress

# Download the data files and place them in a folder called "data". The file in the folder "UCI_HAR_dataset.zip" will include collected from the accelerometers from the Samsung Galaxy S smartphone.
# For details on please visit the UCI site "Human Activity Recognition Using Smartphones Data Set"(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) from where this data was originally obtained
# The script was created based on the dataset provided on 03/25/2016, please see the link used to obtain the data for any changes on the original dataset

# Create "data" folder, download the data

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/UCI_HAR_dataset.zip",method="curl")

#  Unzip the file "UCI_HAR_dataset.zip" 

unzip(zipfile="./data/UCI_HAR_dataset.zip",exdir="./data")

# To learn more about the structure of the original dataset, please read the "README.txt" file in the unzipped folder created.
# The "README.txt" file provided detailled information on the original dataset, including the license information.

# work in progress