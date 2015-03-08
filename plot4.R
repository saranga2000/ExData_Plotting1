setwd("C:\\UserFileSystem\\personal\\learn\\datasciencesCoursera\\4-exploratoryanalysis\\project1")

plot4 <- function() {
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
      png(filename = "plot4.png", width = 480, height = 480 )
      
      ## draw 4 plots, 2 per row
      par(mfrow = c(2,2))
      
      ## row 1 plot 1
      plot(dateTime, as.numeric(febData[,3]), type = "n", ylab = "Global Active Power", xlab = "")
      lines(dateTime, as.numeric(febData[,3]), type = "l")
      
      ## row 1 plot 2
      plot(dateTime, as.numeric(febData[,5]), type = "n", ylab = names(febData[5]), xlab = "datetime")
      lines(dateTime, as.numeric(febData[,5]), type = "l")
      
      ## row 2 plot 3
      plot(dateTime, as.numeric(febData[,7]), type = "n", ylab = "Energy sub metering", xlab = "")
      lines(dateTime, as.numeric(febData[,7]), type = "l")
      lines(dateTime, as.numeric(febData[,8]), type = "l", col = "red")
      lines(dateTime, as.numeric(febData[,9]), type = "l", col = "blue")
      legend("topright", col = c("black", "red", "blue"), legend = c(names(febData[7]),names(febData[8]),names(febData[9])), lty = c(1,1), bty = "n")
      
      ## row 2plot 4
      plot(dateTime, as.numeric(febData[,4]), type = "n", ylab = names(febData[4]), xlab = "datetime")
      lines(dateTime, as.numeric(febData[,4]), type = "l")
      
      
      ## close png device
      dev.off()
}