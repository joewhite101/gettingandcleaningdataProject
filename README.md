# Getting and Cleaning Data Course Project
This repository holds the script for completing the getting and cleaning data project in the Coursera Data Science course.


##Script and Execution
The script delivered with this project is called: run_analysis.R. 
The script assumes that the data is available in your R working directory in a folder called:UCI HAR Dataset

Once the data is in place you can run the script by calling: source(run_analysis.R) in your R environment.

##Analysis Overview
The purpose of the script is:

- Combine the training and test data sets available in the Data section above
- Isolate columns pertaining to mean and standard deviation
- Add labels for the columns isolted in step #2
- Add labels for activities by name
- Generate a tidy data set that calculates the mean for each of the variable columns pertaining to mean and standard deviation broken down by Subject and Activity

##Analysis Details
Here are the steps taken to process the data in the script and how the data is generated. See CodeBook.MD in this repository for a description of each of the variables and data points in files

###Reading the Data
- Initially we read in all of the files needed to analyze the data. The files we read in include:
* X Test Data
* X Training Data
* Y Test Data
* Y Training Data
* Subject Test Data
* Subject Training Data
* Activity Labels
* Feature Labels

### Data Processing Steps
1. Next we combine the X, Y ,and Subject files into single data sets using the rbind() function in R to give us single data frames with both training and test data
2. Now we rename the columns in the X file using the names provided in the features.txt file in the dataset using the colnames() R function
3. Once the names are attached we can isolate the columns we care about for mean and standard deviation. The isolation relies on the naming convention used in the column names. 
All of the columns that pertain to mean have the text "mean" in the column name and all of the columns that pertain to standard deviation have "std" in the column name. With that in mind 
the R grepl function is used to isolate the columns we care about.
4. Once the columns for mean and standard deviation are isolated from the mergedX file we use cbind() to put them into a single data set
5. The next step is adding the activity and subject information to our X data. This is again done by using cbind() with the data from the merged Y and merged subject data created in the first file reading steps
6. Once the columns are added the colnames() function is used to re-label the columns with appropriate names. See the CodeBook for a description of the names used
7. The next step is to transform the activity ids added in the prior step into meaningful activity names.
  * The activity ids are transformed into named values by using the merge function on the combined data set and the activity_labels.txt file we read in the first step
8. Then we rename the columns in the merged file
9. Next the R melt() function is used to create a tall data-set that is broken down with a combined id of SubjectId and ActivityName and all of the remaining columns are treated as variables
10. Finally, the R dcast() function is used to calculate the mean of all of the variables by SubjectId and ActivityName. The output of the dcast function is the tidy data set giving the mean of all of the columns pertaining to mean and standard deviation from the original data.
11. The final data set is written to the current working directory as TidyData.txt

##Original Data
The data processed in this script is available here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A description of the original data set can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#### The data used in this project is from the following publication
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

