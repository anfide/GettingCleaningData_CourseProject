## "Getting and cleaning data" Course project - december 2014
## Tested with R version 3.1.2 Windows 8.1

# The tasks that this script must fulfill are:
# TASK 1: Merges the training and the test sets to create one data set.
# TASK 2: Extracts only the measurements on the mean and standard deviation for 
# each measurement. 
# TASK 3: Uses descriptive activity names to name the activities in the data set
# TASK 4: Appropriately labels the data set with descriptive variable names. 
# TASK 5: From the data set in step 4, creates a second, independent 
# tidy data set with the average of each variable for each activity and each subject.

# These libraries must be already installed in order to run this script successfully:
library(data.table)
library(stringr)

## download and unzip the input data
zipfileurl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfilelocalname="data.zip"

if (!file.exists(zipfilelocalname)) {
    download.file(url=zipfileurl, 
                  destfile=zipfilelocalname, 
                  mode="wb")
    unzip(zipfile = zipfilelocalname)
}

# The "UCI HAR Dataset/features.txt" file lists the 561 columns in
# the training and test set. Among these we are interested only in the means
# and standard deviations. It's convenient to load the features.txt in a data.table
# that will be used to filter the data of interest.
features <- data.table(read.table(
                        file="UCI HAR Dataset/features.txt",
                        sep=" ",
                        header=F,
                        colClasses=c("integer", "character"),
                        col.names=c("ID", "OriginalName")
                        )
                      )
# add a column with the type of feature.
# The regular expression deletes the unwanted header and trailer. Examples:
# - if OriginalName="tBodyAcc-mean()-Z" then Type="mean"
# - if OriginalName="angle(tBodyGyroMean,gravityMean)" then Type="angle"
features$Type <- factor(x=gsub(x=features$OriginalName, 
                                      pattern="(^[^-]*-)|([(]+.*)", replacement="")
                               )# add another column with the name of the feature that will be used in the 

# Keep only the features of the types mean and standard deviation.
# Let's Keep the meanFreq type too, as it appears to contain a mean.
wanted_features <- features[Type %in% c("mean", "std", "meanFreq"), ]

# Load activity labels needed for TASK #3 (Use descriptive activity names to 
# name the activities in the data set)
activity_labels <- data.table(read.table(
                    file="UCI HAR Dataset/activity_labels.txt",
                    sep=" ",
                    header=F,
                    colClasses=c("integer", "character"),
                    col.names=c("ID", "Label")    
                    ))

# header of the data set.
# e.g. if feature ID = 1 and OriginalName="tBodyAcc-mean()-X" then 
#  Name="F001
wanted_features$Name <- paste("F", 
                       str_pad(string=wanted_features$ID, width=3, pad="0"),
                       '.',
                       make.names(str_replace(wanted_features$OriginalName, "\\(\\)", "")),
                       sep="")

# TASK #1: Merge the training and the test sets to create one data set.
# The resulting data set will be stored in the "X" variable
X <- data.table()

for (pattern in c("train", "test")) {

    # load experiment data
    filename <- paste("UCI HAR Dataset/", pattern, "/X_", pattern, ".txt", sep="")
    print(paste("Loading file ", filename))
    X_temp <- data.table(
                read.table(filename, 
                    header=F, 
                    colClasses="numeric"  # all columns set to numeric for faster read
                    ))
    
    # TASK 2: Extracts only the measurements on the mean and standard deviation for 
    # each measurement. 
    # These are filtered using the feature IDs in the wanted_features table.
    X_temp <- X_temp[, wanted_features$ID, with=FALSE]
    # TASK 4: Appropriately labels the data set with descriptive variable names.
    setnames(X_temp, wanted_features$Name)

    # load activities related to each experiment
    filename <- paste("UCI HAR Dataset/", pattern, "/y_", pattern, ".txt", sep="")
    print(paste("Loading file ", filename))
    activities_temp <- data.table(read.table(filename, 
                                    header=F, 
                                    colClasses="integer",
                                    col.names=c("ActivityID")
                                ))
    # TASK 3: Uses descriptive activity names to name the activities in the data set
    # To accomplish this, let's transform activities_train from integers to 
    #  factors and add them to X_temp. The mapping between activity IDs and
    # activity names is specified in the activity_labels.txt file, it's repeated
    # here for convenience:
    # 1 => WALKING
    # 2 => WALKING_UPSTAIRS
    # 3 => WALKING_DOWNSTAIRS
    # 4 => SITTING
    # 5 => STANDING
    # 6 => LAYING
    activities_temp$Activity <- factor(
                                x=activities_temp$ActivityID, 
                                levels= activity_labels$ID,
                                labels= activity_labels$Label
                                )
    
    # read Subject IDs for each experiment and add them to the data set
    filename <- paste("UCI HAR Dataset/", pattern, "/subject_", pattern, ".txt", sep="")
    print(paste("Loading file ", filename))
    subjects_temp <- data.table(read.table(filename, 
                   header=F, 
                   colClasses="integer",
                   col.names=c("SubjectID")
                ))
    #X_temp$SubjectID <- subsjects_temp

    # concatenate the columns with subjects, activities, means + std.devs to
    # obtain one data set
    X_temp <- cbind(subjects_temp, activities_temp[,.(Activity)], X_temp)
    # add the rows of X_temp to the data set "X" that aggregates train and test data
    X <- rbindlist(list(X, X_temp))
    
    # NOT REQUIRED: add a factor column so that each row can be traced back to the original dataset (train o test)
    #X_temp$SubDataSet <- factor(x=pattern)    
    
    #rm(X_temp)
    #rm(subjects_temp)
    #rm(activities_temp)
}
