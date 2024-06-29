setwd("D:/3rdSUMMER/ML/Practice_Exercise_2.5")
source("D:/3rdSUMMER/ML/Practice_Exercise_2.5/pollutantmean.R")
pollutantmean <- function(directory, pollutant, id = 1:332) {
  # Construct the path to the directory containing the CSV files
  path <- file.path(getwd(), directory)
  
  # Initialize an empty data frame to store all rows from the selected monitors
  allrows <- data.frame()
  
  # Loop through each monitor ID and read its data
  for (i in id) {
    filename <- paste(path, "/", formatC(i, width=3, flag="0"), ".csv", sep="")
    x <- read.csv(filename)
    
    # Append the current monitor's data to the allrows data frame
    allrows <- rbind(allrows, x)
  }
  
  # Calculate the mean of the specified pollutant, ignoring NA values
  avg <- if (pollutant == "sulfate") {
    mean(allrows$sulfate, na.rm = TRUE)
  } else if (pollutant == "nitrate") {
    mean(allrows$nitrate, na.rm = TRUE)
  }
  
  return(avg)
}

source("pollutantmean.R")

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
