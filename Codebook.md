---
title: "Codebook"
output: html_document
---
February 21, 2015

This dataset was prepared from the larger UCI HAR Dataset, which can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The link contains more information on the nature of the study and how measurements were made.

The dataset is organized by the subject ID of one of the thirty study participants, and the type of activity that subject performed. The contents of the dataset are the average of the mean and standard deviations for the variables in the original dataset, split into categories by the subject ID and activity type.

The following is a list of abbreviations which can be consulted in order to determine the meaning of each of the variable names in the dataset:

- **XYZ** This suffix indicates the three-dimensional axis along which a measurement was made.
- **mean()** This indicates that the mean value was calculated for this variable
- **std()** This indicates that the standard deviation value was calculated for this variable
- **meanFreq()** This indicates that a mean frequency was calculated from frequency components
- **Acc** This indicates that a measurement was obtained from the accelerometer
- **Gyro** This indicates that a measurement was obtained from the gyroscope
- **Mag** This indicates that the Euclidean magnitude was calculated for this variable
- **Body** This refers to the movement of the subject's body
- **t** This prefix indicates time domain signals
- **f** This prefix indicates frequency domain signals
- **Gravity** This refers to measurements of gravity
- **Jerk** This indicates that jerk was calculated for this variable