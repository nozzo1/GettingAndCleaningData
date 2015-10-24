Getting and Cleaning Data Course Project
========================================

Course Code getdata-033

## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Requirements

+ Merges the training and the test sets to create one data set.
+ Extracts only the measurements on the mean and standard deviation for each measurement. 
+ Uses descriptive activity names to name the activities in the data set
+ Appropriately labels the data set with descriptive variable names. 
+ From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Guide to files in this Git Repo

+ __CodeBook.md__: General guide to the data manipulation.
+ __README.md__: The file displayed.
+ __run_analysis.R__: Single script to download, manipulate and output tidy data.
+ __tidydata.txt__: An example of the output from the script.

## Reproducing Results

1. clone this repository: `git clone git@github.com:maurotrb/getting-cleaning-data-2014-project.git`
2. download [compressed raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3. unzip raw data and copy the directory `UCI HAR Dataset` to the cloned repository root directory
4. open a R console and set the working directory to the repository root (use setwd())
5. source run_analisys.R script (it requires the plyr package): `source('run_analysis.R')`

