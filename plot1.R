# Read data
d <- read.table("data/household_power_consumption.txt" , sep = ";",
                stringsAsFactors = FALSE , header = TRUE,na.strings = "?",
                colClasses = c("character" , "character" , "numeric" , "numeric" , "numeric" ,"numeric","numeric","numeric","numeric"))

# Select subset (1st and 2nd Feb 2007)
p_data_feb = d[d$Date == "1/2/2007" | d$Date == "2/2/2007",]

# Init png and plot hist
png("plot1.png", width = 480, height = 480)
hist(as.numeric(p_data_feb$Global_active_power), xlab="Global Active Power", col="red", main="Global Active Power")

# Finalize
dev.off()
