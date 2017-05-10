setwd("~/Coursera/Data Science/Exploratory Data Analysis")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

veh.emissions.balcity <- subset(NEI, fips == "24510" & type == "ON-ROAD")
veh.emissions.balcity.agg <- summarize(group_by(veh.emissions.balcity, year), Emissions=sum(Emissions))

png(filename="./project2/plot5.png")
qplot(year, Emissions/1000, data = veh.emissions.balcity.agg, geom = "line") + 
ggtitle("Vehicle PM2.5 Emissions for Baltimore City by Year") + 
xlab("Years") + 
ylab("Vehicle PM2.5 Emissions in Kilotons")
dev.off()