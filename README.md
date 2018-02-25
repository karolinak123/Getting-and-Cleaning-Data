run_analysis.R code description:

First script is loading test-related data tables into R:
X_test, y_test, test_subject.
Then binding all test-related datasets into one dataset
Then loading features table into R, which contains colnames
Then loading activity labels table into R
Next it's loading train-related data tables into R:
X_train, y_train, train_subject.
Then binding all train-related datasets into one dataset
and finally merging test and train datasets into one and assigning colnames (features table)
Next step is joining activity labels to test&train dataset and asigning colnames
Then selecting only columns that contain mean or std data
and creating subset that contains mean() summarization per subject and activity.
Lastly script is creating txt file with output tidy data set.
