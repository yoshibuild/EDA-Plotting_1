library(datasets)
library(zoo)

load("dat_ass.RData")
x<- as.numeric(as.vector(dat_obj$Global_active_power))

DT_series <- strptime(paste(dat_obj$Date, dat_obj$Time), "%Y-%m-%d %H:%M:%S")
Tser <- zoo(x, order.by=DT_series)
with(dat_obj, plot(Tser, xlab=" ", ylab="Global Active Power (kilowatts)"))

dev.copy(png, file="Plot2.png", width=480, height=480)
dev.off()
