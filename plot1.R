## Read File
EPConsumption <- read.table("household_power_consumption.txt", header = TRUE, skip=1, sep=";")

## Name Columns
names(EPConsumption) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Subset Data 
EPC1 <- subset(EPConsumption, EPConsumption$Date=="1/2/2007" | EPConsumption$Date =="2/2/2007")

## Creating Historgram  
hist(as.numeric(as.character(EPC1$Global_active_power)), col = "red", main="Global Active Power",xlab="Global Active Power(kilowatts)")

## Copy Plot to PNG
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()