## Read File
EPConsumption <- read.table("household_power_consumption.txt", header = TRUE, skip=1, sep=";")

## Name Columns
names(EPConsumption) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Subset Data 
EPC1 <- subset(EPConsumption, EPConsumption$Date=="1/2/2007" | EPConsumption$Date =="2/2/2007")

## Convert Dates
EPC1$Date <- as.Date(EPC1$Date, format="%d/%m/%Y")
EPC1$Time <- strptime(EPC1$Time, format="%H:%M:%S")
EPC1[1:1440,"Time"] <- format(EPC1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
EPC1[1441:2880,"Time"] <- format(EPC1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##Construct Plot
plot(EPC1$Time,as.numeric(as.character(EPC1$Sub_metering_1)), type="n", xlab="",ylab="Energy sub metering")
with(EPC1,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(EPC1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(EPC1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.6)

##Save as png 
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()


