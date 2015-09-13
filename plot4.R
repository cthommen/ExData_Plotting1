######COURSERA-Exploratory Data Analysis Course Project 1 - Plot 4
#Name: Christoph Thommen
#Date: 13.09.2015
#Data: Electric Power Consumption (Measurements of electric power 
# consumption in one household with a one-minute sampling rate over 
# a period of almost 4 years. Different electrical quantities and 
# some sub-metering values are available.)

##########################################
#data import and getting the right data
##########################################
#data import
power_data=read.table("household_power_consumption.txt",sep=";",header=T)

#subset of 1/2/2007 to 2/2/2007
analysis_data=power_data[power_data$Date %in% c("1/2/2007","2/2/2007"),]

#adjust scale of global active power
analysis_data$Global_active_power=as.numeric(analysis_data$Global_active_power)/500

##########################################
#construct plot 4
##########################################
#edit date format and add weekdays
analysis_data$Date=as.character(analysis_data$Date)
analysis_data$Time=as.character(analysis_data$Time)
analysis_data$data_time=paste(analysis_data$Date,analysis_data$Time,sep=" ")
analysis_data$data_time_2=strptime(analysis_data$data_time,"%d/%m/%Y %H:%M:%S")

#define device
par(mfrow=c(2,2))

#plot 1
plot(analysis_data$data_time_2,analysis_data$Global_active_power,pch="",col="black",xlab="",ylab="Global Active Power (kilowatts)",main="")
lines(analysis_data$data_time_2,analysis_data$Global_active_power)

#plot 2
plot(analysis_data$data_time_2,analysis_data$Voltage,pch="",xlab="datetime",ylab="Voltage",main="")
lines(analysis_data$data_time_2,analysis_data$Voltage)

#plot 3
plot(analysis_data$data_time_2,analysis_data$Sub_metering_1,pch="",xlab="",ylab="Energy sub metering",main="")
lines(analysis_data$data_time_2,analysis_data$Sub_metering_1)
lines(analysis_data$data_time_2,analysis_data$Sub_metering_2,col="red")
lines(analysis_data$data_time_2,analysis_data$Sub_metering_3,col="blue")
legend("topright",lty=1, col = c("black", "red", "blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot 4
plot(analysis_data$data_time_2,analysis_data$Global_reactive_power,pch="",xlab="datetime",ylab="Global_reactive_power",main="")
lines(analysis_data$data_time_2,analysis_data$Global_reactive_power)

##########################################
#save as PNG (480x480)
##########################################
dev.copy(png,file="plot4.png") 
dev.off()
