
# In order for the script to work, you need to have the dataset "household_power_consumption.txt" in your working directory.
# The Graph will be exported in your working directory as a png file : "Plot4.png"


#Read data set into data frame "dataSet"

dataSet <- read.csv("./household_power_consumption.txt", header=TRUE,sep=";",colClasses =                             c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.string =c("?"))  

# Create a new data frame "SubSetData", with data of 1/2/20007 - 2/2/2007

SubSetData  <- subset(dataSet,Date == "1/2/2007" | Date == "2/2/2007")                  

#Create a new Variable, named DateTime of Date Class , containing both Date and Time. This will be used as input (X axis) of the graph 

SubSetData$DateTime <- strptime( paste(SubSetData$Date,SubSetData$Time), format =  "%d/%m/%Y %H:%M:%S")  #Convert Time Variable to Time type

#Opening of Graphics device

png(file="./Plot4.png")

#Setting Number of Columns and Rows for the Graphics device

par(mfcol=c(2,2))

#Ploting of 1st line Chart  (var Global_active_power)

plot(SubSetData$DateTime,SubSetData$Global_active_power, type = "l", ylab = "Global Active Power", xlab ="")

#Ploting of 2nd line Chart  (var Sub_metering_1)

plot(SubSetData$DateTime,SubSetData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab ="", col = "grey")

#Annotation of 2nd line Chart  with line of var Sub_metering_2

lines(SubSetData$DateTime,SubSetData$Sub_metering_2, type = "l", xlab ="", col = "red")

#Annotation of 2nd line Chart  with line of var Sub_metering_3

lines(SubSetData$DateTime,SubSetData$Sub_metering_3, type = "l", xlab ="", col = "blue")

#Annotation of Graph with legend

legend("topright",c("Sub metering 1","Sub metering 2","Sub metering 3"),lty=c(1,1),lwd=c(2.5,2.5,2.5),col=c("grey","red","blue"), box.lty=0 )

#Ploting of 3rd line Chart  (var voltage)

plot(SubSetData$DateTime,SubSetData$Voltage, type = "l", ylab = "Voltage", xlab="datetime")

#Ploting of 4th line Chart  (var Global relative power)

plot(SubSetData$DateTime,SubSetData$Global_reactive_power, type = "l", ylab = "Global_reative_power", xlab="datetime")

#CLosing of graphics device

dev.off()



