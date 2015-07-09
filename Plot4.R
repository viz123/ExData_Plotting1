myData<-read.csv("household_power_consumption.txt",
                 header=TRUE,
                 sep=";", 
                 comment.char = "",
                 stringsAsFactors=FALSE)

myData$Date<-as.Date(myData$Date,"%d/%m/%Y")
myData<-myData[(myData$Date=="2007-02-01")|(myData$Date=="2007-02-02"),]
myData$Time<-strptime(paste(myData$Date,myData$Time),"%Y-%m-%d %T")

myData$Global_active_power<-as.numeric(myData$Global_active_power)
myData$Global_reactive_power<-as.numeric(myData$Global_reactive_power)
myData$Voltage<-as.numeric(myData$Voltage)
myData$Sub_metering_1<-as.numeric(myData$Sub_metering_1)
myData$Sub_metering_2<-as.numeric(myData$Sub_metering_2)
myData$Sub_metering_3<-as.numeric(myData$Sub_metering_3)

png(file = "Plot4.png",
    width=480,
    height=480,
    units="px",
    bg = "transparent")

par(mfrow=c(2,2))
par(mar=c(3,4,1,2))
par(ps=14)
#
plot(myData$Time,myData$Global_active_power,
     ylab="Global Active Power (kilowatts)",
     xlab="",
     type="l")

#
plot(myData$Time,myData$Voltage,
     ylab="Voltage",
     xlab="datetime",
     type="l")

#
plot(myData$Time,myData$Sub_metering_1, ylab="Energy sub metering",
     xlab="",
     type="l")

lines(myData$Time,myData$Sub_metering_2,type="l", col="red")
lines(myData$Time,myData$Sub_metering_3,type="l", col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), 
       col=c("black","red","blue"),
       bty="n")

#
plot(myData$Time,myData$Global_reactive_power,
     ylab="Global_reactive_power",
     xlab="datetime",
     type="l")

dev.off()
