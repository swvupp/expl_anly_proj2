setwd("~/Coursera/Data Science/Exploratory Data Analysis")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)
BalNEI <- subset(NEI, fips == "24510")
total.emissions.balcity <- summarize(group_by(BalNEI, year), Emissions=sum(Emissions))

png(filename="./project2/plot2.png")
barplot(height = total.emissions.balcity$Emissions/1000, names.arg = total.emissions.balcity$year, 
        xlab = "Years", ylab = "Total PM2.5 Emissions in Kilotons", 
        main = "Total PM2.5 Emissions for Baltimore City by Year")
dev.off()
