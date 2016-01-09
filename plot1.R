# Read the file. the seperator is semicolon and "?" is used for NA values. 
df <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE,sep=";",header = TRUE,na.strings = "?");

# Fix the time and date fields
df$Time <- format(df$Time, format="%H:%M");
df$Date <- as.Date(x=df$Date, format ="%d/%m/%Y");

# subset to the needed data
df <- subset(df,Date >= '2007-02-01' & Date <= '2007-02-02' );

# Generate Plot no. 1
png(filename = "plot1.png", width = 480, height = 480, units = "px");
par(bg="transparent");
with(df, hist(Global_active_power, col="red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power"));
dev.off();