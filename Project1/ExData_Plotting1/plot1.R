                # Script for first plot

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

        # Plot data

dataForPlot <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(dataForPlot, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()