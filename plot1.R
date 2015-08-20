## Question 1
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")install.packages("lubridate")
library(dplyr)
a<-select(NEI,Emissions,year)
groupedValues<-group_by(a,year)%>% summarise(sum(Emissions))
names(groupedValues)[2]<-"Emissions"
png(filename="plot1.png", width=480, height=480)
with(groupedValues,plot(year,Emissions,type="l",YLAB="PM 2.5 emissions",main="total emissions from PM2.5"))
dev.off()