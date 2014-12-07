#The follwing is the algorithm used to creat plot2:-
#Read data file with the first row as column names
#Convert Date column into date formate
#Subset the desired dates into new data frame
#Open png graphical device and make the plot

data <- read.table("household_power_consumption.txt", header = T, sep = ";")
data$Date <- as.Date(data$Date, format="%Y-%m-%d")
df <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
png(filename = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.off()