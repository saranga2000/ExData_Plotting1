setwd("C:\\UserFileSystem\\personal\\learn\\datasciencesCoursera\\4-exploratoryanalysis\\project1")

plot1 <- function() {
      
      ## read as a dataframe
      filename <- "household_power_consumption.txt"
      DF <- read.table(filename, header=TRUE, sep=";", colClasses = "character")
      
      ## pick dates
      startDate <- as.Date("2007/02/01", "%Y/%m/%d")
      endDate <- as.Date("2007/02/02", "%Y/%m/%d")
      
      ## get subset of data for picked dates
      febData <- subset(DF, as.Date(DF[,1], "%d/%m/%Y") >= startDate & as.Date(DF[,1], "%d/%m/%Y") <= endDate)
      
      ## create png file
      png(filename = "plot1.png", width = 480, height = 480 )
      
      ## plot histogram
      hist(as.numeric(febData[,3]), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
      
      ## close png device
      dev.off()
}