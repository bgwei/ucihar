## Loading test data
test_data <- read.table("test/X_test.txt")
test_labels <- readLines("test/y_test.txt")
# Labelling test_data columns based on features.txt
features <- read.table("features.txt")
names(test_data) <- features$V2
## Labelling y_test.txt with corresponding activities
## from activity_labels.txt
test_labels <- replace(test_labels,test_labels == "1", "WALKING")
test_labels <- replace(test_labels,test_labels == "2", "WALKING_UPSTAIRS")
test_labels <- replace(test_labels,test_labels == "3", "WALKING_DOWNSTAIRS")
test_labels <- replace(test_labels,test_labels == "4", "SITTING")
test_labels <- replace(test_labels,test_labels == "5", "STANDING")
test_labels <- replace(test_labels,test_labels == "6", "LAYING")
## Adding labels to test data
test_data$"Activity_Type" <- test_labels
## Adding subject ID to test data
subject_test <- readLines("test/subject_test.txt")
test_data$"Subject_ID" <- subject_test
##
## Loading train data
train_data <- read.table("train/X_train.txt")
train_labels <- readLines("train/y_train.txt")
subject_train <- readLines("train/subject_train.txt")
## Labelling train data as above
names(train_data) <- features$V2
train_labels <- replace(train_labels,train_labels == "1", "WALKING")
train_labels <- replace(train_labels,train_labels == "2", "WALKING_UPSTAIRS")
train_labels <- replace(train_labels,train_labels == "3", "WALKING_DOWNSTAIRS")
train_labels <- replace(train_labels,train_labels == "4", "SITTING")
train_labels <- replace(train_labels,train_labels == "5", "STANDING")
train_labels <- replace(train_labels,train_labels == "6", "LAYING")
train_data$"Activity_Type" <- train_labels
train_data$"Subject_ID" <- subject_train
## Merging train and test data sets
merged_data <- rbind(train_data,test_data)
## Extracting mean and standard deviation columns, making sure to keep subject id/activity type
cols_to_select <- (grepl("mean()",names(merged_data)) | grepl("std()",names(merged_data)) 
                   |grepl("Activity_Type",names(merged_data)) | grepl("Subject_ID",names(merged_data)))
extracted_data <- merged_data[cols_to_select]
## Creation of 2nd dataset
library(dplyr)
dataset_2 <- extracted_data %>% group_by(Subject_ID,Activity_Type) %>% summarise_each(funs(mean))
## Rearrangement of 2nd dataset
dataset_2$Subject_ID <-  as.numeric(dataset_2$Subject_ID)
arranged_dataset <- arrange(dataset_2, as.numeric(Subject_ID), Activity_Type)
write.table(arranged_dataset,"tidy_data_set.txt",row.name = FALSE)