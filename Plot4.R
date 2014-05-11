library(datasets)
library(zoo)

load("dat_ass.RData")

#datetime production
DT_series <- strptime(paste(dat_obj$Date, dat_obj$Time), "%Y-%m-%d %H:%M:%S")
Tser <- zoo(x, order.by=DT_series)

#Plot2_data
x2<- as.numeric(as.vector(dat_obj$Global_active_power))

#Plot3_data
x<- as.numeric(as.vector(dat_obj$Sub_metering_1))
y<- as.numeric(as.vector(dat_obj$Sub_metering_2))
z<- as.numeric(as.vector(dat_obj$Sub_metering_3))
S_met <- as.matrix(cbind(x,y,z))

#Plot5_data
x5<- as.numeric(as.vector(dat_obj$Voltage))

#Plot6_data
x6<- as.numeric(as.vector(dat_obj$Global_reactive_power))

#Dividing a graphic window.
par(mfrow=c(2,2))

#Plotting four profile.
Tser <- zoo(x2, order.by=DT_series)
with(dat_obj, plot(Tser, xlab=" ", ylab="Global Active Power (kilowatts)"))

Tser <- zoo(x5, order.by=DT_series)
with(dat_obj, plot(Tser, xlab="datetime", ylab="Voltage"))

Tser <- zoo(S_met, order.by=DT_series)
with(dat_obj, plot(Tser, screens=1, col = c("black", "red", "blue"), xlab=" ", ylab="Energy Sub Metering"))
legend("topright", c("Sub_metering_1          ", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=0.5, box.lty=0, cex=0.8, x.intersp=0.5)
box(which="plot", lty="solid")

Tser <- zoo(x6, order.by=DT_series)
with(dat_obj, plot(Tser, xlab="datetime", ylab="Global reactive power"))

dev.copy(png, file="Plot4.png", width=480, height=480)
dev.off()
