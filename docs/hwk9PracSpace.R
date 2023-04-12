# homework 9 practice space
# April 08 + 10 2023
# Jules Ford

library(tidyverse)
rawDataTest <- read.csv("GermanCockroachData.csv")
cleanTest <- filter(rawDataTest, Diet == "medprot")
cleanTest <- select(cleanTest, Strain, Diet, total.intake, growth)
cleanTest <- filter(cleanTest, growth != ".")
#This is a test to filter out the "."


testingTheRoaches <- data.frame("WT.intake"=rnorm(n=20,mean=11.7636,sd=1.3207022),"WT.growth"=rnorm(n=20,mean=6.6646158,sd=0.8682219),"Hyb.intake"=rnorm(n=20,mean=11.201452,sd=1.1952825),"Hyb.growth"=rnorm(n=20,mean=7.0736739,sd=1.0584402),"GA.intake"=rnorm(n=20,mean=6.509735,sd=3.1441545),"GA.growth"=rnorm(n=20,mean=3.967465,sd=1.1635215))
print(allTheRoaches)

print(testingTheRoaches[,WT.intake])


lm_WTjulia <- lm(WT.growth ~ WT.intake, data=allTheRoaches)
summary(lm_WT)

#  This function will calculate these data for each group, using the summarize() and group_by() functions.

# Here's what I need to grab for each group (WT, hybrid, GA):
# Mean, Standard Deviation, and Count for total.intake
# Mean, Standard Deviation, and Count for growth

# once i do the operations for 1 column and 1 group, it will be easy to do everything else because it'll be the same operations repeated.

# Good job so far, you can do it!

# one roach didn't have a mean value so that might require taking it out of the data

