
#Read in the label data for features and activities
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

# Read in X, Y and, Subject data for both test and training data
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainX <- read.table("UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("UCI HAR Dataset/train/Y_train.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
testX <- read.table("UCI HAR Dataset/test/X_test.txt")
testY <- read.table("UCI HAR Dataset/test/y_test.txt")

# Merge the X, Y and Subject data for training and subject into single files
mergedSubject <- rbind(trainSubject,testSubject)
mergedX <- rbind(trainX,testX)
mergedY <- rbind(trainY,testY)

#Rename the columns using the features file we read in earlier
colnames(mergedX) <- features[,2]
colnames(mergedY)[1] = "ActivityId"

# Find columns pertaining to mean and std
meanCols <- mergedX[, grepl("mean",names(mergedX))]
stdCols <- mergedX[, grepl("std",names(mergedX))]

#Combine the columns pertaining to mean and standard deviation intoa single file
filteredX <- cbind(meanCols,stdCols)

colnames(filteredX) <- paste("Mean of",colnames(filteredX))

# Add columns for subject and activity ID
formatted <- cbind(mergedY[1], filteredX)
formatted <- cbind(mergedSubject,formatted) 

#Rename the activity and subject id columns
colnames(formatted)[1] <-'SubjectId'
colnames(formatted)[2] <-'ActivityId'

#Merge the activity labels into the X data and rename
labeledAndFormatted <- merge(activityLabels,formatted,by.x="V1",by.y="ActivityId", all.y=TRUE)
colnames(labeledAndFormatted)[1] <-'ActivityId'
colnames(labeledAndFormatted)[2] <-'ActivityName'

#Create a tall data-set that is broken down with a combined id of SubjectId and ActivityName and all of the remaining columns are treated as variables
melted <- melt(labeledAndFormatted, id=c('SubjectId','ActivityName'),measure.vars=colnames(formatted)[3:81])

#Dcast the data based on SubjectId and ActivityName and calculate the mean for all of the variable columns
tidyData <- dcast(melted, SubjectId + ActivityName ~ variable,mean)
write.table(tidyData,file = "TidyData.txt",row.names = FALSE)