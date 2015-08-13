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

As described in a 2012 research article,
>In the Nexus of Forces, information is the *context* for delivering enhanced social and
 mobile experiences. Mobile devices are a *platform* for effective social networking and new ways of work. Social links *people* to their work and each other in new and unexpected ways. Cloud enables the *delivery* of information and functionality to users and systems. The forces of the Nexus are intertwined to create a user-driven ecosystem of modern computing.
(Reference: Howard, C. et. al., *The Nexus of Forces: Social, Mobile, Cloud, and Information,* Gartner Inc., Stamford CT, June 2012)

Wearable computing is at the center of the nexus of forces. It uses mobile devices as a platform to generate large amounts of data about people's behavior. One such study was undertaken by Jorge L. Reyes-Ortiz et. al. from the Technical Research Centre for Dependency Care and Autonomous Living. In April 2013 they released [A Public Domain Dataset for Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The dataset is the result of an experiment in tracking humans' activities while a Samsung Galaxy SII smartphone was attached to each participant's waist.

#### The Data Cleaning Task ####

The objective for the course project is to read the \<x\> files distributed by the research team and combine them into a single dataset that is easy to use for subsequent analysis in the statistics package R.
Specifically, course participants must devleop an R script called *run_analysis.R* that:
  1. Merges the separate training and test data files to create one data set.
  2. Eliminate all measurements other than means and standard deviations from the measurement data, which includes 561 different measurements taken on the smartphone.
  3. Create descriptive activity names to name each activity in the data set.
  4. Label all variables in the data set with descriptive varaible names.
  5. Create an output data file from the result of steps 1 - 4, an independent tidy data set that contains the average of each variable for each activity.
<h4 id="considerations"> Cleaning Considerations </h4>


<h3 id="contents">Repository Contents</h3>

<h3 id="tidydesc">Output File: why is it tidy?</h3>

<h3 id="readoutput">Reading the Output File</h3>

<h2 id="processing">Processing Steps</h2>

<h3 id="reading">Reading the Input Files</h3>

<h3 id="finding">Finding the Means and Standard Deviations</h3>
