# load data

hpc <- read.csv("household_power_consumption.txt", sep = ';')
hpc$DateTemp <- as.Date(strptime(hpc$Date, format="%d/%m/%Y")) 

hpc <- subset(hpc, hpc$DateTemp=='2007-02-01' | hpc$DateTemp=='2007-02-02')
hpc$datetime <- paste(hpc$Date, hpc$Time)

hpc$datetime <- as.POSIXct(strptime(hpc$datetime, format="%d/%m/%Y %H:%M:%S")) 

hpc$Global_active_power <- as.numeric(hpc$Global_active_power)



png("plot4.png")
par(mfrow = c(2, 2))

# plot 1
plot(
  hpc$datetime, 
  hpc$Global_active_power, 
  type='l',
  ylab = 'Global Active Power',
  xlab=""
)


plot(
  hpc$datetime, 
  hpc$Voltage, 
  type='l',
  ylab = 'Voltage',
  xlab=""
)


plot(
  hpc$datetime, 
  hpc$Sub_metering_1, 
  type='l',
  ylab = 'Energy sub metering',
  xlab="Sub_metering_1"
)
lines(
  hpc$datetime, 
  hpc$Sub_metering_2, 
  type='l',
  ylab = 'Energy sub metering',
  xlab="Sub_metering_2",
  col='red'
)

lines(
  hpc$datetime, 
  hpc$Sub_metering_3, 
  type='l',
  ylab = 'Energy sub metering',
  xlab="Sub_metering_3",
  col='blue'
)

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1:2, cex=0.8)

plot(
  hpc$datetime, 
  hpc$Global_reactive_power, 
  type='l',
  ylab = 'Global_reactive_power',
  xlab=""
)
dev.off()