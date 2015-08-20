## Q2
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == 24510) 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")install.packages("lubridate")
a<-select(NEI,Emissions,year,fips)
a<-filter(a,fips == 24510)
groupedValues<-group_by(a,year)%>% summarise(sum(Emissions))
names(groupedValues)[2]<-"Emissions"
png(filename="plot2.png", width=480, height=480)
with(groupedValues,plot(year,Emissions,type="l",YLAB="PM 2.5 emissions",main="Total emissions from PM2.5 of Baltimore City,Maryland"))
dev.off()