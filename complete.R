setwd("D:/3rdSUMMER/ML/Practice_Exercise_2.5")
complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  path <-file.path(getwd(), directory)
  
  result <- data.frame(id=numeric(0), nobs=numeric(0))
  for (i in id){
    filename <-paste(directory,"/",formatC(i, width=3, flag="0"),".csv",sep="")
    x <- read.csv(filename)
    good <- complete.cases(x)
    
    r <- nrow(x[good,])
    rows <- c(i,r)
    result <-rbind(result, rows)
  }
  
  colnames(result)<-c("id","nobs")
  result
  
}
source("complete.R")
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)