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

## set up directories to R working directory, as per instructions 
## script expects all data files to be in R working directory
theTrainDirectory <- paste(getwd(),"/",sep="")
theTestDirectory <- paste(getwd(),"/",sep="")
theDataDirectory <- paste(getwd(),"/",sep="")
library(dplyr)
library(data.table)

## check if data files are in current working directory
theFileList = c("activity_labels.txt","features.txt",
                "X_train.txt","y_train.txt","subject_train.txt",
                "X_test.txt","y_test.txt","subject_test.txt")
warning(paste("The current working directory is:",getwd()))
for (i in 1:length(theFileList)) {
     if (!file.exists(theFileList[i])) stop(paste("File",theFileList[i],"is not in the working directory. Please add this file to the working directory and rerun the script."))
}
## if we get this far, all files exist, so send a message to console 
warning(paste("All required files confirmed as existing in",getwd()))

## read activity file
activityData <- read.table(paste(theDataDirectory,"activity_labels.txt",sep=''),
                           col.names=c("activityId","activityName"),stringsAsFactors=FALSE)
## clean up text in activity file
activityData[,2] <- tolower(activityData[,2])
## remove underscores from activity name, since character strings will be quoted in output file
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

## use data.table approach to sum multiple columns with by groups
## see documentation at http://www.rdocumentation.org/packages/data.table/functions/data.table
theDataTbl <- data.table(theData)
aResult <- theDataTbl[,lapply(.SD,mean),by="personId,activityName",.SDcols=3:68]

## write the result to a text file
write.table(aResult,file="tidydata.txt",row.names = FALSE)

## read the file back into R to demonstrate we can read it 
myTidyData <- read.table("tidydata.txt",header=TRUE,stringsAsFactors = FALSE)

## confirm that data we read back in matches data we wrote out
## by comparing first numeric and last numeric column - differences should
## sum to zero 
myComp <- aResult$tBodyAccMeanX - myTidyData$tBodyAccMeanX
message("Comparing first numeric variable tBodyAccMeanX - output file vs. input")
round(sum(myComp),digits = 6)
myComp <- aResult$fBodyBodyGyroJerkMagStdev - myTidyData$fBodyBodyGyroJerkMagStdev
message("Comparing last numeric variable fBodyBodyGyroJerkMagStdev - output file vs. input")
round(sum(myComp),digits = 6)
