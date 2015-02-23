# README

## Background

The run_analysis.R script contained in this repo is created as part of the 'Getting and 
Cleaning Data' course on Coursera. It's based on the data provided by a project which 
performed several measurements using a Samsung Galaxy SII smartphone on 30 volunteers 
performing different activities.
For a full-background on the project, you can check they're website at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data required can be downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

__________________________________________________________________________________________

## Execution requirements

Please, make sure to place your working directory into the main directory of the 
downloaded files. To be sure that you're on the right place, a dir/ls command (depending 
on your OS) should list the 'test' and 'train' folders, aswell as the 
'activities_labels.txt' and 'features.txt' files.

__________________________________________________________________________________________

## Considerations

Running the script can take some time, depending on your hardware, principally due to read
operations on the downloaded data. For such tasks, there's a pair of print commands for
each set of files ('test' and 'train') that will indicate in your console/terminal when 
the tasks have begun and when they're completed.

__________________________________________________________________________________________

## Output

The output of the run_analysis.R script is placed in the initial working directory under
the name 'tidyDataMeans.txt', which can be read as a dataframe in R using read.table
with header = TRUE.
The table generated will contain two id variables (labeled 'Activity' and 'Subject') and
several measurement variables, which represent the mean of all instances of each 
measure's mean and standard deviation for each subject doing each activity.

For a complete explanation on each variable, please, check the Codebook.md file placed
in this repository.