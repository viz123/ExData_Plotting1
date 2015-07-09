myData<-read.csv("household_power_consumption.txt",
                    header=TRUE,
                    sep=";", 
                    comment.char = "",
                    stringsAsFactors=FALSE)

myData$Date<-as.Date(myData$Date,"%d/%m/%Y")
myData<-myData[(myData$Date=="2007-02-01")|(myData$Date=="2007-02-02"),]
myData$Time<-strptime(myData$Time,"%T")

myData$Global_active_power<-as.numeric(myData$Global_active_power)

png(file = "Plot1.png",
    width=480,
    height=480,
    units="px",
    bg = "transparent")

hist(myData$Global_active_power, 
     ylim=c(0,1200),
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     ylab="Frequncy", 
     col="red")

dev.off()
