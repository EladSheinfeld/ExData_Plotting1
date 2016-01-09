# Read the file. the seperator is semicolon and "?" is used for NA values. 
df <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE,sep=";",header = TRUE,na.strings = "?");

# Fix the time and date fields
df$Time <- format(df$Time, format="%H:%M");
df$Date <- as.Date(x=df$Date, format ="%d/%m/%Y");

# subset to the needed data
df <- subset(df,Date >= '2007-02-01' & Date <= '2007-02-02' );
df$DateTime <- strptime(paste(as.character(df$Date), as.character(df$Time)), format="%Y-%m-%d %H:%M");

# Generate Plot no. 4
png(filename = "plot4.png", width = 480, height = 480, units = "px");
par(mfrow=c(2,2), bg="transparent");

#Top Left
with(df, plot(DateTime, Global_active_power,type = "l", xlab = "",ylab = "Global Active Power"));

#Top Right
with(df, plot(DateTime, Voltage,type = "l", xlab = "datetime",ylab = "Voltage"));

#Bottom Left
with(df, plot(DateTime,Sub_metering_1,type = "l", xlab = "",ylab = "Energy sub metering"));
with(df, lines(DateTime,Sub_metering_2, col="red"));
with(df, lines(DateTime,Sub_metering_3, col="blue"));
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=c(1,1,1), bty = "n");

#Bottom Right
with(df, plot(DateTime, Global_reactive_power,type = "l",xlab="datetime"));

dev.off();