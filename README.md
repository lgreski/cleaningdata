Getting and Cleaning Data: README
=================================
* [Overview] (#overview)
    * [Project Summary] (#summary)
    * [Repository Contents] (#contents)
    * [Output File: why is it tidy?] (#tidydesc)
    * [Reading the output file] (#readoutput)
* [Processing Steps] (#processing)
    * [Outline of Steps in run_analysis.R](#stepsoutline)
    * [Commentary: Reading the input files] (#reading)
    * [Commentary: Finding the means and standard deviations] (#finding)
    * [Commentary: Output file format: wide vs. narrow tidy dataset] (#widevsnarrow)

* * *

<h2 id="overview">Overview</h2>

The [lgreski/cleaningdata](http://github.com/lgreski/cleaningdata) GitHub repository includes the files required to fulfill project requirements for the *Getting and Cleaning Data* course offered by Johns Hopkins University's School of Public Health via Coursera during August 2015. The objective of the course project is to convert "messy" data into a *tidy* format, where the definition of *tidy* is based on Hadley Wickham's 2014 paper in the *Journal of Statistical Software,*  [*Tidy Data*](http://http://vita.had.co.nz/papers/tidy-data.pdf). In the paper, Wickham lists three characteristics that make a dataset tidy, including:

  1. Each variable forms a column,
  2. Each observation forms a row, and
  3. Each type of observational unit forms a table.

<h3 id="summary">Project Summary</h3>

The technology research firm Gartner, Inc. has identified four major forces that are converging to radically change the way people live and work. They call this convergence the *Nexus of Forces,* and it includes social computing, cloud-based computing, mobility, and information.

As described in *The Nexus of Forces: Social, Mobile, Cloud, and Information,* Gartner explains how these different forces work together.
>In the Nexus of Forces, information is the *context* for delivering enhanced social and
 mobile experiences. Mobile devices are a *platform* for effective social networking and new ways of work. Social links *people* to their work and each other in new and unexpected ways. Cloud enables the *delivery* of information and functionality to users and systems. The forces of the Nexus are intertwined to create a user-driven ecosystem of modern computing. Reference: Howard, C. et. al., *The Nexus of Forces: Social, Mobile, Cloud, and Information,* Gartner Inc., Stamford CT, June 2012.

Wearable computing is at the center of the nexus of forces. It uses mobile devices as a platform to generate large amounts of data about people's behavior. Scientists are only now beginning to explore ways that mobile computing and big data can help us better understand human behavior. One such study was undertaken by Jorge L. Reyes-Ortiz et. al. from the Technical Research Centre for Dependency Care and Autonomous Living. In April 2013 they released [A Public Domain Dataset for Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The dataset is the result of an experiment to track people's daily activities while a Samsung Galaxy SII smartphone was attached to each participant's waist. The smartphones contained embedded inertial sensors (an accelerometer and gyroscope) that were used to track 561 different measurements. Per the [HCI@SMARTLAB](https://sites.google.com/site/harsmartlab/) website, a group of 30 volunteers were tracked on six basic activities that were measured with 3-dimensional \(X, Y, and Z axes\) for both linear acceleration and angular velocity.

>The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. They performed a protocol of activities composed of six basic activities: three static postures (standing, sitting, lying) and three dynamic activities (walking, walking downstairs and walking upstairs). The experiment also included postural transitions that occurred between the static postures. These are: stand-to-sit, sit-to-stand, sit-to-lie, lie-to-sit, stand-to-lie, and lie-to-stand. All the participants were wearing a smartphone (Samsung Galaxy S II) on the waist during the experiment execution. We captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz using the embedded accelerometer and gyroscope of the device. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The research team also explained how the data from the inertial sensors were processed into a file containing 561 features for each experiment.

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 561 features was obtained by calculating variables from the time and frequency domain.

Reference: HAR@SMARTLAB website, retrieved from https://sites.google.com/site/harsmartlab/ on August 12, 2015.

All thirty participants were tracked on three static postures and three dynamic activities. Each person was recorded multiple different times for each of the six activities, as illustrated below.
<table>
    <tr>
        <th>Activity</th>
        <th>Minimum</th>
        <th>Maximum</th>
    </tr>
    <tr>
        <td>Laying</td>
        <td>48</td>
        <td>90</td>
    </tr>
    <tr>
        <td>Sitting</td>
        <td>44</td>
        <td>85</td>
    </tr>
    <tr>
        <td>Standing</td>
        <td>44</td>
        <td>89</td>
    </tr>
    <tr>
        <td>Walking</td>
        <td>46</td>
        <td>95</td>
    </tr>
    <tr>
        <td>Walking downstairs</td>
        <td>36</td>
        <td>62</td>
    </tr>
    <tr>
        <td>Walking upstairs</td>
        <td>40</td>
        <td>65</td>
    </tr>
</table>
The data was randomly partitioned into two separate sets of data: 70% of the participants were allocated to a training group, and the remaining 30% were allocated to the test group. The training data was used to train a proposed Multiclass Hardware Friendly Support Vector Machine \(MC-HF-SVM\), described in [Anguita, et. al. 2012](http://www.icephd.org/sites/default/files/IWAAL2012.pdf). The test data was then used to evaluate the effectiveness of the MC-HF-SVM in classifying activities based on the measurements taken by the smartphone.  The classification performance from the HF-SVM was compared to a more traditional Multiclass SVM \(MC-SVM\). The proposed MC-HF-SVM performed comparably to the traditional MC-SVM, indicating that the hardware friendly approach could provide a more economical alternative to the traditional MC-SVM, while maintaining the same level of accuracy.

#### The Data Cleaning Task ####

The objective for the *Getting and Cleaning Data* course project is to read the eight files distributed by the research team and combine them into a single dataset that is easy to use for subsequent analysis in the statistics package R.

Specifically, as outlined in the course project instructions, participants must develop an R script called *run_analysis.R* that:
  1. Merges the separate training and test data files to create one data set.
  2. Eliminate all measurements other than means and standard deviations from the measurement data, which includes 561 different measurements taken on the smartphone.
  3. Create descriptive activity names to name each activity in the data set.
  4. Label all variables in the data set with descriptive variable names.
  5. Create an output data file from the result of steps 1 - 4, an independent tidy data set that contains the average of each variable for each activity.

<h4 id="considerations"> Cleaning Considerations </h4>
The key challenge to using the dataset  provided by the *Technical Research Centre* is that there is no single piece of documentation that explains in simple business terms how the different files relate to each other and how to combine them into a single data set for subsequent analysis. The contents of the eight files are summarized below.
<table>
    <tr>
        <th>File</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>activity_labels.txt</td>
        <td>File containing six rows of data, where each row contains an activity identifier and an activity description, a text label to associate with the y_train.txt and y_test.txt files. The numeric identifier and text labels are separated by a blank space. The activity label words are delmited by an underscore when an activity contains more than a single word. </td>
    </tr>
    <tr>
        <td>features.txt</td>
        <td>File listing the 561 different measurements taken from the smartphone each time a person was measured for one of the six activities monitored during the experiment. Data is listed in one row per measurement, where the line number in the file is the assumed key to match against the test and training data files. </td>
    </tr>
    <tr>
        <td>subject_test.txt</td>
        <td>File containing one column of data that identifies the subject \(i.e. person\) corresponding to each row of data in the test measurement x_test.txt file.  </td>
    </tr>
    <tr>
        <td>x_test.txt</td>
        <td> File containing 561 measurements for each observed experiment on one of the six activities.</td>
    </tr>
    <tr>
        <td>y_test.txt</td>
        <td>File containing one column of data that identifies the activity corresponding to each row of data in the test measurement x_test.txt file.</td>
    </tr>
    <tr>
        <td>subject_train.txt</td>
        <td>File containing one column of data that identifies the subject \(i.e. person\) corresponding to each row of data in the test measurement x_train.txt file.  </td>
    </tr>
    <tr>
        <td>x_train.txt</td>
        <td> File containing 561 measurements for each observed experiment on one of the six activities.</td>
    </tr>
    <tr>
        <td>y_train.txt</td>
        <td>File containing one column of data that identifies the activity corresponding to each row of data in the test measurement x_train.txt file.</td>
    </tr>
</table>
Ultimately, to use the test data one must combine three files: x_test, y_test, and subject_test by adding y_test and subject_test as additional columns to the x_test data in order to have a complete observation -- one row of data per person / activity / experiment run. The same set of operations is required for the training data.

Once these data are combined, then the content from the features.txt file must be used to create variable labels for the test and training data.

<h3 id="contents">Repository Contents</h3>

The [lgreski/cleaningdata](http://github.com/lgreski/cleaningdata) repository includes three files that are required to be posted to GitHub for the assignment.  The files in the GitHub repository include:

<table>
    <tr>
        <th>File</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>README.md</td>
        <td>A file in markdown format that displays when someone accesses the GitHub repository for a person's submission for the course project.</td>
    </tr>
    <tr>
        <td>Codebook.md</td>
        <td>A file in markdown format that describes the variables \(columns\) contained in the tidy data set that must be uploaded to the Coursera website as part of the the project submission process.</td>
    </tr>
    <tr>
        <td>run_analysis.R</td>
        <td>An R script that contains all of the R functions used to transform the eight input data files into the required formats for steps 4 and 5 of the assignment instructions.</td>
    </tr>
</table>  

A fourth file, the output from step 5 listed in *The Data Cleaning Task* section above must be uploaded to the Coursera website as part of the assignment submission process.

<table>
    <tr>
        <th>File</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>tidydata.txt</td>
        <td>The output file from step 5 of the course project instructions, a tidy data set that includes descriptive variable names based on the features.txt file provided by the *Technical Research Centre* research team.</td>
    </tr>
</table>

<h3 id="tidydesc">Output File: why is it tidy?</h3>

The output file submitted for review qualifies as a tidy data set because it matches the requirements for tidy data outlined in Hadley Wickham's *Tidy Data* paper, including:
    1. Each variable forms a column,
    2. Each observation forms a row, and
    3. Each type of observational unit forms a table.

In support of requirement 1 for tidy data, each column contains one and only one variable: an average of one of 66 means and standard deviations measured among the 561 measurements taken by the smartphone.

In support of tidy data requirement 2, the output file tidydata.txt, contains 180 rows, one for each combination of person and activity. An "observation" in this file is a person / activity combination. Thirty research participants with averages across six activities results in a 180 row file.

Finally, in support of tidy data requirement 3, there is one table output, and the observational unit: person / activity combinations, requires one and only one table.

<h3 id="readoutput">Reading the Output File</h3>

explain how the output file must be read as a single table, with spaces as delimiters. Provide code required to read the file.

<h2 id="processing">Processing Steps</h2>

discussion about key assumptions - all files in R working directory, and explain how remainging content is broken out into an outline of the steps in the R script, plus additional commentary on key decisions / processing steps required to produce the final output.

<h3 id="stepsoutline">Summary of Processing Steps in run_analysis.R </h3>

1. Confirm all 8 required files are present in the R working directory
2. Read activity data and remove special characters from activity names
3. Read the features file and do the following:
    * Clean the feature identifiers by removing special characters
    * Identify features that are means or standard deviations
4. Read the test files \(X_test.txt, y_test.txt, and subject_test.txt\) and do the following:
    * Add column name, personId, to subject data set
    * Add column name, activityId, to activity data set
    * Assign column names to the measurement data set, using the previously cleaned feature names
    * Remove unnecessary columns from the measurement dataset to fulfill requirement \#2 from the project instructions
    * Bind the personId and activityId columns to the measurement data
5. Read the training files \(X_train.txt, y_train.txt, and subject_test.txt\) and do the following:
    * Add column name, personId, to subject data set
    * Add column name, activityId, to activity data set
    * Assign column names to the measurement data set, using the previously cleaned feature names
    * Remove unnecessary columns from the measurement dataset to fulfill requirement \#2 from the project instructions
    * Bind the personId and activityId columns to the measurement data
6. Combine the test and training files into a single dataset by using the rbind\(\) function
7. Merge the activity labels into the combined measurement dataset. At this point, course project requirements \#1 through \#4 are fulfilled
8. Summarize the measurement columns to create a wide version of a tidy data set
    * Each variable forms a column: means of the 66 variables that were means or standard deviations,
    * One row per subject \(personId\) activity \(activityName\) combination, and
    * Each observational unit \(personId\) \(activityName\) combinations with columns representing means of the 66 variables forms one table
8. Write the output file
9. Verify the accuracy of the output data file. At this point, course project requirement \#5 is fulfilled

<h3 id="reading">Commentary: Reading the Input Files</h3>

<h3 id="finding">Commentary: Deciding which Variables are the Means and Standard Deviations</h3>

<h3 id="widevsnarrow">Commentary: Output File -- Wide vs. Narrow Tidy Format</h3>
