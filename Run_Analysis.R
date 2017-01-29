library(plyr)

# Step 1

x_training <- read.table("train/X_train.txt")
y_training <- read.table("train/y_train.txt")
we_do_training <- read.table("train/subject_train.txt")

x_testing <- read.table("test/X_test.txt")
y_testing <- read.table("test/y_test.txt")
we_do_test <- read.table("test/subject_test.txt")

# create 'x' data set
x_data <- rbind(x_training, x_testing)

# create 'y' data set
y_data <- rbind(y_training, y_testing)

# create 'we_do' data set
we_do_data <- rbind(we_do_training, we_do_testing)

# Step 2

features <- read.table("features.txt")

# get columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# change the column names
names(x_data) <- features[mean_and_std_features, 2]

# Step 3

activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

# Step 4

# correct column name
names(we_do_data) <- "we_do"

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, we_do_data)

# Step 5

averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages_data, "averages_data.txt", row.name=FALSE)
