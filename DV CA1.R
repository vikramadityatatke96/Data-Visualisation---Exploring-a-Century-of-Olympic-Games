library(dplyr)
library(ggplot2)
library(wordcloud)
library(tm)
#Set the working directory
setwd("C:\\Users\\vikra\\OneDrive - National College of Ireland\\MSc Data Analytics\\Semester 2\\Data Visualization\\CA1")

#Read data from the atheletes_events.csv into a dataframe
athletes <- read.csv("athlete_events.csv")
summary(athletes)
str(athletes)

#Read data from the noc_reigions.csv into a dataframe
noc <- read.csv("noc_regions.csv")
length(noc$region)
#Add 'Regions' column from noc to atheletes dataframe based on 'NOC' column
#in both the data frames
athletes$region <- noc$region[match(athletes$NOC, noc$NOC)]

#Creating a dataframes for different medalists and removing NA
athletes <- athletes %>% filter(complete.cases(.))

ggplot(data=athletes, aes(x=Height, y=Weight)) +
  geom_point(aes(color=as.factor(Sex))) + 
  ggtitle("Height Vs Weight", subtitle = "For Men and Women Athletes") + 
  xlab("Height (cm)") + 
  ylab("Weight (kgs)")

ggplot(data=athletes, aes(x=as.factor(Sex), y = Age)) +
  geom_boxplot(aes(fill=as.factor(Sex))) +
  ggtitle("Variation in athletes' age over the years", subtitle = "For Men and Women Athletes") +
  xlab("Gender") +
  ylab("Age (in years)")

wordcloud(athletes$Event ,min.freq = 10,colors=brewer.pal(8, "Dark2"),random.color = TRUE,max.words = 1200)
