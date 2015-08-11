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

## set up directories
theTrainDirectory <- "./data/UCI HAR Dataset/train/"
theTestDirectory <- "./data/UCI HAR Dataset/test/"
theDataDirectory <- "./data/UCI HAR Dataset/"
library(dplyr)

## read activity file
activityData <- read.table(paste(theDataDirectory,"activity_labels.txt",sep=''),
                           col.names=c("activityId","activityName"),stringsAsFactors=FALSE)
## clean up text in activity file
activityData[,2] <- tolower(activityData[,2])
activityData[,2] <- sub("_"," ",activityData[,2])
## read test file
testData <- read.table(paste(theTestDirectory,"X_test.txt",sep=""))
testLabels <- read.table(paste(theTestDirectory,"y_test.txt",sep=""),
                         col.names=c("activityId"))
testSubjects <- read.table(paste(theTestDirectory,"subject_test.txt",sep=""),col.names=c("personId"))

## read features file
featureData <- read.table(paste(theDataDirectory,"features.txt",sep=''),stringsAsFactors=FALSE)

## identify the columns that measure means from the feature data as vector of row indexes
theMeanIndexes <- featureData[grepl("mean()",featureData$V2) & !grepl("meanFreq()",featureData$V2),1]

## identify the columns that measure standard deviations from the feature data as vector
## of row indexes
theStdsIndexes <- featureData[grep("std()",featureData$V2),1]

## process featureData to clean up column names and apply as column names to test data 
featureData[,2] <- sub("mean","Mean",featureData[,2])
featureData[,2] <- sub("std","Stdev",featureData[,2])
## strip out () from featureData
featureData[,2] <- sub("\\(\\)","",featureData[,2])
## strip out dashes, and label the testData
featureData[,2] <- gsub("-","",featureData[,2])
colnames(testData) <- featureData[,2]
meanColNames <- featureData[c(theMeanIndexes,theStdsIndexes),2]
theTestTable <- as.tbl(testData)
theDataSubset <- theTestTable[,meanColNames]
## bind test subject ids, activity ids to test data 
testDataFinal <- cbind(testSubjects,testLabels,theDataSubset)
## read training data files
trainData <- read.table(paste(theTrainDirectory,"X_train.txt",sep=""))
trainLabels <- read.table(paste(theTrainDirectory,"y_train.txt",sep=""),
                         col.names=c("activityId"))
trainSubjects <- read.table(paste(theTrainDirectory,"subject_train.txt",sep=""),col.names=c("personId"))
## assign column names from featureData to training data, in prep for rbind()
colnames(trainData) <- featureData[,2]
theTrainTable <- as.tbl(trainData)
trainDataSubset <- theTrainTable[,meanColNames]
trainDataFinal <- cbind(trainSubjects,trainLabels,trainDataSubset)
## remove unnecessary data prior to rbind
rm(testData,testLabels,testSubjects,theDataSubset,theTestTable,trainData,theTrainTable)
## bind the rows, should be 2947 + 7352 = 10299 rows, 68 columns 
theData <- rbind(trainDataFinal,testDataFinal)
## merge activity labels with final dataset: important to do this after binding columns
## for training & test data because the merge sorts the data by activityId
theData <- merge(theData,activityData,by.x="activityId",by.y="activityId")