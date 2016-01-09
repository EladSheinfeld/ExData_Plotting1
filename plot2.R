# Read the file. the seperator is semicolon and "?" is used for NA values. 
df <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE,sep=";",header = TRUE,na.strings = "?");

# Fix the time and date fields
df$Time <- format(df$Time, format="%H:%M");
df$Date <- as.Date(x=df$Date, format ="%d/%m/%Y");

# subset to the needed data
df <- subset(df,Date >= '2007-02-01' & Date <= '2007-02-02' );
df$DateTime <- strptime(paste(as.character(df$Date), as.character(df$Time)), format="%Y-%m-%d %H:%M");

# Generate Plot no. 2
png(filename = "plot2.png", width = 480, height = 480, units = "px");
par(bg="transparent");
with(df, plot(DateTime, Global_active_power,type = "l", xlab = "",ylab = "Global Active Power (kilowatts)"));
dev.off();