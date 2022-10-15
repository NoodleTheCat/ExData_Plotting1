#|=============================Plot 4=================================|

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

#Create plot 4
par(mfrow=c(2,2))#set plot layout

plot(x$datetime, x$Global_active_power, type="l", #plot1
     xlab="", ylab="Global Active Power") 

plot(x$datetime, x$Voltage, type="l", #plot2
     xlab="datetime", ylab="Voltage") 

plot(x$datetime, x$Sub_metering_1, type="l", #plot3
     xlab="", ylab="Energy sub metering") 
lines(x$datetime, x$Sub_metering_2, col="red")
lines(x$datetime, x$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2", 
                           "Sub_metering_3"), lty=1, lwd=2, cex=0.7, 
                            col = c("black", "red", "blue"))

plot(x$datetime, x$Global_reactive_power, type="l", #plot4
     xlab="datetime", ylab="Global_reactive_power") 

dev.print(png, file='plot4.png', width=480, height=480)#print your plot
dev.off() #remove device 

