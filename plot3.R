setwd("~/Coursera/Data Science/Exploratory Data Analysis")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

BalNEI <- subset(NEI, fips == "24510")
total.emissions.balcity.type <- summarize(group_by(BalNEI, year, type), Emissions=sum(Emissions))

png(filename="./project2/plot3.png")
qplot(year, Emissions/1000, data = total.emissions.balcity.type, color = type, geom = "line") + 
ggtitle("Total PM2.5 Emissions for Baltimore City by Year and Type") +
xlab("Years") + 
ylab("Total PM2.5 Emissions in Kilotons")
dev.off()
