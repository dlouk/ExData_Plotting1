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

# convert Date-Time to 'date_time' variable
epc_data_wanted$date_time <- strptime(paste(epc_data_wanted$Date, 
                                            epc_data_wanted$Time, sep=" "), 
                                      format="%d/%m/%Y %H:%M:%S") 
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

# create plot 3 --> Sub metering 1/2/3 vs Date-Time
png(filename=paste(project1_path, "plot3.png", sep=""), width=480, height=480)
with(epc_data_wanted, {
     plot(date_time, Sub_metering_1, type="l",
          ylab="Energy sub metering", xlab="", bg = 'white')
     lines(date_time, Sub_metering_2, col='Red')
     lines(date_time, Sub_metering_3, col='Blue')
                      }
     )

legend("topright",  lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue", cex=0.75)
       )
# Copy plot to a PNG file
#dev.copy(png, file = paste(project1_path, "plot3.png", sep=""), 
#         height=480, width=480)
# Don't forget to close the PNG device!
dev.off() 

