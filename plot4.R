## code for reading the data

df <- read.table(
  "household_power_consumption.txt",
  sep=";",
  col.names=c("Date", "Time", 
              "Global_active_power", 
              "Global_reactive_power", 
              "Voltage", "Global_intensity",
              "Sub_metering_1",
              "Sub_metering_2",
              "Sub_metering_3"),
  skip=66637, ##starts at 66638, it ends at 69516
  nrows=2880)

df$datetime <- paste(as.character(df[,1]),as.character(df[,2]))

df$datetime <- strptime(df$datetime,"%d/%m/%Y %H:%M:%S")

## code that creates the PNG file

png(filename="plot4.png",width=480,height=480,units="px")

##plot 1 - top left
par(mfcol = c(2, 2), mar = c(5, 4, 2, 1))
with(df,plot(datetime,Global_active_power,type="l", ylab="Global Active Power", xlab=""))

##plot 2 - bottom left
with(df,plot(datetime,Sub_metering_1,type="l", ylab="Energy sub metering", xlab=""))
with(df,lines(datetime,Sub_metering_2,col="red"))
with(df,lines(datetime,Sub_metering_3,col="blue"))
legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##plot 3 - top right
with(df,plot(datetime,Voltage,type="l", ylab="Voltage"))

##plot 4 - bottom right
with(df,plot(datetime,Global_reactive_power,type="l"))

dev.off()