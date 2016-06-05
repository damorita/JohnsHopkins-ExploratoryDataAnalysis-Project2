###Plot 2.R
##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") 
##from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Read in PM2.5 Emmisssions data for 1999 2002, 2005, 2008
NEI <- readRDS("datasource/summarySCC_PM25.rds")
##SCC <- readRDS("datasource/Source_Classification_Code.rds")

## Subsetting for Baltimroe Data Only
BaltNEI <- subset(NEI, fips == '24510')

## Aggregating total emissions for Baltimore City across all years
BaltEmissions <- aggregate(Emissions ~ year, BaltNEI, sum)

# Create Plot 2
png('plot2.png', width=480, height=480)
plot(BaltEmissions$year, BaltEmissions$Emissions, type = "l", 
     main = "Baltimore PM2.5 Emissions from 1999 ~ 2008",
     xlab = "Year", ylab = "Emissions")
	 
dev.off()

## The overall trend in total Emissions in Balimore has decreased with the exception of 2005 when it jumped back