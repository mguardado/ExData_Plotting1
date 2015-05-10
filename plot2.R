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

png(filename="plot2.png",width=480,height=480,units="px")
with(df,plot(datetime,Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()