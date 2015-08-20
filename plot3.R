## Question 3
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 1999-2008? 
## Use the ggplot2 plotting system to make a plot answer this question.
library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)
a<-select(NEI,Emissions,year,fips,type)
a<-filter(a,fips == 24510)
groupedValues<-group_by(a,year,type)%>% summarise(sum(Emissions))
names(groupedValues)[3]<-"Emissions"
png(filename="plot3.png", width=480, height=480)
qplot(year,Emissions,data = groupedValues,color = type ,geom = c("smooth","point"), main="Total emissions from PM2.5 by type for Baltimore City,Maryland")
dev.off()