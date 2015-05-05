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


# create plot 2 --> Global Active Power vs Date-Time
png(filename=paste(project1_path, "plot2.png", sep=""), width=480, height=480)
with(epc_data_wanted, {
     plot(epc_data_wanted$date_time, epc_data_wanted$Global_Active_Power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     bg = 'white')
                      }
     )
# Don't forget to close the PNG device!
dev.off() 