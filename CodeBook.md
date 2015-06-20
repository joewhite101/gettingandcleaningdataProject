#CodeBook for Getting and Cleaning Data Course Project

##Overview
The tidy data produced by run_analysis.R takes the mean of all of the columns that 
pertain to standard deviation or mean from the data set available under the Original Data Section below

The new columns from this data set are:

- SubjectId -- The original SubjectId from the study. The value originates from the subjects_train.txt and subjects_test.txt values in the original data
- ActivityName -- The text name of the activity performed by the subject. This is the text name for the activity_id from the y_train.txt and y_test.txt in the original data

The remaining columns are the calculated mean of the values from the original data set by SubjectId and Activity name. For example, this sample row

|SubjectId	|ActivityName	|Mean of tBodyAcc-mean()-X	|Mean of tBodyAcc-mean()-Y|
|-----------|---------------|---------------------------|-------------------------|
|1     	    |LAYING	        |0.221598244	            |-0.040513953             |



##Original Data
The data processed in this script is available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A description of the original data set can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#### The data used in this project is from the following publication
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
