# Getting-and-Cleaning-Data-Project

The purpose of this project is to to collect, work with, and clean the Human Activity Recognition Using Smartphones Data Set.

##Objectives
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Labels the data set with descriptive variable names.
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

##Script Explanation - run_analysis.R

The script succesfully achieves our objective in preparing the data for analysis and exports the desired data sets. The steps below give a concise overview of the procedure:

1. Downloads the UCI HAR Dataset zip file, creates a new directory that will contain all data refering to this project, and unzips the file
2. Merges the test and training data for each individual file i.e (x - measure variables,y - activity code, and subject - subject number)
3. Extracts the mean and standard deviation through acquiring the column numbers from the features file 
4. Matches and replaces the activity number with its corresponding activity name acquired from the activitiy_label file
5. Merges the subject with his/her activity name, and measure variables in one data set, and succesffuly exports this to the desired directory as "Cleaned Data with Labels.txt"
6. Groups the data set by activity then subject, and calculates the mean. Calculations are also exported to the desired directory as "Cleaned Data with Labels and averages.txt".

###N/B:

The dplyr package was used towards the end in calculating the grouped means.
At various intervals in the script View() and summary() are used to monitor the results.  
