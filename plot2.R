#Read the data file
df<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?") 
# Subsetting to get data for two days  
df<- subset(df, (df$Date == "1/2/2007" | df$Date== "2/2/2007"))  
# Modify date format 
df$Date <- as.Date(df$Date, format = "%d/%m/%Y") 
df$DateTime <- as.POSIXct(paste(df$Date, df$Time)) 
# Generate Plot2 
png("plot2.png", width=480, height= 480) 
plot(df$DateTime, df$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 
dev.off() 

