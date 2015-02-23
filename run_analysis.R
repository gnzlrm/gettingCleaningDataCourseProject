library('reshape2')


createDataFrame <- function() {
    folders <- c('test', 'train')
    data <- NULL # Declares the 'data' variable. NULL vector will be ignored by rbind.
    for (folder in folders) { # Iterate's over the folders vector, reading files from each.
        print(paste("[-] Loading", folder, "files..."))
        setwd(folder) # 
        result <- cbind(read.table(file = paste('X_', folder, '.txt', sep = "")),
                        read.table(file = paste('subject_', folder, '.txt', sep ="")),
                        read.table(file = paste('Y_', folder, '.txt', sep = "")))
        data <- rbind(data, result) # Form a single dataframe with all the data.
        print(paste("[+] Done loading", folder, "files."))
        setwd("..")
    }
    features <- read.table(file = "features.txt") # This table's used to acquire the 
    features <- features[c(grep("mean()", features$V2, fixed = TRUE), # measure labels.
                           grep("std()", features$V2, fixed = TRUE)),] 
    data <- data[c(features$V1, 562, 563)] # Drop the unneeded columns.
    names(data) <- c(as.character(features$V2), "Subject", "Activity")
    activities <- read.table(file = "activity_labels.txt")
    for (activity.index in activities[[1]]) { # This loop will set the activities labels.
        data$Activity <- ifelse(data$Activity == activity.index, 
                                as.character(activities[activity.index, 2]), 
                                data$Activity)
    }
    data <- melt(data = data, id.vars = c("Activity", "Subject")) # Set the ids.
    data <- dcast(Activity + Subject ~ variable, data = data, # Aggregate the variables
                      fun.aggregate = mean) # based on each id as the mean of each.
    write.table(data, file = "tidyDataMeans.txt", row.names = FALSE) # Write the file.
}

createDataFrame() 