# read in original dataset
edat <- read.csv2("household_power_consumption.txt")
# convert date field to actual date
edat$Date <- as.Date(edat$Date,"%d/%m/%Y")

#subset by date
ndat <- subset(edat,edat$Date=="2007-02-01" | edat$Date=="2007-02-02")
# remove original data
rm(edat)

# create date/time field & convert it
ndat$Datetime <- paste(ndat$Date,ndat$Time,sep=" ")

ndat$Datetime <- strptime(ndat$Datetime,"%Y-%m-%d %H:%M:%S")

# convert values to numeric
ndat$Sub_metering_1 <- as.numeric(as.character(ndat$Sub_metering_1))
ndat$Sub_metering_2 <- as.numeric(as.character(ndat$Sub_metering_2))
ndat$Sub_metering_3 <- as.numeric(as.character(ndat$Sub_metering_3))
ndat$Voltage <- as.numeric(as.character(ndat$Voltage))
ndat$Global_reactive_power <- as.numeric(as.character(ndat$Global_reactive_power))
ndat$Global_active_power <- as.numeric(as.character(ndat$Global_active_power))


# open png file
png(file="plot4.png",width=480,height=480,units="px")

# setup 2x2 matrix
par(mfrow=c(2,2))


#create plot
#active power plot
plot(ndat$Global_active_power,type='l',ylab="Global Active Power",xaxt='n',xlab="")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

#voltage plot
plot(ndat$Voltage,type='l',ylab="Voltage",xaxt='n',xlab="datetime")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

#submetering plot
plot_colors <- c("black","red","blue")
plot(ndat$Sub_metering_1,type='l',col=plot_colors[1],xaxt='n',xlab="",ylab="Energy sub metering")
lines(ndat$Sub_metering_2,type='l',col=plot_colors[2])
lines(ndat$Sub_metering_3,type='l',col=plot_colors[3])

# add legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=plot_colors,lty=1,bty="n")

# add x axis labels

axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))


plot(ndat$Global_reactive_power,type='l',ylab="Golbal_reactive_power",xaxt='n',xlab="datetime")
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))



