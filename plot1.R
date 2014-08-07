# Plot1.R. A script to create a histogram of household power consumption
# First load the full set of results from the file
        filename <- "household_power_consumption.txt"  #set the file name
        thedata <- read.table(filename,sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE) #load in the data
# Second select the required dates from the file, and tidy it up
        thedata <- thedata[which(thedata[,1]=="1/2/2007"|thedata[,1]=="2/2/2007"),] #select appropriate dates
        rownames(thedata)=NULL # remove the added Rowname column
# Third create a single Datetime column and remove the two separate Date and Time character columns        
        thedata=cbind(strptime(paste(thedata$Date,thedata$Time), "%d/%m/%Y %H:%M:%S"),thedata) # Bind the combined column
        colnames(thedata)[1]="Datetime" # Name the new column
        thedata$Date=NULL # Remove Date
        thedata$Time=NULL # Remove Time
# Finally create the Histogram plot as a PNG file 
        png(filename = "plot1.png",width = 480, height = 480) # Set the graphics device to a png file
        hist(thedata$Global_active_power,main="Global Active Power",
             xlab="Global Acive Power (kilowatts", ylab="Frequency",col="Red") # Draw the histogram
        dev.off() # Close the device
        rm (filename,thedata)
