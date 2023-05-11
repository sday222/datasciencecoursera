pollutantmean <- function(directory, pollutant, id = 1:332) {
  pollutant_files <- list.files(directory, full.names = TRUE)
  
  pollutant_data <- data.frame()
  for (i in id) {
    pollutant_data <- rbind(pollutant_data, read.csv(pollutant_files[i]))
  }
  
  mean(pollutant_data[,pollutant], na.rm = TRUE)
}
