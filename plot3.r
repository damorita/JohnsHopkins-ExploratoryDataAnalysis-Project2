###Plot 3.R
##Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
##Which have seen increases in emissions from 1999–2008? 
##Use the ggplot2 plotting system to make a plot answer this question.

## Read in PM2.5 Emmisssions data for 1999 2002, 2005, 2008
NEI <- readRDS("datasource/summarySCC_PM25.rds")
##SCC <- readRDS("datasource/Source_Classification_Code.rds")

## Subsetting for Baltimroe Data Only
BaltNEI <- subset(NEI, fips == '24510')

## Aggregating total emissions for Baltimore City across all years and by different types
BaltEmissionsType <- aggregate(Emissions ~ year + type, BaltNEI, sum)

## Loading GG Plot
library("ggplot2", lib.loc="~/R/win-library/3.2")

# Create Plot 3
png('plot3.png', width=480, height=480)

plot3 <- ggplot(BaltEmissionsType, aes(x=year, y=Emissions, color=type)) +
     geom_point(alpha=.3) +
     geom_smooth(alpha=.2, size=1, method="loess") +
	 ylab(expression('Total PM2.5 Emissions')) +
     ggtitle("Total Emissions by Type in Baltimore")

print(plot3)
	 
dev.off()

## The emissions in Baltimore has seen a decreasing trend for types non-road, nonpoint, and on-road.
##Point type emissions have seen increases in Baltimore 