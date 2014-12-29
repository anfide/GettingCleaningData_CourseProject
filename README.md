# "Getting and Cleaning Data" Course Project


This repository contains the project for the Coursera "Getting and Cleaning Data" course (December 2014 iteration).

The projects requires to provide these files:
* analysis_run.R, R script file that performs the data manipulation
* README.md (this file) that explains how the script works
* CodeBook.md that describes the output variables

In addition I included the tidydata_with_means.txt file with the resulting clean data set.

The clean data set is obtained by processing the data files of the original project http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## Background information about the starting data files

Quoted verbatim from the original project documentation:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
> 
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
> 
> ### For each record it is provided:
> 
> - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
> - Triaxial Angular velocity from the gyroscope. 
> - A 561-feature vector with time and frequency domain variables. 
> - Its activity label. 
> - An identifier of the subject who carried out the experiment.
> 
> ### The dataset includes the following files:
> 
> - 'README.txt'
> 
> - 'features_info.txt': Shows information about the variables used on the feature vector.
> 
> - 'features.txt': List of all features.
> 
> - 'activity_labels.txt': Links the class labels with their activity name.
> 
> - 'train/X_train.txt': Training set.
> 
> - 'train/y_train.txt': Training labels.
> 
> - 'test/X_test.txt': Test set.
> 
> - 'test/y_test.txt': Test labels.
> 
> The following files are available for the train and test data. Their descriptions are equivalent. 
> 
> - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
> 
> - 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
> 
> - 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
> 
> - 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
> 
> ### Notes
>
> - Features are normalized and bounded within [-1,1].
> - Each feature vector is a row on the text file.

## run_analysis.R script description

The script manipulates these files contained in the "UCI HAR Dataset" folder of the provided data set:

* train/X_train.txt, training data set with the 561 variables listed in features.txt
* train/y_train.txt, numeric activity IDs in the range 1-6. y_train.txt has one row for each row in X_train.txt
* train/subject_train.txt, each row identifies the subject of the corresponding X_train.txt row. The subjects are integer IDs in the range 1-30
* test/X_test.txt, test data set with the 561 variables listed in features.txt
* test/y_test.txt, numeric activity IDs in the range 1-6. y_test.txt has one row for each row in X_test.txt
* test/subject_test.txt, each row identifies the subject of the corresponding X_test.txt row. The subjects are integer IDs in the range 1-30
* activity_labels.txt, list of the activities that maps each activity ID to a descriptive label
* features.txt, list of the 561 features with numeric ID and label

The following tasks must be completed by the script:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The data set at the end of step 4 is built with a juxtaposition of the starting data files. See the very good picture provided by TA David Hood in the forum post https://class.coursera.org/getdata-016/forum/thread?thread_id=50#comment-333

The script operates as follows:
* downloads and unzips the starting data set, if it's not already present in the working directory
* loads features.txt in a data.table named features. 
* loads a data table named wanted_features with just the features containing a mean or a standard deviation (which are assumed to be those with a name of the form <i>XXXX</i> + one of "mean"/"std"/"meanFreq" + <i>(function parameters)</i>). The wanted_features data.table is used later for tasks #2 and #4
* changes the variable names in wanted_features, using make.names() and some regular expression substitutions (task #4)
* loads activity_labels.txt in a data.table named activity_labels. It will be used to set the activity labels in the clean data set (task #3)
* loads in turn the train and test data sets, one at a time. The following describes the processing of the train data set, it's the same for the test data set
* the X_train.txt file is read in a data.table named X_temp
* X_temp is filtered using the wanted_features data.table, to keep only the mean/standard deviation variables (task #2)
* variable headers of X_temp are changed to those of wanted_features (task #4)
* the y_train.txt file is loaded in a data.table named activities_temp
* adds to activities_temp a new variable with the activity labels, taken from the activity_labels data.table (for task #3)
* the subject_train.txt file is loaded in a data.table named subjects_temp
* the subjects_temp, activities_temp, X_temp data.tables are pasted together using cbind(), the result goes into X_temp.
* the rows in X_temp are added to a data.table named X that will put together the train and test data sets
* repeat the above steps for the test data set (and at this point tasks 1-2-3-4 are completed)
* the final X data.table has 81 variables: subject ID; activity label; 79 variables with mean and standard deviation features
* To perform task #5, X goes through the melt() and dcast() functions. In the melt() call, only subject ID and activity label are passed in the id.vars parameter; all the other variables are "melted" to convert the data set to "long" form. The dcast() call processes the melted data, converting it back to "wide" form and applying the mean() function to all the features except subject id and activity label.
* the X_mean output of melt+dcast is written to file using the write.table() function. It can be read back into R using read.table(), like this:

<pre><code>
  mydata = read.table("tidydata_with_means.txt", header=TRUE)
</code></pre>
