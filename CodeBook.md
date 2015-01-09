# Code book

This code book describes the data, the variables, and transformation performed to
clean up the raw dataset from the Human Activity Recognition Using Smartphones experiment.

### Data

The raw data that served as the base for the presented data has been gathered in the
context of the Human Activity Recognition Using Smartphones experiment, and downloaded, 
parsed and tidied up. The a subset of the data has been extracted and the means have been
calculated while grouped by performing subjects and performed activities. The extracted
subset contained mean values and standard deviations of all measurements performed in 
the context of the experiment.

The script included with the project performes the following steps:

1. Download and unzip the datasets of the Human Activity Recognition Using Smartphones experiment:
    + Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    + File: UCI HAR Dataset.zip
2. Parse the files containing the data:
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
7. Calculate the means for all measurements grouping by subject and activity

### Variables

The full description of the variables that mostly preserved their name structure from the 
raw data can be seen in the downloaded datasets, file **"features_info.txt"**. Below 
are presented structured descriptions of the variables as used in the tidy dataset.

| Parameter | Value |
| --------- | ----- |
| Field label:      | Subject |
| Variable:         | ID of the subject that performed an activity |
| Variable type:    | Integer |
| Allowable values: | 1 - 30 |
| - | |
| Field label:      | Activity |
| Variable:         | Activity that has been measured |
| Variable type:    | Character |
| Allowable values: | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING |
| - | |
| Field label:      | TimeBodyAccelerationMeanX |
| Variable:         | Body acceleration mean time on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationMeanY |
| Variable:         | Body acceleration mean time on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationMeanZ |
| Variable:         | Body acceleration mean time on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationStdDeviationX |
| Variable:         | Body acceleration time standard deviation on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationStdDeviationY |
| Variable:         | Body acceleration time standard deviation on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationStdDeviationZ |
| Variable:         | Body acceleration time standard deviation on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeGravityAccelerationMeanX |
| Variable:         | Gravity acceleration mean time on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeGravityAccelerationMeanY |
| Variable:         | Gravity acceleration mean time on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeGravityAccelerationMeanZ |
| Variable:         | Gravity acceleration mean time on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeGravityAccelerationStdDeviationX |
| Variable:         | Gravity acceleration time standard deviation on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeGravityAccelerationStdDeviationY |
| Variable:         | Gravity acceleration time standard deviation on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeGravityAccelerationStdDeviationZ |
| Variable:         | Gravity acceleration time standard deviation on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationJerkMeanX |
| Variable:         | Body acceleration jerk mean time on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationJerkMeanY |
| Variable:         | Body acceleration jerk mean time on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationJerkMeanZ |
| Variable:         | Body acceleration jerk mean time on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationJerkStdDeviationX |
| Variable:         | Body acceleration jerk standard deviation on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationJerkStdDeviationY |
| Variable:         | Body acceleration jerk standard deviation on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationJerkStdDeviationZ |
| Variable:         | Body acceleration jerk standard deviation on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeMeanX |
| Variable:         | Body gyroscope mean time on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeMeanY |
| Variable:         | Body gyroscope mean time on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeMeanZ |
| Variable:         | Body gyroscope mean time on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeStdDeviationX |
| Variable:         | Body gyroscope time standard deviation on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeStdDeviationY |
| Variable:         | Body gyroscope time standard deviation on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeStdDeviationZ |
| Variable:         | Body gyroscope time standard deviation on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeJerkMeanX |
| Variable:         | Body gyroscope jerk mean time on axe X|
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeJerkMeanY |
| Variable:         | Body gyroscope jerk mean time on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeJerkMeanZ |
| Variable:         | Body gyroscope jerk mean time on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeJerkStdDeviationX |
| Variable:         | Body gyroscope jerk time standard deviation on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeJerkStdDeviationY |
| Variable:         | Body gyroscope jerk time standard deviation on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeJerkStdDeviationZ |
| Variable:         | Body gyroscope jerk time standard deviation on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationMagnitudeMean |
| Variable:         | Body acceleration magnitude mean time |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationMagnitudeStdDeviation |
| Variable:         | Body acceleration magnitude standard deviation |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeGravityAccelerationMagnitudeMean |
| Variable:         | Gravity acceleration magnitude mean time |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeGravityAccelerationMagnitudeStdDeviation |
| Variable:         | Gravity acceleration magnitude standard deviation |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationJerkMagnitudeMean |
| Variable:         | Body acceleration jerk magnitude mean time |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyAccelerationJerkMagnitudeStdDeviation |
| Variable:         | Body acceleration jerk magnitude standard deviation |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeMagnitudeMean |
| Variable:         | Body gyroscope magnitude mean time |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeMagnitudeStdDeviation |
| Variable:         | Body gyroscope magnitude time standard deviation |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeJerkMagnitudeMean |
| Variable:         | Body gyroscope jerk magnitude mean time |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | TimeBodyGyroscopeJerkMagnitudeStdDeviation |
| Variable:         | Body gyroscope jerk magnitude standard deviation |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationMeanX |
| Variable:         | Body acceleration mean frequency on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationMeanY |
| Variable:         | Body acceleration mean frequency on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationMeanZ |
| Variable:         | Body acceleration mean frequency on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationStdDeviationX |
| Variable:         | Body acceleration frequency standard deviation on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationStdDeviationY |
| Variable:         | Body acceleration frequency standard deviation on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationStdDeviationZ |
| Variable:         | Body acceleration frequency standard deviation on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationJerkMeanX |
| Variable:         | Body acceleration jerk mean frequency on axe X|
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationJerkMeanY |
| Variable:         | Body acceleration jerk mean frequency on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationJerkMeanZ |
| Variable:         | Body acceleration jerk mean frequency on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationJerkStdDeviationX |
| Variable:         | Body acceleration jerk frequency standard deviation on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationJerkStdDeviationY |
| Variable:         | Body acceleration jerk frequency standard deviation on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationJerkStdDeviationZ |
| Variable:         | Body acceleration jerk frequency standard deviation on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyGyroscopeMeanX |
| Variable:         | Body gyroscope mean frequence on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyGyroscopeMeanY |
| Variable:         | Body gyroscope mean frequence on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyGyroscopeMeanZ |
| Variable:         | Body gyroscope mean frequence on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyGyroscopeStdDeviationX |
| Variable:         | Body gyroscope frequency standard deviation on axe X |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyGyroscopeStdDeviationY |
| Variable:         | Body gyroscope frequency standard deviation on axe Y |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyGyroscopeStdDeviationZ |
| Variable:         | Body gyroscope frequency standard deviation on axe Z |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationMagnitudeMean |
| Variable:         | Body acceleration mean frequency magnitude |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyAccelerationMagnitudeStdDeviation |
| Variable:         | Body acceleration frequency magnitude standard deviation |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyBodyAccelerationJerkMagnitudeMean |
| Variable:         | Body Body acceleraiton jerk magnitude mean frequency |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyBodyAccelerationJerkMagnitudeStdDeviation |
| Variable:         | Body Body acceleraiton jerk magnitude frequency standard deviation |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyBodyGyroscopeMagnitudeMean |
| Variable:         | Body body gyroscope magnitude mean frequency |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyBodyGyroscopeMagnitudeStdDeviation |
| Variable:         | Body body gyroscope magnitude frequency standard deviation |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyBodyGyroscopeJerkMagnitudeMean |
| Variable:         | Body body gyroscope jerk magnitude mean frequency |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |
| - | |
| Field label:      | FrequencyBodyBodyGyroscopeJerkMagnitudeStdDeviation |
| Variable:         | Body body gyroscope jerk magnitude frequency standard deviation |
| Variable type:    | Numeric |
| Allowable values: | Numeric values |

