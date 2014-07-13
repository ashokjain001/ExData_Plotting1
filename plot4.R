par(mfrow=c(2,2))
plot(dt, subset$V3,xlab=" ", ylab= "Global Active Power", type= "l")

plot(dt, subset$V5,xlab="datetime", ylab= "Voltage", type= "l")

with(subset,{
    plot(dt,subset$V7,type="l",xlab=" ",ylab="Energy sub metering")
    lines(dt,subset$V8,type="l",xlab=" ",ylab="Energy sub metering",col="red")
    lines(dt,subset$V9,type="l",xlab=" ",ylab="Energy sub metering",col="blue")
})
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.font=1,lty=1,bty="n")

plot(dt, subset$V4,xlab="datetime", ylab= "Global_reactive_power", type= "l")

dev.copy(png,file="plot4.png")