###Plot 5.R
##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## Read in PM2.5 Emmisssions data for 1999 2002, 2005, 2008
NEI <- readRDS("datasource/summarySCC_PM25.rds")
SCC <- readRDS("datasource/Source_Classification_Code.rds")

#Subsetting NEI for Vehicle Emission Data
VehicleRows <- grep('Vehicle', SCC$EI.Sector)
SCCVehSubset <- SCC[VehicleRows,]
NEIVeh <- subset(NEI, NEI$SCC %in% SCCVehSubset$SCC)
BaltNEIVeh <- subset(NEIVeh, fips == '24510')

## Aggregating total vehicle emissions across all years
aggVehEmissions <- aggregate(Emissions ~ year, BaltNEIVeh, sum)

# Create Plot 5
png('plot5.png', width=480, height=480)
plot(aggVehEmissions$year, aggVehEmissions$Emissions, type = "l", 
     main = "Total Vehicle Emissions in Baltimore from 1999 ~ 2008",
     xlab = "Year", ylab = "Emissions")
	 
dev.off()


## Vehicle Emissions in Baltimore have been declining between 1999 - 2008