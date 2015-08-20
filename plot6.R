## Question 6
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
## sources in Los Angeles County, California (fips == 06037). 
## Which city has seen greater changes over time in motor vehicle emissions?
library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
target <- c("24510", "06037")
NEIBaltimore<-filter(NEI,fips  %in% target)
motor<-grep("motor",SCC$Short.Name,ignore.case = TRUE)
SCCMotor<-SCC[motor,]
#SCCMotor<-filter(SCCMotor,grepl('Onroad|Nonroad'))
combineddataset<-inner_join(NEIBaltimore,SCCMotor,by= "SCC")
groupedValues<-group_by(combineddataset,year,fips)%>% summarise(sum(Emissions))
names(groupedValues)[3]<-"Emissions"
groupedValues$fips<-gsub("06037","Los Angeles",x = groupedValues$fips)
groupedValues$fips<-gsub("24510","Baltimore City",x = groupedValues$fips)
png(filename="plot6.png", width=480, height=480)
qplot(year,Emissions,data = groupedValues,colour =fips, geom = c("line"),main="Comparison of Emissions in Baltimore and Los Angeles")
dev.off()