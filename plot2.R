
data <- read.table("household_power_consumption.txt", header = T, sep = ";")
data$Date <- as.Date(data$Date, format="%Y-%m-%d") 
df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),] #Subset the data by dates
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)),"%d/%m/%Y %H:%M:%S") #Creat new column wuth date and time values mereged together and convert the class of the column to POSIXct
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

png(filename = "plot2.png") 
plot(df$timestamp, df$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()