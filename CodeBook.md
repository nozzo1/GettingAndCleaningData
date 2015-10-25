CodeBook for Getting and Cleaning Data Project
==============================================

Course Code getdata-033
-----------------------

## Preamble
This data is taken from Human Activity Recognition Using Smartphones Dataset.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Further information can be obtained from the files referenced in the README.md

## License:

I acknowledged these references [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## About the R Script

## Data Setup

First the data is read from the various files and placed in to vectors as:
	testActivity = .\test\Y_test.txt
	testSubject = .\test\subject_test.txt
	testFeatures = .\test\X_test.txt
	trainActivity = .\train\trainY_train.txt
	trainSubject = .\train\subject_train.txt
	trainFeatures = .\train\X_train.txt
	
Then combined by type to vectors containing related data:
	
	subjectData <- rbind(trainSubject, testSubject)
	activityData<- rbind(trainActivity, testActivity)
	featuresData<- rbind(trainFeatures, testFeatures)

## Data Label Cleanup
	
The script then clarifies the data labels with "subject" and "activity" and related information from __features.txt__

The abbreviated activity names are expanded to make the data more readable:

	t          = time
	Acc        = Accelerometer
	Gyro       = Gyroscope
	f          = frequency
	Mag        = Magnitude
	BodyBody   = Body
	
A vector called __Data__ is used to store data subset only for the 'mean' and 'std' columns as per the project specificiation.
This data subset is manipulated using 'gsub' to expand the activity names.

For example, this line of code expands 'time' from 't':

	names(Data)<-gsub("^t", "time", names(Data))
	
The same method is used for the other activities as per the script.

## Clarifying Activity Type
From the file 'activity_labels.txt' the activity names and their numeric placeholders are:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

## Output
Finally the script outputs a file named tidydata.txt which orders the data by Subject (the person perorming the test), the Activity type and the measurement data.
The format makes it usable both Machine Readable and Human Readable.

