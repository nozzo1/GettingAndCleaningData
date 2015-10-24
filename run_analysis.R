
## This script was written by following the step by step instruction in the R-Studio tutorial
## on this Coursera Project published October 2014 (https://rstudio-pubs-static.s3.amazonaws.com/37290_8e5a126a3a044b95881ae8df530da583.html)
## Reference attribution noted.
## Also thank you to David Hood's reference (https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/)
## Getting and Cleaning Data Course Project
## Final version.

## run_analysis.R
## Coursera getdata-033 project.

## Load dplyr for use later on
library(dplyr);

## Download the package required in the course text then unzip. 
if(!file.exists("./data")){dir.create("./data")}
downloadUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(downloadUrl,destfile="./data/projectdata.zip")
unzip(zipfile="./data/projectdata.zip",exdir="./data")

## setup the file path - I've just used standard methods for this rather than reinvent the wheel. 
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)

## Read the six files and assign data to vectors. There are 2 directories each with 3 files that can be paired.

testActivity  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
testSubject   <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
testFeatures  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
trainActivity <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
trainSubject  <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
trainFeatures <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

## Now merge them by type in to their final vectors then perform rename operations to clarify names.

subjectData <- rbind(trainSubject, testSubject)
activityData<- rbind(trainActivity, testActivity)
featuresData<- rbind(trainFeatures, testFeatures)
names(subjectData)<-c("subject")
names(activityData)<- c("activity")
featuresNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(featuresData)<- featuresNames$V2

## Merge the new vectors from the previous step

combinedData <- cbind(subjectData, activityData)
Data <- cbind(featuresData, combinedData)

## Now GREP for labels containing 'mean' and 'std' per the Coursera description. After that we'll subset the Data vector.

subfeaturesNames<-featuresNames$V2[grep("mean\\(\\)|std\\(\\)", featuresNames$V2)]
selectedNames<-c(as.character(subfeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

## I'll use this format of standardised names from the website mentioned at the top of this script.
## old prefix = expanded name
################################
## t          = time
## Acc        = Accelerometer
## Gyro       = Gyroscope
## f          = frequency
## Mag        = Magnitude
## BodyBody   = Body

activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE) ## Read in the label info.
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

## Part 5 calls for tidy dataset. After reading much discussion on the forum and seeing David Hoods comments I'll format as:
## Wide format. So we have the Subject then their activities followed by the measurements.
tidyData<-aggregate(. ~subject + activity, Data, mean)          ## First step to get the mean info in the right way
tidyData<-tidyData[order(tidyData$subject,tidyData$activity),]  ## Then order it so we get the desired Subject and their Activity data in order
write.table(tidyData, file = "tidydata.txt",row.name=FALSE)     ## Write the table so I can add it to the submission.
## end

