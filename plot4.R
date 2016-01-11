setwd("C:/Users/Data Analysis Courses
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

## Initiate png file with specified parameters, save as plot4.png
png( file="plot4.png", width=480, height=480, units="px")

## specify positions of plots
setpar<- par(mfcol=c(2,2))  

## First plot
plot(exdata_power$global_active_power ~ exdata_power$datetime, type="l",
     xlab="", ylab="Global Active Power")

## Second plot
plot(exdata_power$sub_metering_1 ~ exdata_power$datetime, xlab="", 
     ylab="Energy sub metering", pch=15, type="l")
points(exdata_power$sub_metering_3 ~ exdata_power$datetime, col="blue",
       pch=15, type="l")
points(exdata_power$sub_metering_2 ~ exdata_power$datetime, col="red",
       pch=15, type="l")
legend(x='topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n", lty=1, col=c("black", "red", "blue"))

## Third plot
plot(exdata_power$voltage ~ exdata_power$datetime, ylab="Voltage", 
     xlab="datetime", pch=15, type="l")

## Fourth plot
plot(exdata_power$global_reactive_power ~ exdata_power$datetime, xlab="datetime",
     ylab="Gobal_reactive_power", type="l", pch=15, lwd=1, col="black")
par(setpar)
dev.off()
