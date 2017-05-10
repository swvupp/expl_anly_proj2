setwd("~/Coursera/Data Science/Exploratory Data Analysis")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

total.emissions.us <- summarise(group_by(NEI, year), Emissions=sum(Emissions))

png(filename="./project2/plot1.png")
barplot(height = total.emissions.us$Emissions/1000, names.arg = total.emissions.us$year, 
        xlab = "Years", ylab = "Total PM2.5 Emissions in Kilotons", 
        main = "Total PM2.5 Emissions for United States by Year")
dev.off()

