## 
## Exploratory Data Analysis Week 1 Project 
## Author: Barron          Date: 04/09/2017
## 
## 1) Read Data Set for dates 2007-02-01 and 2007-02-02
## 2) Create the following graphs  to examine how household energy varies over two days and save as .PNG file
##	a) plot1.png: Histogram Global active power (kW) (Red columns)
## 	b) plot2.png: Run Chart Global Active Power over time
##	c) plot3.png: Run Chart of Sub_Metering_1, Sub_Metering_2 (Red), Sub_Metering_3 (Blue) over time
##	4) plot4.png: four panel plot of Run Chart Global Active Power over time (item b), 
##			  Run chart of Voltage over time, Run Chart of energy sub metering (item c),
##                  Run chart of Global Reactive Power over time.
##----------------------------------------------------------------------------------------------------------------		
##
## Read Data
setwd("E:/Coursera/Data/C4_Week1/proj")
PWRdata<-read.table("./household_power_consumption.txt", sep=";", header=TRUE,colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

## Subset data for dates of interest
PWR2Day<-subset(PWRdata,Date=="1/2/2007"|Date=="2/2/2007")

## Convert date column from factor & create TimeStamp Column for use in Run Charts
PWR2Day$Date<-as.Date(PWR2Day$Date,format="%d/%m/%Y")
PWR2Day<-cbind(PWR2Day,"TimeStamp"=as.POSIXct(paste(PWR2Day$Date, as.character(PWR2Day$Time))))
## 
## Plot 1
#PWR2Day$Global_active_power<-as.numeric(PWR2Day$Global_active_power)
png(filename="plot1.png",height=480,width=480)
hist(PWR2Day$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
##
## Plot 2
png(filename="plot2.png",height=480,width=480)
plot(PWR2Day$TimeStamp,PWR2Day$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()
##
## Plot 3
png(filename="plot3.png",height=480,width=480)
plot(PWR2Day$TimeStamp,PWR2Day$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(PWR2Day$TimeStamp,PWR2Day$Sub_metering_2,col="Red")
lines(PWR2Day$TimeStamp,PWR2Day$Sub_metering_3,col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty=c(1,1,1))
dev.off()
##
## Plot 4
png(filename="plot4.png",height=480,width=480)
par(mfrow=c(2,2))
plot(PWR2Day$TimeStamp,PWR2Day$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
plot(PWR2Day$TimeStamp,PWR2Day$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(PWR2Day$TimeStamp,PWR2Day$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(PWR2Day$TimeStamp,PWR2Day$Sub_metering_2,col="Red")
lines(PWR2Day$TimeStamp,PWR2Day$Sub_metering_3,col="Blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("Black","Red","Blue"),lty=c(1,1,1),bty="n")
plot(PWR2Day$TimeStamp,PWR2Day$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()

