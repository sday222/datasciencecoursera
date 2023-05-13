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


# get all of the files in the directory
corr_files <- list.files("specdata", full.names = TRUE)

# of the files in the directory, how many are complete
complete_corr_files <- complete("specdata")

# set empty vector for files that will be processed later
files_to_read <- c()

for (i in 1:length(complete_corr_files[[1]])) {
  if (complete_corr_files[[i,2]] >= 1000) {
    files_to_read  <- c(files_to_read, complete_corr_files[i,1])
  }
}

corr_data_frame <- data.frame()
for (i in 1:length(files_to_read)) {
  corr_data_frame <- rbind(corr_data_frame, read.csv(corr_files[i]))
}

cor(corr_data_frame$sulfate, corr_data_frame$nitrate, na.rm = TRUE)
