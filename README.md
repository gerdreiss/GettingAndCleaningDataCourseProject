# Getting And Cleaning Data Course Project

The goal of the project is to prepare tidy data that can be used for later analysis. 

### Repository content

The repository contains the following resources:

1. This README file
2. The code book for the submitted dataset (CodeBook.md)
3. The exact recipe for the data analysis and preparation for the project (run_analysis.R)

### The script

The script contained withing the file run_analysis.R performs the following steps:

1. Download and unzip the datasets of the Human Activity Recognition Using Smartphones experiment:
    + Source URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    + File: UCI HAR Dataset.zip
2. Parse the files from the extracted files in the folder *"data/URI HAR Dataset"* containing the data:
    + activity_labels.txt
    + features.txt
    + train/subject_train.txt
    + train/X_train.txt
    + train/y_train.txt
    + test/subject_test.txt
    + test/X_test.txt
    + test/y_test.txt
3. Use data extracted from features.txt to extract column names for datasets extracted from X_train.txt and X_test.txt
4. Use data extracted from activity_labels.txt to replace numeric activity values by more descriptive character values in data extrated from y_train.txt and y_test.txt
5. Join the data extracted from
    + train/X_train.txt and test/X_test.txt
    + train/y_train.txt and test/y_test.txt
    + train/subject_train.txt and test/subject_test.txt
5. Join all data into one dataset
6. Extract the subset of the data we are interested in
7. Calculate the means for all measurements grouping by subject and activity fields
8. Write the resulting data table into the file averages.txt


The script can be run using Rscript command line:

```
Rscript run_analysis.R
```

The result will be:

- Folder "data" that contains the downloaded and unzipped raw data
- File "averages.txt" that contains the resulting tidy dataset


