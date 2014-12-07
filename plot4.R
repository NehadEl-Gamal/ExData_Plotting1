data <- read.table("household_power_consumption.txt", header = T, sep = ";")
data$Date <- as.Date(data$Date, format="%Y-%m-%d") 
df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),] #Subset the data by dates
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)),"%d/%m/%Y %H:%M:%S") #Creat new column wuth date and time values mereged together and convert the class of the column to POSIXct
df$Global_active_power <- as.numeric(as.character(df$Global_active_power)) #Convert df columns to numeric
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

png(filename = "plot4.png")
par(mfrow=c(2,2))

plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1), bty="n") #bty="n" removes the legend box

plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()