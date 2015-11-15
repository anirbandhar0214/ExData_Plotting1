# Read the data file
df<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?") 
# Subsettingto get data for two days
df<- subset(df, (df$Date == "1/2/2007" | df$Date== "2/2/2007"))  
# Generate Plot1 
png("plot1.png", width=480, height= 480) 
hist(df$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power") 
dev.off()


