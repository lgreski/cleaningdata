Getting and Cleaning Data: README
=================================
* [Overview](#overview)
    * [Project Summary](#summary)
    * [Repository Contents](#contents)
    * [Output File: why is it tidy?](#tidydesc)
    * [Reading the output file](#readoutput)
* [Processing Steps](#processing)
    * [Outline of Steps in run_analysis.R](#stepsoutline)
    * [Commentary: Reading the input files](#reading)
    * [Commentary: Finding the means and standard deviations](#finding)
    * [Commentary: Output file format - wide vs. narrow tidy data set](#widevsnarrow)
* [Running the R Script](#runscript)

* * *

<h1 id="overview">Overview</h1>

The [lgreski/cleaningdata](http://github.com/lgreski/cleaningdata) GitHub repository includes the files required to fulfill project requirements for the *Getting and Cleaning Data* course offered by Johns Hopkins University's School of Public Health via Coursera during August 2015. The objective of the course project is to convert "messy" data into a *tidy* format, where the definition of *tidy* is based on Hadley Wickham's 2014 paper in the *Journal of Statistical Software*, [Tidy Data](http://http://vita.had.co.nz/papers/tidy-data.pdf). In the paper, Wickham lists three characteristics that make a data set tidy, including:

  1. Each variable forms a column,
  2. Each observation forms a row, and
  3. Each type of observational unit forms a table.

<h2 id="summary">Project Summary</h2>

The technology research firm Gartner, Inc. has identified four major forces that are converging to radically change the way people live and work. They call this convergence the *Nexus of Forces,* and it includes social computing, cloud-based computing, mobility, and information.

As described in *The Nexus of Forces: Social, Mobile, Cloud, and Information,* Gartner explains how these different forces work together.
>In the Nexus of Forces, information is the *context* for delivering enhanced social and
 mobile experiences. Mobile devices are a *platform* for effective social networking and new ways of work. Social links *people* to their work and each other in new and unexpected ways. Cloud enables the *delivery* of information and functionality to users and systems. The forces of the Nexus are intertwined to create a user-driven ecosystem of modern computing. Reference: Howard, C. et. al., *The Nexus of Forces: Social, Mobile, Cloud, and Information,* Gartner Inc., Stamford CT, June 2012.

Wearable computing is at the center of the nexus of forces. It uses mobile devices as a platform to generate large amounts of data about people's behavior. Scientists are only now beginning to explore ways that mobile computing and big data can help us better understand human behavior. One such study was undertaken by Jorge L. Reyes-Ortiz et. al. from the *Technical Research Centre for Dependency Care and Autonomous Living*. In April 2013 they released [A Public Domain Dataset for Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The data set is the result of an experiment to track people's daily activities while a Samsung Galaxy SII smartphone was attached to each participant's waist. The smartphones contained embedded inertial sensors (an accelerometer and gyroscope) that were used to track 561 different measurements. Per the [HCI@SMARTLAB](https://sites.google.com/site/harsmartlab/) website, a group of 30 volunteers were tracked on six basic activities that were measured with 3-dimensional \(X, Y, and Z axes\) for both linear acceleration and angular velocity.

>The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. They performed a protocol of activities composed of six basic activities: three static postures (standing, sitting, lying) and three dynamic activities (walking, walking downstairs and walking upstairs). The experiment also included postural transitions that occurred between the static postures. These are: stand-to-sit, sit-to-stand, sit-to-lie, lie-to-sit, stand-to-lie, and lie-to-stand. All the participants were wearing a smartphone (Samsung Galaxy S II) on the waist during the experiment execution. We captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz using the embedded accelerometer and gyroscope of the device. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was \[sic\] selected for generating the training data and 30% the test data.

The research team also explained how the data from the inertial sensors were processed into a file containing 561 features \(or more accurately, measurements\) for each experiment.

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 561 features was obtained by calculating variables from the time and frequency domain.

Reference: HAR@SMARTLAB website, retrieved from https://sites.google.com/site/harsmartlab/ on August 12, 2015.

All thirty participants were tracked on three static postures and three dynamic activities. Each person was recorded multiple different times for each of the six activities. There was considerable variability in the number of times each person participated experiments for the various categories of experiments, as illustrated by the following table of minimum / maximum observations per person across each of the activities.
<table>
    <tr>
        <th valign="bottom">Activity</th>
        <th align="center">Minimum Observations </th>
        <th align="center">Maximum Observations</th>
    </tr>
    <tr>
        <td>Laying</td>
        <td align="center">48</td>
        <td align="center">90</td>
    </tr>
    <tr>
        <td>Sitting</td>
        <td align="center">44</td>
        <td align="center">85</td>
    </tr>
    <tr>
        <td>Standing</td>
        <td align="center">44</td>
        <td align="center">89</td>
    </tr>
    <tr>
        <td>Walking</td>
        <td align="center">46</td>
        <td align="center">95</td>
    </tr>
    <tr>
        <td>Walking downstairs</td>
        <td align="center">36</td>
        <td align="center">62</td>
    </tr>
    <tr>
        <td>Walking upstairs</td>
        <td align="center">40</td>
        <td align="center">65</td>
    </tr>
</table>

The activity of *walking downstairs* had the lowest experiment frequency in the data set. That is, the person who was least frequently observed walking downstairs was recorded 36 times as walking downstairs. The most frequently observed activity was *walking*, and the person who was most frequently observed in this activity was recorded 95 times as *walking*.

Although the variability in frequency between numbers of recorded experiments by activity / person and potential correlations with "within person" patterns on the accelerometer and gyroscope merits additional analysis, it is beyond the scope of this project.

The data was randomly partitioned into two separate sets of data: 70% of the participants were allocated to a training group, and the remaining 30% were allocated to the test group. The training data was used to train a proposed Multiclass Hardware Friendly Support Vector Machine \(MC-HF-SVM\), described in [Anguita, et. al. 2012](http://www.icephd.org/sites/default/files/IWAAL2012.pdf). The test data was then used to evaluate the effectiveness of the MC-HF-SVM in classifying activities based on the measurements taken by the smartphone.  The classification performance from the HF-SVM was compared to a more traditional Multiclass SVM \(MC-SVM\). The proposed MC-HF-SVM performed comparably to the traditional MC-SVM, indicating that the hardware friendly approach could provide a more economical alternative to the traditional MC-SVM, while maintaining the same level of accuracy.

### The Data Cleaning Task ###

The objective for the *Getting and Cleaning Data* course project is to read the eight files distributed by the research team and combine them into a single dataset that is easy to use for subsequent analysis in the statistics package R.

Specifically, as outlined in the course project instructions, participants must develop an R script called *run_analysis.R* that:
  1. Merges the separate training and test data files to create one data set.
  2. Eliminate all measurements other than means and standard deviations from the measurement data, which contains 561 different measurements taken on the smartphone.
  3. Create descriptive activity names to name each activity in the data set.
  4. Label all variables in the data set with descriptive variable names.
  5. Create an output data file from the result of steps 1 - 4, an independent tidy data set that contains the average of each variable for each activity.

<h3 id="considerations"> Cleaning Considerations </h3>
The key challenge to using the data set  provided by the *Technical Research Centre* is that there is no single piece of documentation that explains in straightforward business terms how the different files relate to each other and how to combine them into a single data set for subsequent analysis. The contents of the eight files are summarized below.
<table>
    <tr>
        <th>File</th>
        <th>Description</th>
    </tr>
    <tr>
        <td valign=top>activity_labels.txt</td>
        <td>File containing six rows of data, where each row contains an activity identifier and an activity description, a text label to associate with the y_train.txt and y_test.txt files. The numeric identifier and text labels are separated by a blank space. The activity label words are delmited by an underscore when an activity contains more than a single word. </td>
    </tr>
    <tr>
        <td valign=top>features.txt</td>
        <td>File listing the 561 different measurements taken from the smartphone each time a person was measured for one of the six activities monitored during the experiment. Data is listed in one row per measurement, where the line number in the file is the assumed key to match against the test and training data files. </td>
    </tr>
    <tr>
        <td valign=top>subject_test.txt</td>
        <td>File containing one column of data that identifies the subject (i.e. person) corresponding to each row of data in the test measurement x_test.txt file.  </td>
    </tr>
    <tr>
        <td valign=top>x_test.txt</td>
        <td> File containing 561 measurements for each observed experiment on one of the six activities.</td>
    </tr>
    <tr>
        <td valign=top>y_test.txt</td>
        <td>File containing one column of data that identifies the activity corresponding to each row of data in the test measurement x_test.txt file.</td>
    </tr>
    <tr>
        <td valign=top>subject_train.txt</td>
        <td>File containing one column of data that identifies the subject (i.e. person) corresponding to each row of data in the test measurement x_train.txt file.  </td>
    </tr>
    <tr>
        <td valign=top>x_train.txt</td>
        <td> File containing 561 measurements for each observed experiment on one of the six activities.</td>
    </tr>
    <tr>
        <td valign=top>y_train.txt</td>
        <td>File containing one column of data that identifies the activity corresponding to each row of data in the test measurement x_train.txt file.</td>
    </tr>
</table>

Ultimately, to use the test data one must combine three files: x_test, y_test, and subject_test by adding y_test and subject_test as additional columns to the x_test data in order to have a complete observation -- one row of data per person / activity / experiment run. The same set of operations is required for the training data. The fact that a single observational unit \(person / activity / experiment\) is split over three separate files \(or tables\) demonstrates that this data qualifies as "messy" according to Hadley Wickham's definition of messy data.

Once these data are combined, then the content from the features.txt file must be used to create variable labels for the test and training data.

<h2 id="contents">Repository Contents</h2>

The [lgreski/cleaningdata](http://github.com/lgreski/cleaningdata) repository includes three files that are required to be posted to GitHub for the assignment.  The files in the GitHub repository include:

<table>
    <tr>
        <th>File</th>
        <th>Description</th>
    </tr>
    <tr>
        <td valign=top>README.md</td>
        <td>A file in markdown format that displays when someone accesses the GitHub repository for a person's submission for the course project. The file is located at https://github.com/lgreski/cleaningdata/blob/master/README.md </td>
    </tr>
    <tr>
        <td valign=top>Codebook.md</td>
        <td>A file in markdown format that describes the variables \(columns\) contained in the tidy data set that must be uploaded to the Coursera website as part of the the project submission process. The file is located at https://github.com/lgreski/cleaningdata/blob/master/Codebook.md </td>
    </tr>
    <tr>
        <td valign=top>run_analysis.R</td>
        <td>An R script that contains all of the R functions used to transform the eight input data files into the required formats for steps 4 and 5 of the assignment instructions. The file is located at https://github.com/lgreski/cleaningdata/blob/master/run_analysis.R </td>
    </tr>
</table>  

A fourth file, the output from step 5 listed in *The Data Cleaning Task* section above must be uploaded to the Coursera website as part of the assignment submission process. We have also included this file in the GitHub repository for easy reference.

<table>
    <tr>
        <th>File</th>
        <th>Description</th>
    </tr>
    <tr>
        <td valign=top>tidydata.txt</td>
        <td>The output file from step 5 of the course project instructions, a tidy data set that includes descriptive variable names based on the features.txt file provided by the <em>Human Activity Recognition</em> research team. The file is located at https://github.com/lgreski/cleaningdata/blob/master/tidydata.txt </td>
    </tr>
</table>

<h2 id="tidydesc">Output File: why is it tidy?</h2>

The output file submitted for review qualifies as a tidy data set because it matches the requirements for tidy data outlined in Hadley Wickham's *Tidy Data* paper, including:

1. Each variable forms a column,
2. Each observation forms a row, and
3. Each type of observational unit forms a table.

In support of requirement 1 for tidy data, each column contains one and only one variable: an average of one of 66 means and standard deviations measured among the 561 measurements derived from data collected from the smartphone.

In support of tidy data requirement 2, the output file tidydata.txt, contains 180 rows, one for each combination of person and activity. An "observation" in this file is a person / activity combination. Thirty research participants with averages across six activities results in a 180 row file.

Finally, in support of tidy data requirement 3, there is one table output, and the observational unit: person / activity combinations, requires one and only one table.

<h3 id="readoutput">Reading the Output File</h3>

The output data file, tidydata.txt, is a space delimited file that includes quotes around the one character variable in the data set, activityName. The file includes column headings that are described in the accompanying  [Codebook.md](https://github.com/lgreski/cleaningdata/blob/master/Codebook.md).

To use the tidy data file, download [tidydata.txt](https://github.com/lgreski/cleaningdata/blob/master/tidydata.txt) from the GitHub repository and move it into the *R Working directory*.

The following R code can be used to read the tidy data file once it has been copied to the *R Working Directory*.

    theTidyData <- read.table("tidydata.txt",header=TRUE,stringsAsFactors = FALSE)


<h1 id="processing">Processing Steps</h1>

 This section provides an outline of the processing steps used to create the project deliverables, and explains the rationale behind various decisions we made as we produced the ouptut necessary to fulfill the five requirements listed in the project instructions. It concludes with step by step instructions for running the script.

<h2 id="stepsoutline">Summary of Processing Steps in run_analysis.R </h2>

1. Verify whether required R packages beyond base are installed, and if not present, install them  
2. Confirm all 8 required files are present in the R working directory
3. Read activity data and remove special characters from activity names
4. Read the features file and do the following:
    * Clean the feature identifiers by removing special characters
    * Identify features that are [means or standard deviations](#finding)
5. Read the test files \(X_test.txt, y_test.txt, and subject_test.txt\) and do the following:
    * Add column name, personId, to subject data set
    * Add column name, activityId, to activity data set
    * Assign column names to the measurement data set, using the previously cleaned feature names, fulfilling requirements \#3 and \#4
    * Remove unnecessary columns from the measurement data set to fulfill requirement \#2 from the project instructions
    * Bind the personId and activityId columns to the measurement data
6. Read the training files \(X_train.txt, y_train.txt, and subject_test.txt\) and do the following:
    * Add column name, personId, to subject data set
    * Add column name, activityId, to activity data set
    * Assign column names to the measurement data  set, using the previously cleaned feature names, fulfilling requirements \#3 and \#4
    * Remove unnecessary columns from the measurement data set to fulfill requirement \#2 from the project instructions
    * Bind the personId and activityId columns to the measurement data
7. Combine the test and training files into a single data set by using the rbind\(\) function, fulfilling requiremend\#1
8. Merge the activity labels into the combined measurement data set. At this point, course project requirements \#1 through \#4 are fulfilled
9. Summarize the measurement columns to create a wide version of a [tidy data set](#widevsnarrow)
    * Each variable forms a column: means of the 66 variables that were means or standard deviations plus personId and activityName for a total of 68 columns,
    * One row per subject \(personId\) activity \(activityName\) combination, and
    * Each observational unit \(personId\) \(activityName\) combinations with columns representing means of the 66 variables forms one table
10. Add "MeanOf" to beginning of measurement column names to signify that this data has been aggregated with the mean\(\) function beyond the data originally provided by the *Human Activity Recognition* research team  
11. Write the output file
12. Verify the accuracy of the output data file. At this point, course project requirement \#5 is fulfilled

<h2 id="reading">Commentary: Reading the Human Activity Recognition Input Files</h2>
As stated earlier, it was difficult to asertain from the documentation provided by the *Technical Research Centre* how to combine the information in the various files. The key clue to understanding their structure is that all three of the test files have the same number of rows \(2,947\) as do the training files \(7,352\). Then it becomes clear that these files should be combined to make a complete test or training data set.

The same challenge existed for naming the columns on the X_test.txt and X_train.txt data files. There are 561 rows in the features.txt file, one per column of data in the test and training measurements files. Since the features.txt file contains characters that are unsuitable for use as column names in an R data table, one must strip out these characters before using the feature data as a set of column names.

Complicating matters is the fact that one must process the files in a specific sequence in order to obtain the desired result, a complete file including personId, activityName, and the 561 columns of measurements. The correct sequence that must be taken separately with the test and training data is:

1. Determine which variables are means or standard deviations. Since this is easier to accomplish with the messy data, as one can search for mean\(\) and std\(\) text strings with the data as provided by the researchers, this step should be taken first
2. Clean the column names by removing characters that are not appropriate for column names in R
3. Create a list of the cleaned mean and standard deviation names for use in removing unwanted variables from the data set in fulfillment of requirement \#2
4. Remove all columns other than standard deviations and means from the measurement data set
5. Column bind the personId and activityId columns onto the measurement data set

Once these five steps are complete for both the test and training data, the two resulting data sets can be combined with the R rbind\(\) function that adds the rows from each table into a single output data frame.

Since some students reported problems with R running out of memory while processing the row bind between the test and training data, we eliminated all of the unwanted columns from the measurement data sets prior to executing the rbind\(\) function. Executing the processing steps in this order also improves the runtime speed of the script.  

Finally, we must merge the activity names into the combined test and training data in fulfillment of requirement \#3.

<h2 id="finding">Commentary: Deciding which Variables are the Means and Standard Deviations</h2>

As students in the *Getting and Cleaning Data* course worked on the assignment, they engaged in a vigorous discussion about how to determine the number of variables to keep as means or standard deviations per project requirement \#2. The *features_info.txt* file lists all of the base variables collected during the experiments, a total of 33 variables. A total of 17 different statistics were calculated on single variables or pairs of variables, for a total of 561 discrete measurements calculated for each person / activity / experiment combination.

Since there were 33 base variables and a mean and standard deviation was calculated for each one, we have included a total of 66 variables in the output tidy data set.

<h2 id="widevsnarrow">Commentary: Output File -- Wide vs. Narrow Tidy Format</h2>

In Hadley Wickham's *Tidy Data* paper, he describes two distinct formats for tidy data: narrow and wide \(Wickham, 2014 p. 6\). A wide format tidy data set contains multiple variables in columns, where each column represents one and only one variable for the observational unit. The narrow format "melts" the measurement columns into two distinct columns containing many more rows than a wide data set. These two columns are named "column" and "value", where each row of the narrow form data set contains one measurement of one variable per observational unit.

For the purposes of the *Getting and Cleaning Data* project, the data set that conforms with requirements \#1 - \#4 is a wide format data set. Since there is a straightforward way in R to summarize the 66 means and standard deviations by personId and activityName, then the wide format tidy data set is easiest to produce as per the following line of R code.

    aResult <- theDataTbl[,lapply(.SD,mean),by="personId,activityName",.SDcols=3:68]

Another benefit of the wide tidy data format is that it is easier to use by people who are unfamiliar with the concept of a narrow format tidy data set. Therefore, the data set for requirement \#5 that was submitted for this project is a wide format tidy data set.

<h1 id="runscript"> Running the run_analysis.R Script </h1>
<h2> Background</h2>

The *run_analysis.R* script has been tested on three computers, each with a different operating system. Since some students in the August 2015 Getting and Cleaning Data course reported that their machines ran out of memory when running their version(s) of *run_analysis.R*, at least one set of tests was conducted on a 2009 era laptop, the Sony Vaio VGN-NW240F. The *run_analysis.R* script was tested with a variety of positive and negative test cases against the following acceptance critieria.

* Presence of required data files, and error handling when required data files were not present
* Presence of required R packages, and automatic loading of required packages that were not already present
* Ability to combine the test data with the training data without causing an out of memory error on the computer
* Verification that the output tidy data file contained the expected number of rows and columns
* Verification that the output tidy data file could be read back into R, comparing a subset of columns to ensure the differences were zero
* Verification that the output files generated on OS X, Windows 7, and Windows 10 all produced exactly the same tidydata.txt file, via the UltraCompare utility.

The computers and their configurations are described in the following table.

<table>
    <tr>
        <th>Computer</th>
        <th>Configuration</th>
    </tr>
    <tr>
        <td valign=top>Apple Macbook Pro</td>
        <td>
            <ul>
                <li>Operating system: OS X Yosemite 10.10.4 (14E46)</li>
                <li>Processor: Intel i5 at 2.6Ghz</li>
                <li>Memory: 8 gigabytes</li>
                <li>Disk: 512 gigabytes, solid state drive</li>
            </ul>
        </td>
     </tr>
     <tr>
        <td valign=top>HP Omen laptop</td>
        <td>
            <ul>
                <li>Operating system: Microsoft Windows 10, 64bit</li>
                <li>Processor: Intel i7-4710HQ at 2.5Ghz</li>
                <li>Memory: 16 gigabytes</li>
                <li>Disk: 512 gigabytes, solid state drive</li>
            </ul>
        </td>
    </tr>
    <tr>
       <td valign=top>Sony Vaio VGN-NW240F laptop</td>
       <td>
           <ul>
               <li>Operating system: Microsoft Windows 7, 64bit</li>
               <li>Processor: Intel Core Duo CPU T6600 at 2.2Ghz</li>
               <li>Memory: 4 gigabytes</li>
               <li>Disk: 300 gigabytes, 5,400RPM mechanical disk drive</li>
           </ul>
       </td>
   </tr>
</table>

<h2> Prerequisites </h2>

Given our test results, a computer with at least 2Ghz of processing power, 4Gb of memory, and 10Gb of free disk space should be sufficient to process the script with R.

Two R packages beyond the default installation must be available to execute the script: dplyr and data.table. The *run_analysis.R* script automatically installs the required packages if they are not already present in the environment.

<h2> run_analysis.R Runbook </h2>
A [runbook](https://en.wikipedia.org/wiki/Runbook) is a compilation of steps or processes conducted by a system administrator or operator. For the purposes of working with *run_analysis.R*, the  following steps must be taken to run the script. It is assumed that the person who needs to run the script has not previously worked with the *A Public Domain Dataset for Human Activity Recognition Using Smartphones* data set, and therefore does not already have the required data files stored on the computer where *run_analysis.R* will be executed.

1. Download the data as specified in the [Coursera Project Instructions Page](https://class.coursera.org/getdata-031/human_grading/view/courses/975115/assessments/3/submissions). The data set from the Coursera instructions is a copy of the [UCI HAR Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) but stored on a server controlled by the course instructor.
2. Unzip the file, which will create a directory /UCI HAR Dataset.
3. From the UCI HAR Dataset directory, move activity_labels.txt and features.txt to the *R Working Directory*.
4. From the /UCI HAR Dataset/test directory, move X_test.txt, y_test.txt, and subject_test.txt to the  *R Working Directory*.
5. From the /UCI HAR Dataset/train directory, move X_train.txt, y_train.txt, and subject_train.txt to the  *R Working Directory*.
6. Download [*run_analysis.R*](https://github.com/lgreski/cleaningdata/blob/master/run_analysis.R) and copy it to the *R Working Directory*.
7. Start RStudio, load *run_analysis.R* into the Source pane in the upper left quadrant of the screen, select all code and press the \<Run\> button.
8. \(Optional\) View the *tidydata.txt* file that is written to the *R Working Directory* with a text editor.
