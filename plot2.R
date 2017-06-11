# Read data
d <- read.table("data/household_power_consumption.txt" , sep = ";",
                stringsAsFactors = FALSE , header = TRUE,na.strings = "?",
                colClasses = c("character" , "character" , "numeric" , "numeric" , "numeric" ,"numeric","numeric","numeric","numeric"))
# Select subset (1st and 2nd Feb 2007)
p_data_feb = d[d$Date == "1/2/2007" | d$Date == "2/2/2007",]
p_data_feb$Date <- as.Date(p_data_feb$Date, "%d/%m/%Y")

# Init png and plot hist
png("plot2.png", width = 480, height = 480)
plot(1:nrow(p_data_feb), p_data_feb$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt = "n", yaxt = "n")
axis(1, at=c(1, 60*24+1, 2*60*24+1), labels=c("Thu", "Fri", "Sat"))
axis(2, at=c(0,2,4,6), labels=c("0", "2", "4", "6"))
# Finalize
dev.off()
