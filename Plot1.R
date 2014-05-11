library(datasets)

load("dat_ass.RData")
x<- as.numeric(as.vector(dat_obj$Global_active_power))

with(dat_obj, hist(x, main="Global Activity Power", xlab="Global Active Power (kilowatts)", col ="red"))

png("Plot1.png", width=480, height=480)
with(dat_obj, hist(x, main="Global Activity Power", xlab="Global Active Power (kilowatts)", col ="red"))
dev.off()

#dev.copy(png, file="plot1.png")
#dev.off()

