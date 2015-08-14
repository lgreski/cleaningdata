Codebook for Getting and Cleaning Data
======================================

# Overview #
This codebook accompanies the data file [tidydata.txt](https://github.com/lgreski/cleaningdata/blob/master/tidydata.txt) that was created in support of the requirements for the Johns Hopkins University online course *Getting and Cleaning Data,* offered on Coursera in August 2015.

One of the requirements for the course was to create a tidy data file \(for additional background, review the [README.md](https://github.com/lgreski/cleaningdata/blob/master/README.md) file that is also posted in this GitHub repository.

The tidy data file contains 180 observations, combinations of subjects and activities, where the measured data consists of the mean \(average\) across multiple repetitions of an experiment across six types of physical activities.  The codebook describes each variable in the tidy data file.

<table>
    <tr>
        <th>Position</th>
        <th>columns Name</th>
        <th>Description</th>
    </tr>
    <tr>
        <td align=right valign=top>1</td>
        <td valign=top>personId</td>
        <td>A numeric identifier that indicates the participant or subject of the experiment. The original research study included 30 participants, so this variable has a range of numeric values  from 1 - 30. No further information beyond an id number was provided by the original research team. </td>
    </tr>
    <tr>
        <td align=right valign=top>2</td>
        <td valign=top>activityName</td>
        <td>A character string describing one of six different activities that were performed by participants in the experiment, including:
        <ul>
        <li>Laying</li>
        <li>Sitting</li>
        <li>Standing</li>
        <li>Walking</li>
        <li>Walking downstairs</li>
        <li>Walking upstairs</li>
        </ul> </td>
    </tr>
    <tr> <td valign=top align=right> 3 </td> <td valign=top> MeanOftBodyAccMeanX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 4 </td> <td valign=top> MeanOftBodyAccMeanY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 5 </td> <td valign=top> MeanOftBodyAccMeanZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 6 </td> <td valign=top> MeanOftGravityAccMeanX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 7 </td> <td valign=top> MeanOftGravityAccMeanY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 8 </td> <td valign=top> MeanOftGravityAccMeanZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 9 </td> <td valign=top> MeanOftBodyAccJerkMeanX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 10 </td> <td valign=top> MeanOftBodyAccJerkMeanY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 11 </td> <td valign=top> MeanOftBodyAccJerkMeanZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 12 </td> <td valign=top> MeanOftBodyGyroMeanX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 13 </td> <td valign=top> MeanOftBodyGyroMeanY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 14 </td> <td valign=top> MeanOftBodyGyroMeanZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 15 </td> <td valign=top> MeanOftBodyGyroJerkMeanX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 16 </td> <td valign=top> MeanOftBodyGyroJerkMeanY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 17 </td> <td valign=top> MeanOftBodyGyroJerkMeanZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 18 </td> <td valign=top> MeanOftBodyAccMagMean </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 19 </td> <td valign=top> MeanOftGravityAccMagMean </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 20 </td> <td valign=top> MeanOftBodyAccJerkMagMean </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 21 </td> <td valign=top> MeanOftBodyGyroMagMean </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 22 </td> <td valign=top> MeanOftBodyGyroJerkMagMean </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 23 </td> <td valign=top> MeanOffBodyAccMeanX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 24 </td> <td valign=top> MeanOffBodyAccMeanY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 25 </td> <td valign=top> MeanOffBodyAccMeanZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 26 </td> <td valign=top> MeanOffBodyAccJerkMeanX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 27 </td> <td valign=top> MeanOffBodyAccJerkMeanY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 28 </td> <td valign=top> MeanOffBodyAccJerkMeanZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 29 </td> <td valign=top> MeanOffBodyGyroMeanX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 30 </td> <td valign=top> MeanOffBodyGyroMeanY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 31 </td> <td valign=top> MeanOffBodyGyroMeanZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 32 </td> <td valign=top> MeanOffBodyAccMagMean </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 33 </td> <td valign=top> MeanOffBodyBodyAccJerkMagMean </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 34 </td> <td valign=top> MeanOffBodyBodyGyroMagMean </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 35 </td> <td valign=top> MeanOffBodyBodyGyroJerkMagMean </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 36 </td> <td valign=top> MeanOftBodyAccStdevX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 37 </td> <td valign=top> MeanOftBodyAccStdevY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 38 </td> <td valign=top> MeanOftBodyAccStdevZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 39 </td> <td valign=top> MeanOftGravityAccStdevX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 40 </td> <td valign=top> MeanOftGravityAccStdevY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 41 </td> <td valign=top> MeanOftGravityAccStdevZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 42 </td> <td valign=top> MeanOftBodyAccJerkStdevX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 43 </td> <td valign=top> MeanOftBodyAccJerkStdevY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 44 </td> <td valign=top> MeanOftBodyAccJerkStdevZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 45 </td> <td valign=top> MeanOftBodyGyroStdevX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 46 </td> <td valign=top> MeanOftBodyGyroStdevY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 47 </td> <td valign=top> MeanOftBodyGyroStdevZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 48 </td> <td valign=top> MeanOftBodyGyroJerkStdevX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 49 </td> <td valign=top> MeanOftBodyGyroJerkStdevY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 50 </td> <td valign=top> MeanOftBodyGyroJerkStdevZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 51 </td> <td valign=top> MeanOftBodyAccMagStdev </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 52 </td> <td valign=top> MeanOftGravityAccMagStdev </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 53 </td> <td valign=top> MeanOftBodyAccJerkMagStdev </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 54 </td> <td valign=top> MeanOftBodyGyroMagStdev </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 55 </td> <td valign=top> MeanOftBodyGyroJerkMagStdev </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 56 </td> <td valign=top> MeanOffBodyAccStdevX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 57 </td> <td valign=top> MeanOffBodyAccStdevY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 58 </td> <td valign=top> MeanOffBodyAccStdevZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 59 </td> <td valign=top> MeanOffBodyAccJerkStdevX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 60 </td> <td valign=top> MeanOffBodyAccJerkStdevY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 61 </td> <td valign=top> MeanOffBodyAccJerkStdevZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 62 </td> <td valign=top> MeanOffBodyGyroStdevX </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 63 </td> <td valign=top> MeanOffBodyGyroStdevY </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 64 </td> <td valign=top> MeanOffBodyGyroStdevZ </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 65 </td> <td valign=top> MeanOffBodyAccMagStdev </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 66 </td> <td valign=top> MeanOffBodyBodyAccJerkMagStdev </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 67 </td> <td valign=top> MeanOffBodyBodyGyroMagStdev </td> <td> descriptive text here </td> </tr>
    <tr> <td valign=top align=right> 68 </td> <td valign=top> MeanOffBodyBodyGyroJerkMagStdev </td> <td> descriptive text here </td> </tr>
</table>
