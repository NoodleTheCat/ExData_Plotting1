#|=============================Plot 1=================================|

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

#Create plot 1
hist(x$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

dev.print(png, file='plot1.png', width=480, height=480)#print plot
dev.off()