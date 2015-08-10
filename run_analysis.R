## File: run_analysis.r
## Author: Leonard Greski
## Course: getdata-031, Getting and Cleaning Data, Johns Hopkins University / Coursera
## 
## Date: 10 August 2015
## Revision history: revisions tracked on github.com
## 
## Processing requirements per Project Instructions at 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
if (Sys.getenv("OS") == "Windows_NT") setwd("C:/Users/Leonard/Desktop/OneDrive/Coursera/R Working Directory")

## set up directories
theTrainDirectory <- "./data/UCI HAR Dataset/train/"
theTestDirectory <- "./data/UCI HAR Dataset/test/"
theDataDirectory <- "./data/UCI HAR Dataset/"

## read activity file
activityData <- read.table(paste(theDataDirectory,"activity_labels.txt",sep=''))
## read features file
featureData <- read.table(paste(theDataDirectory,"features.txt",sep=''))
## read test file
testData <- read.table(paste(theTestDirectory,"x_test.txt",sep=""))
testLabels <- read.table(paste(theTestDirectory,"y_test.txt",sep=""))
testSubjects <- read.table(paste(theTestDirectory,"subject_test.txt",sep=""))

## identify the columns that measure means from the feature data - as an array of indexes 
theMeans <- featureData[grepl("mean()",featureData$V2) & !grepl("meanFreq()",featureData$V2),1]

## identify the columns that measure standard deviations from the feature data
theStds <- featureData[grep("std()",featureData$V2),1]
