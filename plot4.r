###Plot 4.R
##Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Read in PM2.5 Emmisssions data for 1999 2002, 2005, 2008
NEI <- readRDS("datasource/summarySCC_PM25.rds")
SCC <- readRDS("datasource/Source_Classification_Code.rds")

#Subsetting NEI for Coal Emission Data
CoalRows <- grep('Coal', SCC$EI.Sector)
SCCCoalSubset <- SCC[CoalRows,]
NEICoal <- subset(NEI, NEI$SCC %in% SCCCoalSubset$SCC)


## Aggregating total coal emissions across all years
aggCoalEmissions <- aggregate(Emissions ~ year, NEICoal, sum)

# Create Plot 4
png('plot4.png', width=480, height=480)
plot(aggCoalEmissions$year, aggCoalEmissions$Emissions, type = "l", 
     main = "Total Coal Emissions from 1999 ~ 2008",
     xlab = "Year", ylab = "Emissions")
	 
dev.off()


## Coal Based Emissions in the US have been on a decreasing trend from 1999 - 2008, with a sharp decline starting in 2005