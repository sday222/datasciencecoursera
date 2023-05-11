# Part 1
pollutantmean <- function(directory, pollutant, id = 1:332) {
  pollutant_files <- list.files(directory, full.names = TRUE)
  
  pollutant_data <- data.frame()
  for (i in id) {
    pollutant_data <- rbind(pollutant_data, read.csv(pollutant_files[i]))
  }
  
  mean(pollutant_data[,pollutant], na.rm = TRUE)
}


# Part 2
complete <- function(directory, id = 1:332) {
  complete_files <- list.files(directory, full.names = TRUE)
  
  complete_data <- data.frame()
  for (i in id) {
    complete_data <- rbind(complete_data, read.csv(complete_files[i]))
  }
  
  sum(complete.cases(complete_data))
}