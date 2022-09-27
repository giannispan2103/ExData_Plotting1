# load data

hpc <- read.csv("household_power_consumption.txt", sep = ';')
hpc$DateTemp <- as.Date(strptime(hpc$Date, format="%d/%m/%Y")) 

hpc <- subset(hpc, hpc$DateTemp=='2007-02-01' | hpc$DateTemp=='2007-02-02')
hpc$datetime <- paste(hpc$Date, hpc$Time)

hpc$datetime <- as.POSIXct(strptime(hpc$datetime, format="%d/%m/%Y %H:%M:%S")) 

hpc$Global_active_power <- as.numeric(hpc$Global_active_power)



png("plot2.png")

plot(
  hpc$datetime, 
  hpc$Global_active_power, 
  type='l',
  ylab = 'Global Active Power (kilowatts)',
  xlab=""
  )


dev.off()