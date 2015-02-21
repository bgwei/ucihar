---
title: "README"
output: html_document
---

This dataset was prepared from the larger UCI HAR Dataset, which can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The link contains more information on the nature of the study and how measurements were made.

The dataset is organized by the subject ID of one of the thirty study participants, and the type of activity that subject performed. The contents of the dataset are the average of the mean and standard deviations for the variables in the original dataset, split into categories by the subject ID and activity type.

The script "run_analysis.R" found in this repo was used to extract and modify the data from the original UCI HAR Dataset. The script merges the training and test datasets. It labels each column with its appropriate measurement/calculated variable and adds two additional columns to classify the data by subject ID and activity type. It then extracts a subset of the data which only contains columns with mean or standard deviation data. The average for the mean and standard deviation measurements are calculated for each activity type for each subject, and the results are written the output text file.