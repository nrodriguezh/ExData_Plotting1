## Set working directory
mainwd <- "C:/Users/Nahir/Documents/ExploreData"
setwd(mainwd)

## Download and unzip the file 
fileURL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, file.path(mainwd,paste("powerconsumption",".zip",sep="")))

unzip(file.path(mainwd,paste("powerconsumption",".zip",sep="")))


## After downloading the file and unzipping, load the complete dataset
data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Then subset the dataset to have the data we need
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Convert into dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Create Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save Plot 2 to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
