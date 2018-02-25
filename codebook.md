Variables description - run_analysis.R script

test_x - data set containing X_test.txt file
test_y - data set containing y_test.txt file
subject_test - data set containing test_subject.txt file

test_dataset - all test-related datasets merged into one dataset
features - data set containing features.txt file
activity_labels - data set containing activity_labels.txt file

train_x - data set containing X_train.txt file
train_y - data set containing y_train.txt file
subject_train - data set containing train_subject.txt file

train_dataset - all train-related datasets merged into one datase
dataset - test and train datasets merged into one with colnames asigned from features table
dataset_2 - dataset joined with activity_labels
valid_features - unique colnames for dataset_2

dataset_final - dataset_2, but only with sucject, activity and all mean and std- related columns

subset_dataset_final  - subset of dataset_final, groupped by subject and activity, summarized with mean function
