##Plot 1

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

##Creating Plot

hist(newdata$Global_active_power, 
     col="red", 
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")


