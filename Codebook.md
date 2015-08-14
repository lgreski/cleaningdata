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
        <td align=right valign=top>1.</td>
        <td valign=top>personId</td>
        <td>A numeric identifier that indicates the participant or subject of the experiment. The original research study included 30 participants, so this variable has a range of numeric values  from 1 - 30. No further information beyond an id number was provided by the original research team. </td>
    </tr>
    <tr>
        <td align=right valign=top>2.</td>
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
<tr> <td valign=top align=right> 3 </td> <td valign=top> tBodyAccMeanX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 4 </td> <td valign=top> tBodyAccMeanY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 5 </td> <td valign=top> tBodyAccMeanZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 6 </td> <td valign=top> tGravityAccMeanX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 7 </td> <td valign=top> tGravityAccMeanY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 8 </td> <td valign=top> tGravityAccMeanZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 9 </td> <td valign=top> tBodyAccJerkMeanX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 10 </td> <td valign=top> tBodyAccJerkMeanY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 11 </td> <td valign=top> tBodyAccJerkMeanZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 12 </td> <td valign=top> tBodyGyroMeanX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 13 </td> <td valign=top> tBodyGyroMeanY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 14 </td> <td valign=top> tBodyGyroMeanZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 15 </td> <td valign=top> tBodyGyroJerkMeanX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 16 </td> <td valign=top> tBodyGyroJerkMeanY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 17 </td> <td valign=top> tBodyGyroJerkMeanZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 18 </td> <td valign=top> tBodyAccMagMean </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 19 </td> <td valign=top> tGravityAccMagMean </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 20 </td> <td valign=top> tBodyAccJerkMagMean </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 21 </td> <td valign=top> tBodyGyroMagMean </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 22 </td> <td valign=top> tBodyGyroJerkMagMean </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 23 </td> <td valign=top> fBodyAccMeanX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 24 </td> <td valign=top> fBodyAccMeanY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 25 </td> <td valign=top> fBodyAccMeanZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 26 </td> <td valign=top> fBodyAccJerkMeanX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 27 </td> <td valign=top> fBodyAccJerkMeanY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 28 </td> <td valign=top> fBodyAccJerkMeanZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 29 </td> <td valign=top> fBodyGyroMeanX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 30 </td> <td valign=top> fBodyGyroMeanY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 31 </td> <td valign=top> fBodyGyroMeanZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 32 </td> <td valign=top> fBodyAccMagMean </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 33 </td> <td valign=top> fBodyBodyAccJerkMagMean </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 34 </td> <td valign=top> fBodyBodyGyroMagMean </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 35 </td> <td valign=top> fBodyBodyGyroJerkMagMean </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 36 </td> <td valign=top> tBodyAccStdevX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 37 </td> <td valign=top> tBodyAccStdevY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 38 </td> <td valign=top> tBodyAccStdevZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 39 </td> <td valign=top> tGravityAccStdevX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 40 </td> <td valign=top> tGravityAccStdevY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 41 </td> <td valign=top> tGravityAccStdevZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 42 </td> <td valign=top> tBodyAccJerkStdevX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 43 </td> <td valign=top> tBodyAccJerkStdevY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 44 </td> <td valign=top> tBodyAccJerkStdevZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 45 </td> <td valign=top> tBodyGyroStdevX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 46 </td> <td valign=top> tBodyGyroStdevY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 47 </td> <td valign=top> tBodyGyroStdevZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 48 </td> <td valign=top> tBodyGyroJerkStdevX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 49 </td> <td valign=top> tBodyGyroJerkStdevY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 50 </td> <td valign=top> tBodyGyroJerkStdevZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 51 </td> <td valign=top> tBodyAccMagStdev </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 52 </td> <td valign=top> tGravityAccMagStdev </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 53 </td> <td valign=top> tBodyAccJerkMagStdev </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 54 </td> <td valign=top> tBodyGyroMagStdev </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 55 </td> <td valign=top> tBodyGyroJerkMagStdev </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 56 </td> <td valign=top> fBodyAccStdevX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 57 </td> <td valign=top> fBodyAccStdevY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 58 </td> <td valign=top> fBodyAccStdevZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 59 </td> <td valign=top> fBodyAccJerkStdevX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 60 </td> <td valign=top> fBodyAccJerkStdevY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 61 </td> <td valign=top> fBodyAccJerkStdevZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 62 </td> <td valign=top> fBodyGyroStdevX </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 63 </td> <td valign=top> fBodyGyroStdevY </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 64 </td> <td valign=top> fBodyGyroStdevZ </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 65 </td> <td valign=top> fBodyAccMagStdev </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 66 </td> <td valign=top> fBodyBodyAccJerkMagStdev </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 67 </td> <td valign=top> fBodyBodyGyroMagStdev </td> <td> descriptive text here </td> </tr>
<tr> <td valign=top align=right> 68 </td> <td valign=top> fBodyBodyGyroJerkMagStdev </td> <td> descriptive text here </td> </tr>

</table>
