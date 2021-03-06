# Read data
d <- read.table("data/household_power_consumption.txt" , sep = ";",
                stringsAsFactors = FALSE , header = TRUE,na.strings = "?",
                colClasses = c("character" , "character" , "numeric" , "numeric" , "numeric" ,"numeric","numeric","numeric","numeric"))
# Select subset (1st and 2nd Feb 2007)
p_data_feb = d[d$Date == "1/2/2007" | d$Date == "2/2/2007",]
p_data_feb$Date <- as.Date(p_data_feb$Date, "%d/%m/%Y")

# Init png and plot hist
png("plot3.png", width = 480, height = 480)
plot(1:nrow(p_data_feb), p_data_feb$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", xaxt = "n", yaxt = "n", ylim=c(0,40))
lines(1:nrow(p_data_feb), p_data_feb$Sub_metering_2, ylim=c(0,40), col="red")
lines(1:nrow(p_data_feb), p_data_feb$Sub_metering_3, ylim=c(0,40), col="blue")
axis(1, at=c(1, 60*24+1, 2*60*24+1), labels=c("Thu", "Fri", "Sat"))
axis(2, at=c(0,10,20,30), labels=c("0", "10", "20", "30"))
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'))
# Finalize
dev.off()
