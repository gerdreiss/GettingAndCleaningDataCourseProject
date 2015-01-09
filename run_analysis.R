################################################################################
## run_analysis.R                                                              #
##                                                                             #
## Downloads and unzips, reads, merges and tidies up the UCI HAR dataset       #
## for the Coursera Getting and Cleaning Data Course Project                   #
##                                                                             #
## @author Gerd Reiss                                                          #
##                                                                             #
################################################################################

library(data.table)

datadir <- "data"

################################################################################
## Download and unzip the dataset if not yet done so
if (length(list.dirs(datadir, full.names = T, recursive = F)) == 0) {
    fsource <- "https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip"
    fdestination <- paste(c(datadir, "UCI HAR Dataset.zip"), collapse = "/")
    dir.create(file.path(getwd(), datadir), showWarnings = F)
    download.file(url = fsource, destfile = fdestination, method = "curl")
    unzip(zipfile = fdestination, exdir = datadir)
    # remove unneeded data from the workspace
    remove("fsource"); remove("fdestination")
}

################################################################################
## Read raw data
datadir <- list.dirs(datadir, full.names = T, recursive = F)[1]

## Common data

# Activity labels
factivitylabels <- paste(c(datadir,"activity_labels.txt"), collapse = "/")
dt.activitylabels <- fread(input = factivitylabels, header = F,
                           colClasses = c("integer","character"))
setnames(dt.activitylabels, c("id","Activity"))
setkeyv(dt.activitylabels, "id") # will be used later for value replacement (id -> label)
# remove unneeded data from the workspace
remove("factivitylabels")

# Features for later use as column names
ffeatures <- paste(c(datadir,"features.txt"), collapse = "/")
dt.features <- fread(input = ffeatures, data.table = T, header = F,
                     colClasses = c("integer","character"))
setnames(dt.features, make.names(c("id","feature")))
dt.measurement.columns <- sapply(dt.features$feature, function(f) gsub("-mean[(][)]", "_mean_", f))
dt.measurement.columns <- sapply(dt.measurement.columns, function(f) gsub("-std[(][)]", "_std_", f))
dt.measurement.columns <- sapply(dt.measurement.columns, function(f) gsub("[-,.()]", "", f))
# remove unneeded data from the workspace
remove("ffeatures"); remove("dt.features")

## Training dataset

# Training subject
fsubjects <- paste(c(datadir,"train","subject_train.txt"), collapse = "/")
dt.subjects <- fread(input = fsubjects, data.table = T, header = F,
                     colClasses = "integer")
setnames(dt.subjects, make.names("Subject"))
# remove unneeded data from the workspace
remove("fsubjects")

# Training activity
factivities <- paste(c(datadir,"train","y_train.txt"), collapse = "/")
dt.auxactivities <- fread(input = factivities, data.table = T, header = F,
                          colClasses = "integer")
setnames(dt.auxactivities, make.names("iactivity"))
setkeyv(dt.auxactivities, "iactivity")
# replace activity numeric values by labels
dt.activities <- dt.auxactivities[dt.activitylabels, ]
dt.activities[, iactivity := NULL]
# remove unneeded data from the workspace
remove("factivities"); remove("dt.auxactivities")

# Training values
fmeasurements <- paste(c(datadir,"train","X_train.txt"), collapse = "/")
df.measurements <- read.table(file = fmeasurements, header = F, 
                              col.names = dt.measurement.columns, colClasses = "numeric")
dt.measurements <- data.table(df.measurements, keep.rownames = F)
# remove unneeded data from the workspace
remove("fmeasurements"); remove("df.measurements")

## Test dataset

# Training subject
ftestsubjects <- paste(c(datadir,"test","subject_test.txt"), collapse = "/")
dt.testsubjects <- fread(input = ftestsubjects, data.table = T, header = F,
                         colClasses = "integer")
setnames(dt.testsubjects, make.names("Subject"))
# remove unneeded data from the workspace
remove("ftestsubjects")

# Training activity
ftestactivities <- paste(c(datadir,"test","y_test.txt"), collapse = "/")
dt.auxactivities <- fread(input = ftestactivities, data.table = T, header = F,
                          colClasses = "integer")
setnames(dt.auxactivities, make.names("iactivity"))
setkeyv(dt.auxactivities, "iactivity")
# replace activity numeric values by labels
dt.testactivities <- dt.auxactivities[dt.activitylabels, ]
dt.testactivities[, iactivity := NULL]
# remove unneeded data from the workspace
remove("ftestactivities"); remove("dt.auxactivities"); remove("dt.activitylabels")

# Training values
ftestmeasurements <- paste(c(datadir,"test","X_test.txt"), collapse = "/")
df.testmeasurements <- read.table(file = ftestmeasurements, header = F, 
                                  col.names = dt.measurement.columns, colClasses = "numeric")
dt.testmeasurements <- data.table(df.testmeasurements, keep.rownames = F)
# remove unneeded data from the workspace
remove("dt.measurement.columns"); remove("ftestmeasurements"); remove("df.testmeasurements"); remove("datadir")

################################################################################
# Merges the training and the test sets to create one data set.

# merge subjects
dt.totalsubjects <- rbind(dt.subjects, dt.testsubjects)
# remove unneeded data from the workspace
remove("dt.subjects"); remove("dt.testsubjects")

# merge activities
dt.totalactivities <- rbind(dt.activities, dt.testactivities)
# remove unneeded data from the workspace
remove("dt.activities"); remove("dt.testactivities")

# merge measurements
dt.totalmeasurements <- rbind(dt.measurements, dt.testmeasurements)
# remove unneeded data from the workspace
remove("dt.measurements"); remove("dt.testmeasurements")

# merge all
dt.total <- cbind(dt.totalsubjects, dt.totalactivities, dt.totalmeasurements)
# remove unneeded data from the workspace
remove("dt.totalsubjects"); remove("dt.totalactivities"); remove("dt.totalmeasurements")

################################################################################
## Extracts only the measurements on the mean and standard deviation for each measurement

# extract means and standard deviations
dt.total.columnindices <- grep("Subject|Activity|_mean_|_std_", colnames(dt.total))
dt.reduced <- subset(dt.total, select = dt.total.columnindices)
# remove unneeded data from the workspace
remove("dt.total.columnindices"); remove("dt.total")

# Appropriately labels the data set with descriptive variable names.
dt.reduced.columns <- colnames(dt.reduced)
dt.reduced.columns <- sapply(dt.reduced.columns, function(name) {
    gsub("Acc", "Acceleration", 
         gsub("Gyro", "Gyroscope", 
              gsub("Mag", "Magnitude", 
                   gsub("_mean_", "Mean", 
                        gsub("_std_", "StdDeviation", 
                             gsub("^t", "Time", 
                                  gsub("^f", "Frequency", name)))))))
})
setnames(dt.reduced, dt.reduced.columns)
# remove unneeded data from the workspace
remove("dt.reduced.columns")

################################################################################
## Dataset with the average of each variable for each activity and each subject.

# setkey(dt.reduced, Subject, Activity)
dt.averages <- dt.reduced[ , lapply(.SD, mean), .SDcols = colnames(dt.reduced)[3:68], by = c("Subject","Activity")]
write.table(dt.averages[order(rank(Subject), rank(Activity))], file = "averages.txt", row.names = F)

