Getting and Cleaning Data: README
=================================
* [Overview] (#overview)
    * [Project Summary] (#summary)
    * [Repository Contents] (#contents)
    * [Output File: why is it tidy?] (#tidydesc)
    * [Reading the output file] (#readoutput)
* [Processing Steps] (#processing)
    * [Reading the input files] (#reading)
    * [Finding the means and standard deviations] (#finding)

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

#### The Data Cleaning Task ####

The objective for the *Getting and Cleaning Data* course project is to read the eight files distributed by the research team and combine them into a single dataset that is easy to use for subsequent analysis in the statistics package R.

Specifically, as outlined in the course project instructions, participants must develop an R script called *run_analysis.R* that:
  1. Merges the separate training and test data files to create one data set.
  2. Eliminate all measurements other than means and standard deviations from the measurement data, which includes 561 different measurements taken on the smartphone.
  3. Create descriptive activity names to name each activity in the data set.
  4. Label all variables in the data set with descriptive variable names.
  5. Create an output data file from the result of steps 1 - 4, an independent tidy data set that contains the average of each variable for each activity.

<h4 id="considerations"> Cleaning Considerations </h4>
There are \<x\> factors that make the project a challenging assignment. First, there is no single piece of documentation that explains how the different files provided by the *Technical Research Centre* relate to each other. Second, the approach taken to organize the data
<h3 id="contents">Repository Contents</h3>

<h3 id="tidydesc">Output File: why is it tidy?</h3>

<h3 id="readoutput">Reading the Output File</h3>

<h2 id="processing">Processing Steps</h2>

<h3 id="reading">Reading the Input Files</h3>

<h3 id="finding">Finding the Means and Standard Deviations</h3>
