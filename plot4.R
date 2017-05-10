setwd("~/Coursera/Data Science/Exploratory Data Analysis")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

SCC.sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI.sub <- NEI[NEI$SCC %in% SCC.sub$SCC, ]

png(filename="./project2/plot4.png")
ggplot(NEI.sub, aes(x = factor(year), y = Emissions/1000, fill = type)) + 
geom_bar(stat= "identity", width = .4) + xlab("year") + 
ylab("Coal-Related PM2.5 Emissions in Kilotons") + 
ggtitle("Total Coal-Related PM2.5 Emissions in United States")
dev.off()