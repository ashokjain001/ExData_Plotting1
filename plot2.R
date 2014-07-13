plot2<-function(){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./householdpower.zip",method="curl")
    unzip(householdpower.zip)
    power <- read.table("household_power_consumption.txt", comment.char= "", sep= ";", na.strings= "?", skip= 66600, n= 3000,stringsAsFactor=FALSE)
    subdata <- subset(power, as.Date(V1) == '01/02/2007' | as.Date(V1) == '02/02/2007')   
    date.time<-paste(subdata$V1,subdata$V2)
    dt <- strptime(date.time, "%d/ %m/ %Y %H: %M: %S")
    plot(dt, subset$V3,xlab=" ", ylab= "Global Active Power (kilowatts)", type= "l")
    dev.copy(png,file="plot2.png")
}