# In order for the script to work, you need to have the dataset "household_power_consumption.txt" in your working directory.
# The Graph will be exported in your working directory as a png file : "Plot1.png"


#Read data set into data frame "dataSet"

dataSet <- read.csv("./household_power_consumption.txt", header=TRUE,sep=";",colClasses =                             c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.string =c("?"))  #Read data into dataSet

# Create a new data frame "SubSetData", with data of 1/2/20007 - 2/2/2007

SubSetData  <- subset(dataSet,Date == "1/2/2007" | Date == "2/2/2007")                           

#Open the graphics device

png(file ="./Plot1.png")

# Ploting of histogram , setting of bin color and x axis label

with(SubSetData,hist(Global_active_power,main="Global Active Power", col = "Red", xlab = "Global Active Power (kilowatts)"))

# Closing of graphics device 

dev.off()

