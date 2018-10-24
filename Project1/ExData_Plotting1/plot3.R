                # Script for third plot

        # First of all data should be downloaded if it is not on project.

path <- file.path(getwd(),"compressed_data.zip")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (!file.exists(path)) {
        download.file(url, path)
        unzip(path)
}


        # Then data should be readed

fileData <- paste0(getwd(),"/household_power_consumption.txt")
data <- read.table(fileData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


        # Date is formated and only "2007-02-01" and "2007-02-02" data is selected

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date == "2007-02-01" | Date =="2007-02-02")

        # Convert dates and times to POSIXct class

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

        # Plot it and save it in a png file

plot(data$Sub_metering_1 ~ data$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$datetime, col = "Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()