setwd("~/Coursera/Data Science/Exploratory Data Analysis")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

veh.emissions.balcity <- subset(NEI, fips == "24510" & type == "ON-ROAD")
veh.emissions.balcity.agg <- summarize(group_by(veh.emissions.balcity, fips, year), Emissions=sum(Emissions))

veh.emissions.la <- subset(NEI, fips == "06037" & type == "ON-ROAD")
veh.emissions.la.agg <- summarize(group_by(veh.emissions.la, fips, year), Emissions = sum(Emissions))

veh.emissions.two.states <- rbind(veh.emissions.balcity.agg, veh.emissions.la.agg)

png(filename="./project2/plot6.png")
qplot(year, Emissions/1000, data = veh.emissions.two.states, color = fips, geom = "line") + 
ggtitle("Vehicle PM2.5 Emissions for Baltimore City by & Los Angeles by Year") + 
xlab("Years") + 
ylab("Vehicle PM2.5 Emissions in Kilotons")
dev.off()
