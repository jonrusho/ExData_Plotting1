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

# convert global active power to numeric
ndat$Global_active_power <- as.numeric(as.character(ndat$Global_active_power))

# open png file
png(file="plot1.png",width=480,height=480,units="px")


# create histogram
hist(ndat$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",xlim=c(0,6),ylim=c(0,1200),main="Global Active Power",xaxt='n')

axis(side=1, at=seq(0,6,2),labels=seq(0,6,2))



