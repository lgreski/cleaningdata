Codebook for Getting and Cleaning Data
======================================

# Overview #
This codebook accompanies the data file [tidydata.txt](https://github.com/lgreski/cleaningdata/blob/master/tidydata.txt) that was created in support of the requirements for the Johns Hopkins University online course *Getting and Cleaning Data,* offered on Coursera in August 2015.

One of the requirements for the course was to create a tidy data file \(for additional background, review the [README.md](https://github.com/lgreski/cleaningdata/blob/master/README.md) file that is also posted in this GitHub repository.

The tidy data file contains 180 observations, combinations of 30 research subjects and 6 activities, where the measured data consists of the mean across multiple repetitions of an experiment within each category of physical activity.  An observation \(or row\) in the tidy data set is a unique combination of personId and activityName, plus the means for 66 variables representing each of the variables from the original *Human Activity Recognition* data set that were means or standard deviations of the 33 base variables analyzed by the HAR research team, per the following illustration.

### Observations in Tidy Data Set ###
<table>
<tr>
<th>personId</th><th>activityName</th><th>meanOfTimeBodyAccMeanX</th><th>. . . </th><th> meanOfFreqBodyGyroJerkMagStdev</th>
</tr>
    <tr>
    <td align=center>7</td><td align=center>walking</td><td align=right> 0.275592961754386</td><td>. . . </td><td align=right> -0.0841663774087719</td>
    </tr>
    <tr> <td align=center>.<br> .<br> .</td><td align=center>.<br> .<br> .</td><td align=center>.<br> .<br> .</td><td>.<br> .<br> . </td><td align=center>.<br> .<br> .</td>
    </tr>
</table>

Although statisticians could assert that it would be more appropriate to summarize the standard deviations into standard errors \(see https://class.coursera.org/getdata-031/forum/thread?thread_id=28#post-1251 \[and following\] for details\), for the purposes of the data cleaning activity, the standard deviations have been summarized with the mean\(\) function.
This codebook describes each variable \(column\) in the tidy data file.

In all of the measurement variables, the text tokens have the following meanings.
<table>
    <tr>
        <th>Token</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>Body</td>
        <td>Signal based on the body of an experiment participant</td>
    </tr>
    <tr>
        <td>Freq</td>
        <td>Measurement based on the "frequency" domain, taken as a Fast Fourier Transform of the time-based signals </td>
    </tr>
    <tr>
        <td>Gravity</td>
        <td>Signal based on gravity, the force that attracts a body towards the center of the earth</td>
    </tr>
    <tr>
        <td>Gyro</td>
        <td>Measurement taken from gyroscope</td>
    </tr>
    <tr>
        <td>Jerk </td>
        <td>Measurement of sudden movement, based on body acceleration and angular velocity</td>
    </tr>
    <tr>
        <td>Mag</td>
        <td>Measurement of the magnitude of the Euclidean norm (i.e. length of a vector from the origin) of a three-dimensional signal</td>
    </tr>
    <tr>
        <td>Mean</td>
        <td>Indicates that the measurement is a mean within the original <i>Human Activity Recognition</i> data set</td>
    </tr>

    <tr>
        <td>meanOf</td>
        <td>Indicates that the measurement is a mean in the tidy dataset taken over all experiments for a particular activity for each person of a given variable from the original <i>Human Activity Recognition</i> data set</td>
    </tr>
    <tr>
        <td>Stdev</td>
        <td>Indicates that the measurement is a standard deviation within the original <i>Human Activity Recognition</i> data set</td>
    </tr>
    <tr>
        <td>Time</td>
        <td>Measurement based on the "time" domain</td>
    </tr>
    <tr>
        <td>X</td>
        <td>Measurement taken in "X" dimension, as in a three-dimensional Cartesian coordinate system of X, Y and Z</td>
    </tr>
    <tr>
        <td>Y</td>
        <td>Measurement taken in "Y" dimension, as in a three-dimensional Cartesian coordinate system of X, Y and Z</td>
    </tr>
    <tr>
        <td>Z</td>
        <td>Measurement taken in "Z" dimension, as in a three-dimensional Cartesian coordinate system of X, Y and Z</td>
    </tr>
</table>

<b>Reference:</b> features_info.txt and features.txt files from [A Public Domain Dataset for Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Per the *Human Activity Recognition* research team, the original data was organized according to the following process.
> The features selected for this database come from the accelerometer and gyroscope
3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't'
to denote time) were captured at a constant rate of 50 Hz. Then they were filtered
using a median filter and a 3rd order low pass Butterworth filter with a corner
frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then
separated into body and gravity acceleration signals (tBodyAcc-XYZ and
tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

>Subsequently, the body linear acceleration and angular velocity were derived
in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also
the magnitude of these three-dimensional signals were calculated using the
Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

<b>Reference:</b> features_info.txt file from [A Public Domain Dataset for Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

# Variables in the Course Project Tidy Data Set #
The following table describes all of the columns in the [tidydata.txt](https://github.com/lgreski/cleaningdata/blob/master/tidydata.txt) file that was created to fulfill the requirements for the *Getting and Cleaning Data* course on Coursera offered during August 2015. Variable names in the data set are written using [camelCase notation](https://en.wikipedia.org/wiki/CamelCase) to facilitate ease of reading within R code.
<table>
    <tr>
        <th>Position</th>
        <th>columns Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td align=right valign=top>1</td>
        <td valign=top>personId</td>
        <td>Numeric identifier (a unique sequential number) that indicates the participant or subject of the experiment. The original research study included 30 participants, so this variable has a range of numeric values  from 1 - 30. No further information beyond an id number was provided by the original research team.</td>
    </tr>
    <tr>
        <td align=right valign=top>2</td>
        <td valign=top>activityName</td>
        <td>Character string describing one of six different activities that were performed by participants in the experiment, including:
        <ul>
        <li>Laying</li>
        <li>Sitting</li>
        <li>Standing</li>
        <li>Walking</li>
        <li>Walking downstairs</li>
        <li>Walking upstairs</li>
        </ul>
        </td>
    </tr>
    <tr> <td valign=top align=right> 3 </td> <td valign=top> meanOfTimeBodyAccMeanX </td>  
    <td> Numeric variable measuring the mean of time domain body acceleration means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 4 </td> <td valign=top> meanOfTimeBodyAccMeanY </td>
    <td> Numeric variable measuring the mean of time domain body acceleration means in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 5 </td> <td valign=top> meanOfTimeBodyAccMeanZ </td> <td> Numeric variable measuring the mean of time dimension body acceleration means in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 6 </td> <td valign=top> meanOfTimeGravityAccMeanX </td>
    <td> Numeric variable measuring the mean of time doman gravity acceleration means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 7 </td> <td valign=top> meanOfTimeGravityAccMeanY </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration means in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 8 </td> <td valign=top> meanOfTimeGravityAccMeanZ </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 9 </td> <td valign=top> meanOfTimeBodyAccJerkMeanX </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk means in X dimension  </td> </tr>
    <tr> <td valign=top align=right> 10 </td> <td valign=top> meanOfTimeBodyAccJerkMeanY </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk means in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 11 </td> <td valign=top> meanOfTimeBodyAccJerkMeanZ </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk means in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 12 </td> <td valign=top> meanOfTimeBodyGyroMeanX </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 13 </td> <td valign=top> meanOfTimeBodyGyroMeanY </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope means in Y dimension  </td> </tr>
    <tr> <td valign=top align=right> 14 </td> <td valign=top> meanOfTimeBodyGyroMeanZ </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope means in Z dimension  </td> </tr>
    <tr> <td valign=top align=right> 15 </td> <td valign=top> meanOfTimeBodyGyroJerkMeanX </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 16 </td> <td valign=top> meanOfTimeBodyGyroJerkMeanY </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk means in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 17 </td> <td valign=top> meanOfTimeBodyGyroJerkMeanZ </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk means in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 18 </td> <td valign=top> meanOfTimeBodyAccMagMean </td>
    <td> Numeric variable measuring the mean of time domain body acceleration magnitude means </td> </tr>
    <tr> <td valign=top align=right> 19 </td> <td valign=top> meanOfTimeGravityAccMagMean </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration magnitude means </td> </tr>
    <tr> <td valign=top align=right> 20 </td> <td valign=top> meanOfTimeBodyAccJerkMagMean </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk magnitude means </td> </tr>
    <tr> <td valign=top align=right> 21 </td> <td valign=top> meanOfTimeBodyGyroMagMean </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope magnitude means </td> </tr>
    <tr> <td valign=top align=right> 22 </td> <td valign=top> meanOfTimeBodyGyroJerkMagMean </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk magnitude means </td> </tr>
    <tr> <td valign=top align=right> 23 </td> <td valign=top> meanOfFreqBodyAccMeanX </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 24 </td> <td valign=top> meanOfFreqBodyAccMeanY </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration means in Y dimension  </td> </tr>
    <tr> <td valign=top align=right> 25 </td> <td valign=top> meanOfFreqBodyAccMeanZ </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration means in Z dimension  </td> </tr>
    <tr> <td valign=top align=right> 26 </td> <td valign=top> meanOfFreqBodyAccJerkMeanX </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 27 </td> <td valign=top> meanOfFreqBodyAccJerkMeanY </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk means in Y dimension  </td> </tr>
    <tr> <td valign=top align=right> 28 </td> <td valign=top> meanOfFreqBodyAccJerkMeanZ </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk means in Z dimension  </td> </tr>
    <tr> <td valign=top align=right> 29 </td> <td valign=top> meanOfFreqBodyGyroMeanX </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope means in X dimension  </td> </tr>
    <tr> <td valign=top align=right> 30 </td> <td valign=top> meanOfFreqBodyGyroMeanY </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope means in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 31 </td> <td valign=top> meanOfFreqBodyGyroMeanZ </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope means in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 32 </td> <td valign=top> meanOfFreqBodyAccMagMean </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration magnitude means </td> </tr>
    <tr> <td valign=top align=right> 33 </td> <td valign=top> meanOfFreqBodyAccJerkMagMean </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk magnitude means </td> </tr>
    <tr> <td valign=top align=right> 34 </td> <td valign=top> meanOfFreqBodyGyroMagMean </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope magnitude means </td> </tr>
    <tr> <td valign=top align=right> 35 </td> <td valign=top> meanOfFreqBodyGyroJerkMagMean </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope jerk magnitude means </td> </tr>
    <tr> <td valign=top align=right> 36 </td> <td valign=top> meanOfTimeBodyAccStdevX </td>
    <td> Numeric variable measuring the mean of time domain body acceleration standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 37 </td> <td valign=top> meanOfTimeBodyAccStdevY </td>
    <td> Numeric variable measuring the mean of time domain body acceleration standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 38 </td> <td valign=top> meanOfTimeBodyAccStdevZ </td>
    <td> Numeric variable measuring the mean of time domain body acceleration standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 39 </td> <td valign=top> meanOfTimeGravityAccStdevX </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 40 </td> <td valign=top> meanOfTimeGravityAccStdevY </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 41 </td> <td valign=top> meanOfTimeGravityAccStdevZ </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 42 </td> <td valign=top> meanOfTimeBodyAccJerkStdevX </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk standard deviations in X dimension</td> </tr>
    <tr> <td valign=top align=right> 43 </td> <td valign=top> meanOfTimeBodyAccJerkStdevY </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 44 </td> <td valign=top> meanOfTimeBodyAccJerkStdevZ </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 45 </td> <td valign=top> meanOfTimeBodyGyroStdevX </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 46 </td> <td valign=top> meanOfTimeBodyGyroStdevY </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 47 </td> <td valign=top> meanOfTimeBodyGyroStdevZ </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 48 </td> <td valign=top> meanOfTimeBodyGyroJerkStdevX </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 49 </td> <td valign=top> meanOfTimeBodyGyroJerkStdevY </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 50 </td> <td valign=top> meanOfTimeBodyGyroJerkStdevZ </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 51 </td> <td valign=top> meanOfTimeBodyAccMagStdev </td>
    <td> Numeric variable measuring the mean of time domain body acceleration magnitude standard deviations </td> </tr>
    <tr> <td valign=top align=right> 52 </td> <td valign=top> meanOfTimeGravityAccMagStdev </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration magnitude standard deviation </td> </tr>
    <tr> <td valign=top align=right> 53 </td> <td valign=top> meanOfTimeBodyAccJerkMagStdev </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk magnitude standard deviation </td> </tr>
    <tr> <td valign=top align=right> 54 </td> <td valign=top> meanOfTimeBodyGyroMagStdev </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope magnitude standard deviations </td> </tr>
    <tr> <td valign=top align=right> 55 </td> <td valign=top> meanOfTimeBodyGyroJerkMagStdev </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk magnitude standard deviations </td> </tr>
    <tr> <td valign=top align=right> 56 </td> <td valign=top> meanOfFreqBodyAccStdevX </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 57 </td> <td valign=top> meanOfFreqBodyAccStdevY </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 58 </td> <td valign=top> meanOfFreqBodyAccStdevZ </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 59 </td> <td valign=top> meanOfFreqBodyAccJerkStdevX </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 60 </td> <td valign=top> meanOfFreqBodyAccJerkStdevY </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 61 </td> <td valign=top> meanOfFreqBodyAccJerkStdevZ </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 62 </td> <td valign=top> meanOfFreqBodyGyroStdevX </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 63 </td> <td valign=top> meanOfFreqBodyGyroStdevY </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 64 </td> <td valign=top> meanOfFreqBodyGyroStdevZ </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 65 </td> <td valign=top> meanOfFreqBodyAccMagStdev </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration magnitude standard deviations </td> </tr>
    <tr> <td valign=top align=right> 66 </td> <td valign=top> meanOfFreqBodyAccJerkMagStdev </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk magnitude standard deviations </td> </tr>
    <tr> <td valign=top align=right> 67 </td> <td valign=top> meanOfFreqBodyGyroMagStdev </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope magnitude standard deviations  </td> </tr>
    <tr> <td valign=top align=right> 68 </td> <td valign=top> meanOfFreqBodyGyroJerkMagStdev </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope jerk magnitude standard deviations  </td> </tr>
</table>
