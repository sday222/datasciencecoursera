complete <- function(directory, id = 1:332) {
  complete_files <- list.files(directory, full.names = TRUE)
  
  complete_data <- data.frame(id=numeric(0), nobs=numeric(0))
  single_file <- data.frame(id=numeric(0), nobs=numeric(0))
  
  for (i in id) {
    single_file[1, 1] <- i
    single_file[1, 2] <- sum(complete.cases(read.csv(complete_files[i])))
    
    complete_data <- rbind(complete_data, single_file)
  }
  
  complete_data
}