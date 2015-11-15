#Read the data file
df<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?") 
# Subset to get data for two days
df<- subset(df, (df$Date == "1/2/2007" | df$Date== "2/2/2007"))  
# Modify date format 
df$Date <- as.Date(df$Date, format = "%d/%m/%Y") 
df$DateTime <- as.POSIXct(paste(df$Date, df$Time)) 
# Generate Plot4 
png("plot4.png", width = 480, height = 480) 
# Divide the plotting device into four subplots 
par(mfrow=c(2,2))  
# top left part
plot(df$DateTime, df$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")  
# top right part
plot(df$DateTime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")    
# bottom left part
plot(df$DateTime, df$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="") 
lines(df$DateTime, df$Sub_metering_2, type="l", col="red") 
lines(df$DateTime, df$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue"))  
# bottom right part
plot(df$DateTime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")   
dev.off() 





