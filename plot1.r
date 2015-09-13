######COURSERA-Exploratory Data Analysis Course Project 1 - Plot 1
#Name: Christoph Thommen
#Date: 12.09.2015
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
#construct plot 1
##########################################
hist (analysis_data$Global_active_power, col="red",ylab="Frequency",xlab="Global Active Power (kilowatts)",main="Global Active Power")

##########################################
#save as PNG (480x480)
##########################################
dev.copy(png,file="plot1.png") 
dev.off()


