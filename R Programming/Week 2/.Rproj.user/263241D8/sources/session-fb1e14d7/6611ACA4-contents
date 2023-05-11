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
  
  complete_data <- data.frame(id=numeric(0), nobs=numeric(0))
  single_file <- data.frame(id=numeric(0), nobs=numeric(0))
  
  for (i in id) {
    single_file[1, 1] <- i
    single_file[1, 2] <- sum(complete.cases(read.csv(complete_files[i])))
    
    complete_data <- rbind(complete_data, single_file)
  }
  
  complete_data
}


# Part 3
corr <- function(directory, threshold = 0) {
  
}


# get a directory of files
corr_files <- complete("specdata")

for (i in 1:dim(corr_files[1])) {
  if (corr_files[i,2] >= 400) {
    print(corr_files)
  }
}
