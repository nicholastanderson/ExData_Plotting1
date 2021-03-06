setwd("C:/Users/nicholas.anderson/Documents/R/ExploratoryDataAnalysis/Project1/ExData_Plotting1")
downloadFile<-FALSE
if(downloadFile){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","dataset.zip")
  unzip("dataset.zip")
}
data<-read.delim("household_power_consumption.txt",sep=";")
data[,1]<-as.Date(data[,1],"%d/%m/%Y")
data<-filter(data,Date=='2007-02-01'|Date=='2007-02-02')
data[,"DateTime"]<-paste(data$Date,data$Time)
data$DateTime<-strptime(data$DateTime,format="%Y-%m-%d %H:%M:%S")
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()