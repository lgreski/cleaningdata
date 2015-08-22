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

## download UCI HAR dataset zip file from Coursera website and unzip to working directory
## note: since zip file includes its own subdirectory structure, use it directly instead of 
##       trying to manipulate it 
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile='HAR.zip',method="curl",mode="wb")
unzip(zipfile = "HAR.zip")

## set up directories to R working directory and unzipped HAR subdirectories, as per instructions 
theTrainDirectory <- paste(getwd(),"/UCI HAR Dataset/train/",sep="")
theTestDirectory <- paste(getwd(),"/UCI HAR Dataset/test/",sep="")
theDataDirectory <- paste(getwd(),"/UCI HAR Dataset/",sep="")

## check to see whether required packages are installed, and install if needed
if (!"dplyr" %in% installed.packages()) {
     warning("Package dplyr required for this script. Installing dplyr now.")
     install.packages("dplyr")
}
if (!"data.table" %in% installed.packages()) {
     warning("Package data.table required for this script. Installing data.table now.")
     install.packages("data.table")
}
library(dplyr)
library(data.table)

## read activity file
activityData <- read.table(paste(theDataDirectory,"activity_labels.txt",sep=''),
                           col.names=c("activityId","activityName"),stringsAsFactors=FALSE)
## clean up text in activity file
activityData[,2] <- tolower(activityData[,2])
## remove underscores from activity name, since character strings will be quoted in output file
activityData[,2] <- sub("_"," ",activityData[,2])

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
featureData[,2] <- sub("BodyBody","Body",featureData[,2])
## strip out () from featureData
featureData[,2] <- sub("\\(\\)","",featureData[,2])
## change t and f to Time and Freq
featureData[,2] <- sapply(featureData[,2],function(x) {
     if(substr(x,1,1)=="t") {
          x <- paste("Time",substr(x,2,nchar(x)),sep="")
     } else if(substr(x,1,1)=="f") {
          x <- paste("Freq",substr(x,2,nchar(x)),sep="")
     }
     x
})

## strip out dashes, and create vectors of means and standard deviations
## to subset the measurement data sets
featureData[,2] <- gsub("-","",featureData[,2])

meanColNames <- featureData[c(theMeanIndexes,theStdsIndexes),2]

## read test files, add column labels to measurement data set and bind
## subject and activity ids
testData <- read.table(paste(theTestDirectory,"X_test.txt",sep=""))
testLabels <- read.table(paste(theTestDirectory,"y_test.txt",sep=""),
                         col.names=c("activityId"))
testSubjects <- read.table(paste(theTestDirectory,"subject_test.txt",sep=""),col.names=c("personId"))
## set the column names for measurement file with the complete list of feature names
colnames(testData) <- featureData[,2]
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

## append "mean of" to front of variable names, using apply then clean up first two names
## and overwrite existing column names
theColumns <- colnames(aResult)
theColumns <- sapply(theColumns, function(x) {paste("meanOf",x,sep="")})
setnames(aResult,1:length(theColumns),theColumns)
setnames(aResult,1,"personId")
setnames(aResult,2,"activityName")
## write the result to a text file
write.table(aResult,file="tidydata.txt",row.names = FALSE)

## read the file back into R to demonstrate we can read it 
myTidyData <- read.table("tidydata.txt",header=TRUE,stringsAsFactors = FALSE)

## confirm that data we read back in matches data we wrote out
## by comparing first numeric and last numeric column - difference of sums should
## be zero 
myComp <- sum(aResult$MeanOfTimeBodyAccMeanX) - sum(myTidyData$MeanOfTimeBodyAccMeanX)
paste("Difference of first numeric variable MeanOftBodyAccMeanX - output file vs. input: ",myComp)
myComp <- sum(aResult$MeanOfFreqBodyGyroJerkMagStdev) - sum(myTidyData$MeanOfFreqBodyGyroJerkMagStdev)
paste("Difference of last numeric variable MeanOfFreqBodyGyroJerkMagStdev - output file vs. input: ",myComp)

