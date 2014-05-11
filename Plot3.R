library(datasets)
library(zoo)

load("dat_ass.RData")
x<- as.numeric(as.vector(dat_obj$Sub_metering_1))
y<- as.numeric(as.vector(dat_obj$Sub_metering_2))
z<- as.numeric(as.vector(dat_obj$Sub_metering_3))
S_met <- as.matrix(cbind(x,y,z))

DT_series <- strptime(paste(dat_obj$Date, dat_obj$Time), "%Y-%m-%d %H:%M:%S")
Tser <- zoo(S_met, order.by=DT_series)

with(dat_obj, plot(Tser, screens=1, col = c("black", "red", "blue"), xlab=" ", ylab="Energy Sub Metering"))
    legend("topright", c("Sub_metering_1          ", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=0.5, cex=0.8, xjust=0)

dev.copy(png, file="Plot3.png", width=480, height=480)
dev.off()
