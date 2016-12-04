## Getting Data Course Final Project

run_analysis <- function() {
  # Read in the data - Samsung data must be in working directory
  features <- read.table("features.txt")
  activity_labels <- read.table("activity_labels.txt")
  subject_test <- read.table("test/subject_test.txt")
  X_test <- read.table("test/X_test.txt")
  y_test <- read.table("test/y_test.txt")
  subject_train <- read.table("train/subject_train.txt")
  X_train <- read.table("train/X_train.txt")
  y_train <- read.table("train/y_train.txt")
  
  # Append subject and activity labels to data
  testbind <- cbind(subject_test, y_test, X_test)
  trainbind <- cbind(subject_train, y_train, X_train)
  
  # Combine training and test sets of data
  merged_data <- rbind(testbind, trainbind)
  
  # Extract only the columns containing mean or standard deviation measurements
  featureslist <- features[,2]
  desired_columns <- grep("mean()|std()", featureslist)
  desired_index <- desired_columns + 2
  keep_columns <- c(1,2,desired_index)
  extracted_data <- merged_data[, keep_columns]
  
  # Replace variable names with descriptive names of features
  variable_names <- c("Subject ID", "Activity", as.character(featureslist[desired_columns]))
  names(extracted_data) <- variable_names
  
  # Replace numbers indicating activities with descriptive names
  labeled_data <- within(extracted_data, Activity <- factor(Activity, labels = activity_labels[,2]))
  
  # Create a second data set with average of each variable for each activity and
  # each subject
  new_data <- aggregate(labeled_data[,3:81], labeled_data[,1:2], FUN = mean)
  
  # Create text file with second data set
  write.table(new_data, file = "projectfinaldata.txt", row.name = FALSE)
}