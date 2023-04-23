# Temporary Practice Space for Homework 10
# Jules Ford
# 23 April 2023


library(tidyverse)
dfMaker <- function(mean1,mean2,mean3) {
  group1 <- data.frame("Group"="Group1","Response"=rnorm(10,mean=mean1,sd=0.4))
  group2 <- data.frame("Group"="Group2","Response"=rnorm(10,mean=mean2,sd=0.4))
  group3 <- data.frame("Group"="Group3","Response"=rnorm(10,mean=mean3,sd=0.4))
  df <- rbind(group1,group2,group3)
  return(df)
}

myDF <- dfMaker(3, 5, 18)

#


####################################
# FUNCTION: dfShuffler
dfShuffler <- function(DF) {
  shuffledDF <- data.frame("theGroups"=DF$Group,"ShuffledVals"=sample(DF$Response)) # this shuffles the DF
  byGroup <- group_by(shuffledDF, theGroups)
  meanFinder <- summarize(byGroup, meanData = mean(ShuffledVals))
  g1 <- meanFinder[[1,2]]
  g2 <- meanFinder[[2,2]]
  g3 <- meanFinder[[3,2]]
  meanVec <- c(g1, g2, g3)
  return(meanVec)
}

meansVector <- dfShuffler(myDF)


# problem 4c

# Use a for loop to repeat the function in b 100 times. Store the results in a data frame that has 1 column indicating the replicate number and 1 column for each new group mean, for a total of 4 columns.

####################################
# FUNCTION: hundredLoop
# packages: none
# purpose: Use a for loop to go through the code in 4b 100 times, storing the means into a new DF
# input: the DF from 4a
# output: a new DF with Replicate #, and means calculated for each of the 100 trials
#----------------------------
hundredLoop <- function(DF) {
  emptyDF <- data.frame("Replicate"=1:100, "G1 mean"=NA, "G2 mean"=NA, "G3 mean"=NA) # this makes a new empty data frame with replicate numbers 1-100 and empty values for each of the groups that will fill over time
  for (i in 1:100) {
    shuffler <- data.frame("theGroups"=DF$Group,"Shuffling"=sample(DF$Response))
    byGroup <- group_by(shuffler, theGroups)
    meanFinder <- summarize(byGroup, meanData = mean(Shuffling))
    g1 <- meanFinder[[1,2]]
    g2 <- meanFinder[[2,2]]
    g3 <- meanFinder[[3,2]]
    emptyDF[i,2] <- g1
    emptyDF[i,3] <- g2
    emptyDF[i,4] <- g3
  }
  return(emptyDF)
}

manyLoops <- hundredLoop(myDF)



# Use qplot() to create a histogram of the means for each reshuffled group. Or, if you want a challenge, use ggplot() to overlay all 3 histograms in the same figure. How do the distributions of reshuffled means compare to the original means?

library(ggplot2)
library(patchwork)
library(ggthemes)


G1hist <- ggplot(manyLoops, aes(x=G1.mean)) + geom_histogram(binwidth=0.25,fill="palevioletred3",color="palevioletred4")
print(G1hist)

G2hist <- ggplot(manyLoops, aes(x=G2.mean)) + geom_histogram(binwidth=0.25,fill="palevioletred3",color="palevioletred4")
print(G2hist)

G3hist <- ggplot(manyLoops, aes(x=G3.mean)) + geom_histogram(binwidth=0.25,fill="palevioletred3",color="palevioletred4")
print(G3hist)

hist(manyLoops$G1.mean)
hist(manyLoops$G2.mean)
hist(manyLoops$G3.mean)





#------------------------------------------

####################################
# FUNCTION: dfShuffler
# packages: none
# purpose: Reshuffle response variable from prior df, find mean for each group in the new df, and return those means in a vector with 3 objects
# input: the dataframe from the prior problem
# output: a vector with the means
#----------------------------
dfShuffler <- function(DF) {
  shuffledDF <- data.frame("theGroups"=DF$Group,"ShuffledVals"=sample(DF$Response)) # this shuffles the DF
  byGroup <- group_by(shuffledDF, theGroups)
  meanFinder <- summarize(byGroup, meanData = mean(ShuffledVals))
  g1 <- meanFinder[[1,2]]
  g2 <- meanFinder[[2,2]]
  g3 <- meanFinder[[3,2]]
  meanVec <- c(g1, g2, g3)
  # meanVec <- c(meanFinder[[1,2]], meanFinder[[2,2]], meanFinder[[3,2]])
  return(meanVec)
  # meanG1y <- mean(shuffledDF$G1_y)
  # meanG2y <- mean(shuffledDF$G2_y)
  # meanG3y <- mean(shuffledDF$G3_y) # these generate the means for each column
  # allMeans <- c((meanG1x,meanG1y),(meanG2x,meanG2y),(meanG3x,meanG3y))
  # return(allMeans)
}

meansVector <- dfShuffler(myDF)


#--------------------------------------------



# But I don't even know if there's supposed to be an x variable for each group. Read through the other parts of the problem to figure it out!


####################################
# FUNCTION: dfMaker
# packages: none
# purpose: generate data frame for 3 groups of data drawn from a distribution with a different mean
# input: 3 mean values
# output: the dataframe
#----------------------------
dfMaker <- function(mean1,mean2,mean3) {
  df <- data.frame("Group1_xVar"=rnorm(30,mean=mean1,sd=0.4),"Group1_yVar"=rnorm(30,mean=mean1,sd=0.4),"Group2_xVar"=rnorm(30,mean=mean2,sd=0.4),"Group2_yVar"=rnorm(30,mean=mean2,sd=0.4),"Group3_xVar"=rnorm(30,mean=mean3,sd=0.4),"Group3_yVar"=rnorm(30,mean=mean3,sd=0.4))
  return(df)
}

theDf <- dfMaker(3, 5, 18) # Where someone would input the different mean values for each group


# Write a custom function that 1) reshuffles the response variable, and 2) calculates the mean of each group in the reshuffled data. Store the means in a vector of length 3.

####################################
# FUNCTION: dfShuffler
# packages: none
# purpose: Reshuffle response variable from prior df, find mean for each group in the new df, and return those means in a vector with 3 objects
# input: the dataframe from the prior problem
# output: a vector with the means
#----------------------------
dfShuffler <- function(DF) {
  shuffledDF <- data.frame("G1_x"=DF$Group1_xVar,"G1_y"=sample(DF$Group1_yVar),"G2_x"=DF$Group2_xVar,"G2_y"=sample(DF$Group2_yVar),"G3_x"=DF$Group3_xVar,"G3_y"=sample(DF$Group3_yVar)) # this shuffles the DF
  meanG1x <- mean(shuffledDF$G1_x)
  meanG1y <- mean(shuffledDF$G1_y)
  meanG2x <- mean(shuffledDF$G2_x)
  meanG2y <- mean(shuffledDF$G2_y)
  meanG3x <- mean(shuffledDF$G3_x)
  meanG3y <- mean(shuffledDF$G3_y) # these generate the means for each column
  allMeans <- c((meanG1x,meanG1y),(meanG2x,meanG2y),(meanG3x,meanG3y))
  return(allMeans)
}

meansVector <- dfShuffler(theDf)

# this means I'm going to need to smush the means for the x and y variables



# for part c I'm going to want to make an empty dataframe of size 100 and append the dataframe and send it outward each time?

# for 4d I need to load ggplot2 if I haven't already

