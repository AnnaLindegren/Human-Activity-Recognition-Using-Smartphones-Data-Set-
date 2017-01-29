#What are we doing?

There will be 5 steps in `run_analysis.R` file. Here are what they mean: 

1. Step: Merge the training and testing sets to create one data set.
2. Step: Extract only the measurements on the mean and standard deviation for each measurement.
3. Step: Use descriptive activity names to name the activities in the data set.
4. Step: Appropriately label the data set with descriptive variable names.
5. Step: Create a second, independent tidy data set with the average of each variable.

#Variables
1. `x_training` and  `y_training`, same as `x_testing` and  `y_testing`, `subject_train`, `subject_test` contains data from the files we download via assignment. 
2.  `x_data`,  `y_data` and  `we_do_data` merge the previous datasets for the future analysis
3. `features` contains the correct names for the `x_data` dataset, which are applied to the column names stored in `mean_and_std_features`, a numeric vector used to extract the desired data.
4. `activities` are designed by the same algorithm as `features` above
5. `all_data` merges `x_data`, `y_data` and `we_do_data` in a bigger dataset
