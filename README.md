==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Original data from: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
Analysed and adapted by M.van Veen for Coursera Getting and Cleaning Data
Script name: run_analysis.R

30 volunteers performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing
two sensor signals (accelerometer and gyroscope). Script takes pre-analysed data from UCI HAR Dataset folder and generates a total dataframe with new variables. After that the script
makes an selection and calculates the mean of different variables per activity, per volunteer.
raw data contained:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Script takes raw data from the following folders in the UCI HAR Dataset:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Script: 
======
- Loads library dplyr
READ FILES
- reads all test files with read.table. Transforms x_test and y_test to tbl_df to use dplyr package
- assigns names to ytest and subjtest (Activity an Subject respectively)
- reads all train files with read.table. Transforms x_train and y_train to tbl_df to use dplyr package
- assigns names to ytrain and subjtrain (Activity an Subject respectively)
- reads features file into names vector and assigns names to colnames of Xtrain and Xtest
MAKE ONE BIG DF
- rbinds Xtrain and Xtest to get Xtotal
- rbinds Ytrain and Ytest to get Ytotal
- rbinds subjtrain and subjtest to get Subjtotal
- column binds Xtotal, Ytotal and Subjtotal to total
MAKE SELECTION OF ALL MEAN AND STD CONTAINING COLUMNS
- Selects all columns containing mean,std or Mean. This includes meanfrequency and anglevariables since they are variable means, unclear if this variable mean should be inserted.
- columnbinds the selected columns in tbl_df (Selectmeanstd)
ASSIGN DESCRIPTIVE ACTIVITY NAMES TO DF 
- generates vector containing descriptive activity names instead of numbers
- columnbinds Selectmeanstd with descriptive activity names and subject (Selectact)
CHANGE VARIABLE NAMES IN READABLE NAMES
- converts capitals in variablenames Selectact to lowercase letters
- uses function to remove all -,(,),,, and converts all abreviations to full names. Removes time indicator (t) because this is
a shared denominator. Adds transformation instead of f.
- assigns new variable names to column names of Selectact
GROUP DATA BY SUBJECT AND ACTIVITY AND TAKE MEAN OF THE DIFFERENT VARIABLES
- groups subject and activity data using (dplyr command) group_by from Selectact
- calculates mean of all variables per activty and subject using summarise_each and function mean.
- saves the calculated means of every variable per activity and subject in a vector final.
- returnes the first rows of DF final

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
