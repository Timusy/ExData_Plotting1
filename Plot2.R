##Plot 2
with(t,plot(Global_active_power~dateTime,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()