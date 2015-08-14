Codebook for Getting and Cleaning Data
======================================

#Overview#
This codebook accompanies the data file [tidydata.txt](https://github.com/lgreski/cleaningdata/blob/master/tidydata.txt) that was created in support of the requirements for the Johns Hopkins University online course *Getting and Cleaning Data,* offered on Coursera in August 2015.

One of the requirements for the course was to create a tidy data file \(for additional background, review the [README.md](https://github.com/lgreski/cleaningdata/blob/master/README.md) file that is also posted in this GitHub repository.

The tidy data file contains 180 observations, combinations of subjects and activities, where the measured data consists of the mean \(average\) across multiple repetitions of an expriment across six types of physical activities.  The codebook describes each variable in the tidy data file.

<table>
    <tr>
        <th>Column</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>personId</td>
        <td>A numeric identifier that indicates the participant or subject of the experiment. The original research study included 30 participants, so this variable has a range of numeric values from 1 - 30. </td>
    </tr>
    <tr>
        <td>activityName</td>
        <td>A character string describing one of six different activities that were performed by participants in the experiment, including:
        * Laying
        * Sitting
        * Standing
        * Walking
        * Walking downstairs
        * Walking upstairs </td>
    </tr>

</table>
