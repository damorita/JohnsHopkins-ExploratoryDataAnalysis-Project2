###Plot 5.R
##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in 
##Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). 
##Which city has seen greater changes over time in motor vehicle emissions?

## Read in PM2.5 Emmisssions data for 1999 2002, 2005, 2008
NEI <- readRDS("datasource/summarySCC_PM25.rds")
SCC <- readRDS("datasource/Source_Classification_Code.rds")

#Subsetting NEI for Vehicle Emission Data
VehicleRows <- grep('Vehicle', SCC$EI.Sector)
SCCVehSubset <- SCC[VehicleRows,]
NEIVeh <- subset(NEI, NEI$SCC %in% SCCVehSubset$SCC)
LABaltNEIVeh <- subset(NEIVeh, fips == '06037' | fips == '24510' )
## Aggregating total vehicle emissions across all years
aggVehEmissions <- aggregate(Emissions ~ year + fips, LABaltNEIVeh, sum)

## Adding County Names
aggVehEmissions$Location[aggVehEmissions$fips=="24510"] <- "Baltimore"
aggVehEmissions$Location[aggVehEmissions$fips=="06037"] <- "Los Angeles"


## Loading GG Plot
library("ggplot2", lib.loc="~/R/win-library/3.2")

# Create Plot 6
png('plot6.png', width=480, height=480)

plot6 <- ggplot(aggVehEmissions, aes(x=year, y=Emissions, color=Location)) +
     geom_point(alpha=.3) +
     geom_smooth(alpha=.2, size=1, method="loess") +
	 ylab(expression('Total PM2.5 Emissions')) +
     ggtitle("Total Vehicle Emissions in LA vs Baltimore from 1999 ~ 2008")

print(plot6)
dev.off()
## LA has had significant changes in Vehicle emissions between 1999 - 2008 compared to Baltimore.