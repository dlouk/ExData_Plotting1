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

# create plot 1 --> histogram of Global Active Power
hist(epc_data_wanted$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red"
     )
# Copy plot to a PNG file
dev.copy(png, file = paste(project1_path, "plot1.png", sep=""), 
         height=480, width=480)
# Don't forget to close the PNG device!
dev.off() 
