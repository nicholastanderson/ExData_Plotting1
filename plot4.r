setwd("C:/Users/nicholas.anderson/Documents/R/ExploratoryDataAnalysis/Project1/ExData_Plotting1")
downloadFile<-TRUE
if(downloadFile){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","dataset.zip")
  unzip("dataset.zip")
}
data<-read.delim("household_power_consumption.txt",sep=";")
data[,1]<-as.Date(data[,1],"%d/%m/%Y")
data<-filter(data,Date=='2007-02-01'|Date=='2007-02-02')
data[,"DateTime"]<-paste(data$Date,data$Time)
data$DateTime<-strptime(data$DateTime,format="%Y-%m-%d %H:%M:%S")
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))
data$Voltage<-as.numeric(as.character(data$Voltage))
par(mfrow=c(2,2))
plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power",cex.axis=.7,cex.lab=.7)
plot(data$DateTime,data$Voltage,type="l",xlab="datetime",ylab="Voltage",cex.axis=.7,cex.lab=.7)
plot(data$DateTime,data$Sub_metering_1,type="l" ,ylab="Energy sub metering",xlab="",cex.axis=.7,cex.lab=.7)
lines(data$DateTime,y=data$Sub_metering_2,col="red")
lines(data$DateTime,y=data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=.75,bty="n")
plot(data$DateTime,data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",cex.axis=.7,cex.lab=.7)
dev.copy(png,"plot4.png",width=480,height=480)
dev.off()
