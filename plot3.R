#|=============================Plot 3=================================|

setwd()#set your working directory 

#Use the following to read-in specific lines from text file
whichline <- function(data){
  data <- read.table(file="household_power_consumption.txt", header=FALSE, sep=';')
  colnames(data) <- read.table(file="household_power_consumption.txt", 
                               header=FALSE, sep=';', nrow=1)
                        #Add column names 
  
  range(which(data$Date %in% c("1/2/2007", "2/2/2007")))
  
}#function to determine range of lines to read by date

readlines <- whichline("household_power_consumption.txt") #run function 
Rows <- max(readlines) - min(readlines) #"nrow" to read


x <- read.table(file="household_power_consumption.txt", #read specific lines
                header=FALSE, sep=";", skip=min(readlines), nrows=Rows)
colnames(x) <- read.table(file="household_power_consumption.txt", 
                          header=FALSE, sep=';', nrow=1)
                      #Add column names 

#Add time/date column 
x$datetime <- paste(x$Date, x$Time, sep=" ") #create string of date/time
x$datetime <- strptime(x$datetime, format="%d/%m/%Y %H:%M:%S") #convert to date time class

#Create plot 3
plot(x$datetime, x$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub metering") #view your plot in RStudioGD
lines(x$datetime, x$Sub_metering_2, col="red") #add data series
lines(x$datetime, x$Sub_metering_3, col="blue")  
legend("topright",legend=c("Sub_metering_1","Sub_metering_2", #add legend to plot
      "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))

dev.print(png, file='plot3.png', width=480, height=480)#print your plot
dev.off() #remove device 

