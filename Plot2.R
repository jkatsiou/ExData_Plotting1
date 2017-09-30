
# In order for the script to work, you need to have the dataset "household_power_consumption.txt" in your working directory.
# The Graph will be exported in your working directory as a png file : "Plot2.png"


#Read data set into data frame "dataSet"

dataSet <- read.csv("./household_power_consumption.txt", header=TRUE,sep=";",colClasses =                             c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.string =c("?"))  

# Create a new data frame "SubSetData", with data of 1/2/20007 - 2/2/2007

SubSetData  <- subset(dataSet,Date == "1/2/2007" | Date == "2/2/2007")                  

#Create a new Variable, named DateTime of Date Class , containing both Date and Time. This will be used as input (X axis) of the graph 
						        
SubSetData$DateTime <- strptime( paste(SubSetData$Date,SubSetData$Time), format =  "%d/%m/%Y %H:%M:%S")  

#Opening of png Graphics device

png(file="Plot2.png")

#Ploting of Graph. Setting of Y and X axis labels

plot(SubSetData$DateTime,SubSetData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")

#Closing of Graphics device

dev.off()





