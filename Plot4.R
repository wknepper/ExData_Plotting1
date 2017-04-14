##plot4

##Reading data in from csv
library(readr)
data <- read_delim("~/Documents/RWorking/Exploratory Data Analysis (Class 4)/Assignment1/household_power_consumption.txt", 
                   ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                Global_active_power = col_number(), 
                                                                Global_intensity = col_number(), 
                                                                Global_reactive_power = col_number(), 
                                                                Sub_metering_1 = col_number(), Sub_metering_2 = col_number(), 
                                                                Sub_metering_3 = col_number(), Time = col_time(format = "%H:%M:%S"), 
                                                                Voltage = col_number()), na = "?", 
                   trim_ws = TRUE)
##subsetting data for two-day period
newdata <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

## merging date and time columns into new column
datetime <- paste(as.Date(newdata$Date), newdata$Time)
newdata$Datetime <- as.POSIXct(datetime)

##creating plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(newdata, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})