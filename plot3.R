#Read the data file
df<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?") 
# Subsetting to get data for two days 
df<- subset(df, (df$Date == "1/2/2007" | df$Date== "2/2/2007"))  
# Modify date format 
df$Date <- as.Date(df$Date, format = "%d/%m/%Y") 
df$DateTime <- as.POSIXct(paste(df$Date, df$Time)) 
# Generate Plot3 
png("plot3.png", width = 480, height = 480) 
plot(df$DateTime, df$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="") 
lines(df$DateTime, df$Sub_metering_2, type="l", col="red") 
lines(df$DateTime, df$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue")) 
dev.off() 



