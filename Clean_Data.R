#Getting and Cleaning Data
#Reading txt as csv file
t<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(t)
#Converting char vect to date
t$Date=as.Date(t$Date,"%d/%m/%Y")
#subsetting dataets based on the cond
t<-subset(t,Date>=as.Date("2007-2-1") & Date<=as.Date("2007-2-2"))
#Removing incomplete cases

t<-t[complete.cases(t),]
dateTime<-paste(t$Date,t$Time)
dateTime<-setNames(dateTime,"DateTime")
t<-t[,!(names(t) %in% c("Date","Time"))]
t<-cbind(dateTime,t)
t$dateTime<-as.POSIXct(dateTime)
