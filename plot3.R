setwd("C:\\UserFileSystem\\personal\\learn\\datasciencesCoursera\\4-exploratoryanalysis\\project1")

plot3 <- function() {
      
      
      ## read as a dataframe
      filename <- "household_power_consumption.txt"
      DF <- read.table(filename, header=TRUE, sep=";", colClasses = "character")
      
      ## pick dates
      startDate <- as.Date("2007/02/01", "%Y/%m/%d")
      endDate <- as.Date("2007/02/02", "%Y/%m/%d")
      
      ## get subset of data for picked dates
      febData <- subset(DF, as.Date(DF[,1], "%d/%m/%Y") >= startDate & as.Date(DF[,1], "%d/%m/%Y") <= endDate)
      
      ## convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions
      dateTime <- paste(febData[,1], febData[,2], sep = ",")
      dateTime <- strptime(dateTime, format="%d/%m/%Y,%H:%M:%S")
      
      ## create png file
      png(filename = "plot3.png", width = 480, height = 480 )      
      ## plot line chart
      plot(dateTime, as.numeric(febData[,7]), type = "n", ylab = "Energy sub metering", xlab = "")
      lines(dateTime, as.numeric(febData[,7]), type = "l")
      lines(dateTime, as.numeric(febData[,8]), type = "l", col = "red")
      lines(dateTime, as.numeric(febData[,9]), type = "l", col = "blue")
      legend("topright", col = c("black", "red", "blue"), legend = c(names(febData[7]),names(febData[8]),names(febData[9])), lty = c(1,1))
      
      ## close png device
      dev.off()
}