# File locations:
# own "education" directory
edu_path <- "C:/Users/Louk/Desktop/dlouk/education/"
# Exploratory Data Analysis (EDA) directory
eda_path <- paste(edu_path, "onlineCourses/Exploratory_Data_Analysis/", sep="")
# project 1 directory
project1_path <- paste(eda_path, "project1/", sep="")

# load Electric Power Consumption dataset
epc_data <- read.table(paste(project1_path, "household_power_consumption.txt",
                             sep=""), sep=";", header=TRUE, na.strings='?', 
                       stringsAsFactors=FALSE)

# keep data from 2007-02-01 to 2007-02-02
epc_data_wanted <- epc_data[epc_data$Date=="1/2/2007" | 
                                epc_data$Date=="2/2/2007", ]
# delete original dataset
rm(epc_data)


# convert Date-Time variables to 'date_time' variable
epc_data_wanted$date_time <- strptime(paste(epc_data_wanted$Date, 
                                            epc_data_wanted$Time, sep=" "), 
                                      format="%d/%m/%Y %H:%M:%S") 
# convert Global_active_power variable to numeric class
epc_data_wanted$Global_Active_Power <- as.numeric(
                                        epc_data_wanted$Global_active_power
                                                 )
# convert Sub_metering_1 variable to numeric class
epc_data_wanted$Sub_metering_1 <- as.numeric(
                                    epc_data_wanted$Sub_metering_1
                                            )
# convert Sub_metering_2 variable to numeric class
epc_data_wanted$Sub_metering_2 <- as.numeric(
                                    epc_data_wanted$Sub_metering_2
                                            )
# convert Sub_metering_3 variable to numeric class
epc_data_wanted$Sub_metering_3 <- as.numeric(
                                    epc_data_wanted$Sub_metering_3
                                            )
# convert Sub_metering_3 variable to numeric class
epc_data_wanted$Sub_metering_3 <- as.numeric(
                                    epc_data_wanted$Sub_metering_3
                                            )
# convert Global_reactive_power variable to numeric class
epc_data_wanted$Global_reactive_power <- as.numeric(
                                        epc_data_wanted$Global_reactive_power
                                                   )
# convert Voltage variable to numeric class
epc_data_wanted$Voltage <- as.numeric(epc_data_wanted$Voltage)


# create plot 4
par(mfrow = c(2, 2))

with(epc_data_wanted, {
    # plot 1
    plot(date_time, Global_active_power, 
         type="l", ylab="Global Active Power (kilowatts)", xlab="")
    # plot 2
    plot(date_time, Voltage, type="l", ylab="Voltage", xlab="datetime")
    # plot 3
    plot(date_time, Sub_metering_1, 
         type="l", ylab="Energy sub metering", xlab="")
    lines(date_time, Sub_metering_2, col='Red')
    lines(date_time, Sub_metering_3, col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    # plot 4
    plot(date_time, Global_reactive_power, 
         type="l", ylab="Global_Reactive_Power",xlab="")
                     }
    )

# Copy plot to a PNG file
dev.copy(png, file = paste(project1_path, "plot4.png", sep=""), 
         height=480, width=480)
# Don't forget to close the PNG device!
dev.off() 
