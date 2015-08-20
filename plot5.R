## Question 5
## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIBaltimore<-filter(NEI,fips == "24510")
motor<-grep("motor",SCC$Short.Name,ignore.case = TRUE)
SCCMotor<-SCC[motor,]
#SCCMotor<-filter(SCCMotor,grepl('Onroad|Nonroad'))
combineddataset<-inner_join(NEIBaltimore,SCCMotor,by= "SCC")
groupedValues<-group_by(combineddataset,year)%>% summarise(sum(Emissions))
names(groupedValues)[2]<-"Emissions"
png(filename="plot5.png", width=480, height=480)
qplot(year,Emissions,data = groupedValues,geom = c("smooth","point"),main="PM2.5 emission by year from motor vehicles in Baltimore City")
dev.off()