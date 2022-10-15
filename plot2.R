#|=============================Plot 2=================================|

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

#Create plot 2
plot(x$datetime, x$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)") #view your plot in RStudioGD

dev.print(png, file='plot2.png', width=480, height=480)#print your plot
dev.off() #remove device 
