# CourseProject3

This repo contains the files for the "Getting and Cleaning Data" course project.

The files in the repo are:
* README.md - explains contents of repo and analysis steps
* CodeBook.md - explains variables and transformations
* run_analysis.R - R script that performs analysis

The steps performed in the run_analysis.R script are:
* Read in the data. As per the assignment instructions, the Samsung data must be in working directory.
* Append the subject and activity labels to the data seperately for the training and test data sets. 
* Combine training and test sets of data.
* Extract only the columns containing mean or standard deviation measurements.
* Replace variable names with descriptive names of features.
* Replace numbers indicating activities with descriptive names of activities.
* Create a second data set with average of each variable for each activity and each subject.
* Create text file containing the new data set with averages of each variable. 
