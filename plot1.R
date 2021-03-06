#put the dataset in R working directory
original_dataset<-read.table ("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

#copy the dataframe
w1<-original_dataset

#another copy more explicit
w2<-data.frame(w1["Date"],w1["Time"],w1["Global_active_power"],w1["Global_reactive_power"],w1["Voltage"],w1["Global_intensity"],w1["Sub_metering_1"],w1["Sub_metering_2"],w1["Sub_metering_3"])

#concatenate date and time
w2$DateTime <- paste(w1$Date,w1$Time)

#adding a row with DateTime not as character
w2$DateTimeConvert <- strptime(w2$DateTime,format="%d/%m/%Y %H:%M:%S")


#adding a row with Date (data type)
w2$DateConvert <- as.Date(strptime(w2$DateTime,format="%d/%m/%Y %H:%M:%S"))

#subset for the exercice
w3<-subset(w2,w2$DateConvert >="2007-02-01" & w2$DateConvert <= "2007-02-02")
 hist(w3$Global_active_power, col = "red" ,main="Plot 1:Global Active Power",xlab="Global Active Power (Kilowatts)", ylab="Frequency")

