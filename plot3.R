plot3<-function(){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./householdpower.zip",method="curl")
    unzip(householdpower.zip)
    power <- read.table("household_power_consumption.txt", comment.char= "", sep= ";", na.strings= "?", skip= 66600, n= 3000,stringsAsFactor=FALSE)
    subdata <- subset(power, as.Date(V1) == '01/02/2007' | as.Date(V1) == '02/02/2007')   
    date.time<-paste(subdata$V1,subdata$V2)
    dt <- strptime(date.time, "%d/ %m/ %Y %H: %M: %S")
    with(subset,{
        plot(dt,subset$V7,type="l",xlab=" ",ylab="Energy sub metering")
        lines(dt,subset$V8,type="l",xlab=" ",ylab="Energy sub metering",col="red")
        lines(dt,subset$V9,type="l",xlab=" ",ylab="Energy sub metering",col="blue")
    })
    legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),text.font=1,lty=1)
    dev.copy(png,file="plot3.png")
}