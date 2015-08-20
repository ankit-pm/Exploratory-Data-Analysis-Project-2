## Question 4
## Across the United States, how have emissions from coal combustion-related sources changed 
## from 1999-2008?
library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)
coal<-grep("Coal",SCC$Short.Name,ignore.case = TRUE)
SCCCoal<-SCC[coal,]
combineddataset<-inner_join(NEI,SCCCoal,by = "SCC")
groupedValues<-group_by(combineddataset,year)%>% summarise(sum(Emissions))
names(groupedValues)[2]<-"Emissions"
png(filename="plot4.png", width=480, height=480)
qplot(year,Emissions,data = groupedValues,geom = c("smooth","point"),main="PM2.5 emission by year from coal combustion-related sources")
dev.off()

