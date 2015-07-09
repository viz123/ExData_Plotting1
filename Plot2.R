myData<-read.csv("household_power_consumption.txt",
                 header=TRUE,
                 sep=";", 
                 comment.char = "",
                 stringsAsFactors=FALSE)

myData$Date<-as.Date(myData$Date,"%d/%m/%Y")
myData<-myData[(myData$Date=="2007-02-01")|(myData$Date=="2007-02-02"),]
myData$Time<-strptime(paste(myData$Date,myData$Time),"%Y-%m-%d %T")

myData$Global_active_power<-as.numeric(myData$Global_active_power)

png(file = "Plot2.png",
    width=480,
    height=480,
    units="px",
    bg = "transparent")

plot(myData$Time,myData$Global_active_power,
     ylab="Global Active Power (kilowatts)",
     xlab="",
     type="l")

dev.off()
