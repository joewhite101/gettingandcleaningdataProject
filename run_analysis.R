activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainX <- read.table("UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("UCI HAR Dataset/train/Y_train.txt")

testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
testX <- read.table("UCI HAR Dataset/test/X_test.txt")
testY <- read.table("UCI HAR Dataset/test/y_test.txt")

mergedSubject <- rbind(trainSubject,testSubject)
mergedX <- rbind(trainX,testX)
mergedY <- rbind(trainY,testY)

colnames(mergedY)[1] = "ActivityId"
#Rename the columns using the features file we read in earlier
colnames(mergedX) <-features[,2]

meanCols <- mergedX[, grepl("mean",names(mergedX))]
stdCols <- mergedX[, grepl("std",names(mergedX))]

filteredX <- cbind(meanCols,stdCols)

formatted <- cbind(mergedY[1], filteredX)
formatted <- cbind(mergedSubject,formatted) 

colnames(formatted)[1] <-'SubjectId'
colnames(formatted)[2] <-'ActivityId'



#Retreive the activity names from the data set
labeledAndFormatted <- merge(activityLabels,formatted,by.x="V1",by.y="ActivityId", all.y=TRUE)
colnames(labeledAndFormatted)[1] <-'ActivityId'
colnames(labeledAndFormatted)[2] <-'ActivityName'


melted <- melt(labeledAndFormatted, id=c('SubjectId','ActivityName'),measure.vars=colnames(formatted)[3:81])
tidyData <- dcast(melted, SubjectId + ActivityName ~ variable,mean)
write.table(tidyData,file = "TidyData.txt",row.names = FALSE)