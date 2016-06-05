###Plot 1.R
##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission 
## from all sources for each of the years 1999, 2002, 2005, and 2008.



## Read in PM2.5 Emmisssions data for 1999 2002, 2005, 2008
NEI <- readRDS("datasource/summarySCC_PM25.rds")
##SCC <- readRDS("datasource/Source_Classification_Code.rds")

## Aggregating total emissions across all years
aggEmissions <- aggregate(Emissions ~ year, NEI, sum)

# Create Plot 1
png('plot1.png', width=480, height=480)
plot(aggEmissions$year, aggEmissions$Emissions, type = "l", 
     main = "Total PM2.5 Emissions from 1999 ~ 2008",
     xlab = "Year", ylab = "Emissions")
	 
dev.off()


## As seen in Plot1, the trend of total emmissions have been decreasing over the past 9 years