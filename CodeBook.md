#CodeBook for Getting and Cleaning Data Course Project

##Overview
The tidy data produced by run_analysis.R takes the mean of all of the columns that 
pertain to standard deviation or mean from the data set available under the Original Data section below

The process for analysing this data combines all of the data in the training and test data sets to provide a unified view of
the data. The processing also merges the Subject and Activity data into a single file.  The files processed from the original data set 
to generate the final data set are:

- activity_labels.txt
- features.txt
- subject_train.txt
- X_train.txt
- y_train.txt
- subject_test.txt
- X_test.txt
- y_test.txt

##Column Definitions
The new columns from this data set are:

- SubjectId 
  - The original SubjectId from the study. The value originates from the subjects_train.txt and subjects_test.txt values in the original data
- ActivityName
  - The text name of the activity performed by the subject. This is the text name for the activity_id from the y_train.txt and y_test.txt in the original data

The remaining columns are the calculated mean of the values from the original data set that pertain to mean or standard deviation. 
Those columns were identified by containing the text "mean" or the text "std" in the original data set. Each column name from the original data set
has the text "Mean of" appended to the front since we have taken the mean of all of those values. 
Each row is the mean of the value of the original column summarized by SubjectId and ActivityName. 

For example, this sample row:

|SubjectId	|ActivityName	|Mean of tBodyAcc-mean()-X	|Mean of tBodyAcc-mean()-Y|
|-----------|---------------|---------------------------|-------------------------|
|1     	    |LAYING	        |0.221598244	            |-0.040513953             |

Contains the Mean of the tBodyAcc-mean()-X and tBodyAcc-mean()-Y columns from the original data for SubjectId of 1 and ActivityName of LAYING

A complete list of all columns included in the final tidy data set is listed below.

##Original Data
The data processed in this script is available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A description of the original data set can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#### The data used in this project is from the following publication
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

##Final list Of Processed Columns
-	SubjectId
-	ActivityName
-	Mean of tBodyAcc-mean()-X
-	Mean of tBodyAcc-mean()-Y
-	Mean of tBodyAcc-mean()-Z
-	Mean of tGravityAcc-mean()-X
-	Mean of tGravityAcc-mean()-Y
-	Mean of tGravityAcc-mean()-Z
-	Mean of tBodyAccJerk-mean()-X
-	Mean of tBodyAccJerk-mean()-Y
-	Mean of tBodyAccJerk-mean()-Z
-	Mean of tBodyGyro-mean()-X
-	Mean of tBodyGyro-mean()-Y
-	Mean of tBodyGyro-mean()-Z
-	Mean of tBodyGyroJerk-mean()-X
-	Mean of tBodyGyroJerk-mean()-Y
-	Mean of tBodyGyroJerk-mean()-Z
-	Mean of tBodyAccMag-mean()
-	Mean of tGravityAccMag-mean()
-	Mean of tBodyAccJerkMag-mean()
-	Mean of tBodyGyroMag-mean()
-	Mean of tBodyGyroJerkMag-mean()
-	Mean of fBodyAcc-mean()-X
-	Mean of fBodyAcc-mean()-Y
-	Mean of fBodyAcc-mean()-Z
-	Mean of fBodyAcc-meanFreq()-X
-	Mean of fBodyAcc-meanFreq()-Y
-	Mean of fBodyAcc-meanFreq()-Z
-	Mean of fBodyAccJerk-mean()-X
-	Mean of fBodyAccJerk-mean()-Y
-	Mean of fBodyAccJerk-mean()-Z
-	Mean of fBodyAccJerk-meanFreq()-X
-	Mean of fBodyAccJerk-meanFreq()-Y
-	Mean of fBodyAccJerk-meanFreq()-Z
-	Mean of fBodyGyro-mean()-X
-	Mean of fBodyGyro-mean()-Y
-	Mean of fBodyGyro-mean()-Z
-	Mean of fBodyGyro-meanFreq()-X
-	Mean of fBodyGyro-meanFreq()-Y
-	Mean of fBodyGyro-meanFreq()-Z
-	Mean of fBodyAccMag-mean()
-	Mean of fBodyAccMag-meanFreq()
-	Mean of fBodyBodyAccJerkMag-mean()
-	Mean of fBodyBodyAccJerkMag-meanFreq()
-	Mean of fBodyBodyGyroMag-mean()
-	Mean of fBodyBodyGyroMag-meanFreq()
-	Mean of fBodyBodyGyroJerkMag-mean()
-	Mean of fBodyBodyGyroJerkMag-meanFreq()
-	Mean of tBodyAcc-std()-X
-	Mean of tBodyAcc-std()-Y
-	Mean of tBodyAcc-std()-Z
-	Mean of tGravityAcc-std()-X
-	Mean of tGravityAcc-std()-Y
-	Mean of tGravityAcc-std()-Z
-	Mean of tBodyAccJerk-std()-X
-	Mean of tBodyAccJerk-std()-Y
-	Mean of tBodyAccJerk-std()-Z
-	Mean of tBodyGyro-std()-X
-	Mean of tBodyGyro-std()-Y
-	Mean of tBodyGyro-std()-Z
-	Mean of tBodyGyroJerk-std()-X
-	Mean of tBodyGyroJerk-std()-Y
-	Mean of tBodyGyroJerk-std()-Z
-	Mean of tBodyAccMag-std()
-	Mean of tGravityAccMag-std()
-	Mean of tBodyAccJerkMag-std()
-	Mean of tBodyGyroMag-std()
-	Mean of tBodyGyroJerkMag-std()
-	Mean of fBodyAcc-std()-X
-	Mean of fBodyAcc-std()-Y
-	Mean of fBodyAcc-std()-Z
-	Mean of fBodyAccJerk-std()-X
-	Mean of fBodyAccJerk-std()-Y
-	Mean of fBodyAccJerk-std()-Z
-	Mean of fBodyGyro-std()-X
-	Mean of fBodyGyro-std()-Y
-	Mean of fBodyGyro-std()-Z
-	Mean of fBodyAccMag-std()
-	Mean of fBodyBodyAccJerkMag-std()
-	Mean of fBodyBodyGyroMag-std()
-	Mean of fBodyBodyGyroJerkMag-std()