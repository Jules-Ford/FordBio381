# homework 9 practice space
# April 08 + 10 2023
# Jules Ford

library(tidyverse)
rawDataTest <- read.csv("GermanCockroachData.csv")
cleanTest <- filter(rawDataTest, Diet == "medprot")
cleanTest <- select(cleanTest, Strain, Diet, total.intake, growth)
cleanTest <- filter(cleanTest, growth != ".")
#This is a test to filter out the "."




#  This function will calculate these data for each group, using the summarize() and group_by() functions.

# Here's what I need to grab for each group (WT, hybrid, GA):
# Mean, Standard Deviation, and Count for total.intake
# Mean, Standard Deviation, and Count for growth

# once i do the operations for 1 column and 1 group, it will be easy to do everything else because it'll be the same operations repeated.

# Good job so far, you can do it!

# one roach didn't have a mean value so that might require taking it out of the data

