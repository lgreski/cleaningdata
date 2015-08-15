Codebook for Getting and Cleaning Data
======================================

# Overview #
This codebook accompanies the data file [tidydata.txt](https://github.com/lgreski/cleaningdata/blob/master/tidydata.txt) that was created in support of the requirements for the Johns Hopkins University online course *Getting and Cleaning Data,* offered on Coursera in August 2015.

One of the requirements for the course was to create a tidy data file \(for additional background, review the [README.md](https://github.com/lgreski/cleaningdata/blob/master/README.md) file that is also posted in this GitHub repository.

The tidy data file contains 180 observations, combinations of subjects and activities, where the measured data consists of the mean \(average\) across multiple repetitions of an experiment across six types of physical activities.  The codebook describes each variable in the tidy data file.

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
        <td>f</td>
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
        <td>Measurement of the maginitude of the Euclidean norm \(i.e. distance from the origin\) of a three-dimensional signal</td>
    </tr>
    <tr>
        <td>Mean</td>
        <td>Indicates that the measurement is a mean within the original *Human Activity Recognition* data set</td>
    </tr>

    <tr>
        <td>MeanOf</td>
        <td>Indicates that the measurement is a mean in the tidy dataset taken over all experiments for a particular activity for each person of a given variable from the original *Human Activity Recognition* data set</td>
    </tr>
    <tr>
        <td>Stdev</td>
        <td>Indicates that the measurement is a standard deviation within the original *Human Activity Recognition* data set</td>
    </tr>
    <tr>
        <td>t</td>
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

# Variables in the Course Project Tidy Data Set #
The following table describes all of the columns in the [tidydata.txt](https://github.com/lgreski/cleaningdata/blob/master/tidydata.txt) file that was created to fulfill the requirements for the *Getting and Cleaning Data* course on Coursera offered during August 2015.
<table>
    <tr>
        <th>Position</th>
        <th>columns Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td align=right valign=top>1</td>
        <td valign=top>personId</td>
        <td>Numeric identifier that indicates the participant or subject of the experiment. The original research study included 30 participants, so this variable has a range of numeric values  from 1 - 30. No further information beyond an id number was provided by the original research team. <br>Format: numeric </td>
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
        </ul> </td>
    </tr>
    <tr> <td valign=top align=right> 3 </td> <td valign=top> MeanOftBodyAccMeanX </td>  
    <td> Numeric variable measuring the mean of time domain body acceleration means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 4 </td> <td valign=top> MeanOftBodyAccMeanY </td>
    <td> Numeric variable measuring the mean of time domain body acceleration means in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 5 </td> <td valign=top> MeanOftBodyAccMeanZ </td> <td> Numeric variable measuring the mean of time dimension body acceleration means in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 6 </td> <td valign=top> MeanOftGravityAccMeanX </td>
    <td> Numeric variable measuring the mean of time doman gravity acceleration means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 7 </td> <td valign=top> MeanOftGravityAccMeanY </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration means in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 8 </td> <td valign=top> MeanOftGravityAccMeanZ </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 9 </td> <td valign=top> MeanOftBodyAccJerkMeanX </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk means in X dimension  </td> </tr>
    <tr> <td valign=top align=right> 10 </td> <td valign=top> MeanOftBodyAccJerkMeanY </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk means in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 11 </td> <td valign=top> MeanOftBodyAccJerkMeanZ </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk means in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 12 </td> <td valign=top> MeanOftBodyGyroMeanX </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 13 </td> <td valign=top> MeanOftBodyGyroMeanY </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope means in Y dimension  </td> </tr>
    <tr> <td valign=top align=right> 14 </td> <td valign=top> MeanOftBodyGyroMeanZ </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope means in Z dimension  </td> </tr>
    <tr> <td valign=top align=right> 15 </td> <td valign=top> MeanOftBodyGyroJerkMeanX </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 16 </td> <td valign=top> MeanOftBodyGyroJerkMeanY </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk means in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 17 </td> <td valign=top> MeanOftBodyGyroJerkMeanZ </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk means in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 18 </td> <td valign=top> MeanOftBodyAccMagMean </td>
    <td> Numeric variable measuring the mean of time domain body acceleration magnitude means </td> </tr>
    <tr> <td valign=top align=right> 19 </td> <td valign=top> MeanOftGravityAccMagMean </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration magnitude means </td> </tr>
    <tr> <td valign=top align=right> 20 </td> <td valign=top> MeanOftBodyAccJerkMagMean </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk magnitude means </td> </tr>
    <tr> <td valign=top align=right> 21 </td> <td valign=top> MeanOftBodyGyroMagMean </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope magnitude means </td> </tr>
    <tr> <td valign=top align=right> 22 </td> <td valign=top> MeanOftBodyGyroJerkMagMean </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk magnitude means </td> </tr>
    <tr> <td valign=top align=right> 23 </td> <td valign=top> MeanOffBodyAccMeanX </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 24 </td> <td valign=top> MeanOffBodyAccMeanY </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration means in Y dimension  </td> </tr>
    <tr> <td valign=top align=right> 25 </td> <td valign=top> MeanOffBodyAccMeanZ </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration means in Z dimension  </td> </tr>
    <tr> <td valign=top align=right> 26 </td> <td valign=top> MeanOffBodyAccJerkMeanX </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk means in X dimension </td> </tr>
    <tr> <td valign=top align=right> 27 </td> <td valign=top> MeanOffBodyAccJerkMeanY </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk means in Y dimension  </td> </tr>
    <tr> <td valign=top align=right> 28 </td> <td valign=top> MeanOffBodyAccJerkMeanZ </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk means in Z dimension  </td> </tr>
    <tr> <td valign=top align=right> 29 </td> <td valign=top> MeanOffBodyGyroMeanX </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope means in X dimension  </td> </tr>
    <tr> <td valign=top align=right> 30 </td> <td valign=top> MeanOffBodyGyroMeanY </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope means in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 31 </td> <td valign=top> MeanOffBodyGyroMeanZ </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope means in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 32 </td> <td valign=top> MeanOffBodyAccMagMean </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration magnitude means </td> </tr>
    <tr> <td valign=top align=right> 33 </td> <td valign=top> MeanOffBodyAccJerkMagMean </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk magnitude means </td> </tr>
    <tr> <td valign=top align=right> 34 </td> <td valign=top> MeanOffBodyGyroMagMean </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope magnitude means </td> </tr>
    <tr> <td valign=top align=right> 35 </td> <td valign=top> MeanOffBodyGyroJerkMagMean </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope jerk magnitude means </td> </tr>
    <tr> <td valign=top align=right> 36 </td> <td valign=top> MeanOftBodyAccStdevX </td>
    <td> Numeric variable measuring the mean of time domain body acceleration standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 37 </td> <td valign=top> MeanOftBodyAccStdevY </td>
    <td> Numeric variable measuring the mean of time domain body acceleration standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 38 </td> <td valign=top> MeanOftBodyAccStdevZ </td>
    <td> Numeric variable measuring the mean of time domain body acceleration standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 39 </td> <td valign=top> MeanOftGravityAccStdevX </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 40 </td> <td valign=top> MeanOftGravityAccStdevY </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 41 </td> <td valign=top> MeanOftGravityAccStdevZ </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 42 </td> <td valign=top> MeanOftBodyAccJerkStdevX </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk standard deviations in X dimension</td> </tr>
    <tr> <td valign=top align=right> 43 </td> <td valign=top> MeanOftBodyAccJerkStdevY </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 44 </td> <td valign=top> MeanOftBodyAccJerkStdevZ </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 45 </td> <td valign=top> MeanOftBodyGyroStdevX </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 46 </td> <td valign=top> MeanOftBodyGyroStdevY </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 47 </td> <td valign=top> MeanOftBodyGyroStdevZ </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 48 </td> <td valign=top> MeanOftBodyGyroJerkStdevX </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 49 </td> <td valign=top> MeanOftBodyGyroJerkStdevY </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 50 </td> <td valign=top> MeanOftBodyGyroJerkStdevZ </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 51 </td> <td valign=top> MeanOftBodyAccMagStdev </td>
    <td> Numeric variable measuring the mean of time domain body acceleration magnitude standard deviations </td> </tr>
    <tr> <td valign=top align=right> 52 </td> <td valign=top> MeanOftGravityAccMagStdev </td>
    <td> Numeric variable measuring the mean of time domain gravity acceleration magnitude standard deviation </td> </tr>
    <tr> <td valign=top align=right> 53 </td> <td valign=top> MeanOftBodyAccJerkMagStdev </td>
    <td> Numeric variable measuring the mean of time domain body acceleration jerk magnitude standard deviation </td> </tr>
    <tr> <td valign=top align=right> 54 </td> <td valign=top> MeanOftBodyGyroMagStdev </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope magnitude standard deviations </td> </tr>
    <tr> <td valign=top align=right> 55 </td> <td valign=top> MeanOftBodyGyroJerkMagStdev </td>
    <td> Numeric variable measuring the mean of time domain body gyroscope jerk magnitude standard deviations </td> </tr>
    <tr> <td valign=top align=right> 56 </td> <td valign=top> MeanOffBodyAccStdevX </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 57 </td> <td valign=top> MeanOffBodyAccStdevY </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 58 </td> <td valign=top> MeanOffBodyAccStdevZ </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 59 </td> <td valign=top> MeanOffBodyAccJerkStdevX </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 60 </td> <td valign=top> MeanOffBodyAccJerkStdevY </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 61 </td> <td valign=top> MeanOffBodyAccJerkStdevZ </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 62 </td> <td valign=top> MeanOffBodyGyroStdevX </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope standard deviations in X dimension </td> </tr>
    <tr> <td valign=top align=right> 63 </td> <td valign=top> MeanOffBodyGyroStdevY </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope standard deviations in Y dimension </td> </tr>
    <tr> <td valign=top align=right> 64 </td> <td valign=top> MeanOffBodyGyroStdevZ </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope standard deviations in Z dimension </td> </tr>
    <tr> <td valign=top align=right> 65 </td> <td valign=top> MeanOffBodyAccMagStdev </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration magnitude standard deviations </td> </tr>
    <tr> <td valign=top align=right> 66 </td> <td valign=top> MeanOffBodyAccJerkMagStdev </td>
    <td> Numeric variable measuring the mean of frequency domain body acceleration jerk magnitude standard deviations </td> </tr>
    <tr> <td valign=top align=right> 67 </td> <td valign=top> MeanOffBodyGyroMagStdev </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope magnitude standard deviations  </td> </tr>
    <tr> <td valign=top align=right> 68 </td> <td valign=top> MeanOffBodyGyroJerkMagStdev </td>
    <td> Numeric variable measuring the mean of frequency domain body gyroscope jerk magnitude standard deviations  </td> </tr>
</table>
