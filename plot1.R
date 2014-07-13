plot1<-function(){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="./householdpower.zip",method="curl")
    unzip(householdpower.zip)
    power<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactor=FALSE,na.strings="?")
    power$Date<-as.Date(power$Date,format="%d/%m/%Y")
    subdata <- subset(power, power$Date >= as.Date("2007-02-01") & power$Date <=as.Date("2007-02-02"))
    hist(subdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(Kilowatts)")
    dev.copy(png,file="plot1.png")
}



