######### Course Project 1 - Explanatory data analysis ########
## Plot 2

		## read and subset dataset ##

data<-read.table("./data/household_power_consumption.txt", header=TRUE, 
	 sep=";",na = "?",
	 colClasses = c("character", "character", rep("numeric",7)))

subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]


	## convert date and time

date_time<-paste(subdata$Date,subdata$Time) #join the two columns

Newsubdata<-cbind(date_time,subdata)

Newsubdata$date_time<-strptime(Newsubdata$date_time,"%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English") #change to english language

	## Plot 2
par(bg="transparent", mar=c(6,6,5,3))
plot(Newsubdata$date_time,Newsubdata$Global_active_power, type="l", #para fazer linha
	ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,file="plot2.png",width = 480, height = 480, units = "px") #copy the plot
dev.off()

