# load data

hpc <- read.csv("household_power_consumption.txt", sep = ';')
hpc$Date <- as.Date(strptime(hpc$Date, format="%d/%m/%Y")) 
hpc <- subset(hpc, hpc$Date=='2007-02-01' | hpc$Date=='2007-02-02')

hpc$Global_active_power <- as.numeric(hpc$Global_active_power)


png("plot1.png")

hist(
  hpc$Global_active_power, 
  xlab = 'Global Active Power (kilowatts)',
  ylab = 'Frequency',
  col = 'red',
  main=""
)

title('Global Active Power')

dev.off()