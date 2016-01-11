setwd("C:/Users/Amelia/Desktop/USUHS/DissProject/Data Analysis Courses
      /exdata-data-household_power_consumption")

## Read in household power consumption dataset, with only observations from 2/1/2007
## through 2/2/2007
exdata_power <- read.table("household_power_consumption.txt", sep= ";",  
                           skip = 66637,
                           nrows=2880, col.names= c("date","time","global_active_power",
                                                    "global_reactive_power","voltage",
                                                    "global_intensity","sub_metering_1", 
                                                    "sub_metering_2","sub_metering_3"))

## Change formats of the date and time variables and combine to one datetime variable
exdata_power$date <- as.Date(exdata_power$date, format="%m/%d/%Y")

dateformat <- "%Y-%d-%m %H:%M:%S"
exdata_power$datetime<-as.POSIXct(strptime(paste(exdata_power$date,
                                                 exdata_power$time,sep=" "),
                                           dateformat))

## Set up png file with specified parameters and save as plot2.png
png( file="plot2.png", width=480, height=480, units="px")

## Create plot2
plot(exdata_power$global_active_power ~ exdata_power$datetime, type="l", main="",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
