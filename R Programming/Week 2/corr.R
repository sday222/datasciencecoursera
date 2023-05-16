corr <- function(directory, threshold = 0) {
  # get all of the files in the directory
  all_files <- list.files(directory, full.names = TRUE)
  
  # of the files in the directory, how many are complete
  complete_files <- complete(directory)
  
  # set empty vector for files that will be processed later
  files_to_read <- c()
  for (i in 1:length(complete_files[[1]])) {
    if (complete_files[[i,2]] > threshold) {
      files_to_read  <- c(files_to_read, complete_files[i,1])
    }
  }
  
  correlations <- c()
  for (i in 1:length(files_to_read)) {
    targetFile <- read.csv(all_files[files_to_read[i][1]])
    correlation <- cor(targetFile$sulfate, targetFile$nitrate, use = "complete.obs")
    
    correlations <- c(correlations, correlation)
  }
  
  correlations
}