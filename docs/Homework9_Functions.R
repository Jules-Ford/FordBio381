# Homework 9 Functions File
# Jules Ford
# 29 March 2023

####################################
# FUNCTION:  read_file
# packages: none
# purpose: Reads in the .csv data file
# input: Name of the .csv data file
# output: A raw dataframe
#----------------------------
 readIn <- function(cockroach_file) {
   return(read.csv(cockroach_file)) # reads in the data file and returns as a Data Frame
}

####################################
# FUNCTION:  clean_up
# packages: none
# purpose: Pare down the raw data file
# input: Raw data frame
# output: Cleaner data frame
#----------------------------
clean_up <- function(rawDataFrame) {
  cleanDataFrame <- filter(rawDataFrame, Diet == "medprot") # keeps only the data for roaches that had medium protein diets
  cleanDataFrame <- dplyr::select(cleanDataFrame, Strain, Diet, total.intake, growth) # keeps only the relevant columns
  cleanDataFrame <- filter(cleanDataFrame, growth != '.') # this gets rid of the pesky missing value
  return(cleanDataFrame);
}

 ####################################
 # FUNCTION:  get_mean_intake
 # packages: none
 # purpose: Calculates the mean total intake for a subset of the dataframe
 # input: Name of the subset of the dataframe
 # output: The mean total intake for that group
 #----------------------------
 get_mean_intake <- function(theCleanData, theStrain) {
   tempData <- filter(theCleanData, Strain == theStrain)
   found_mean <- mean(tempData$total.intake)
   return(found_mean);
 }

 ####################################
 # FUNCTION:  get_mean_growth
 # packages: none
 # purpose: Calculates the mean growth for a subset of the dataframe
 # input: Name of the subset of the dataframe
 # output: The mean growth for that group
 #----------------------------
 get_mean_growth <- function(theDF, theStr) {
   tempDataGrowth <- filter(theDF, Strain == theStr)
   meanGrowth <- mean(as.numeric(tempDataGrowth$growth))
   return(meanGrowth)
 } 
 
 ####################################
 # FUNCTION:  growthCounter
 # packages: none
 # purpose: Counts the number of samples for a subset of the dataframe
 # input: Name of the subset of the dataframe
 # output: The count for that group
 #----------------------------
 growthCounter <- function(theCleanData, theStrain) {
   tempData <- filter(theCleanData, Strain == theStrain)
   tempData <- dplyr::select(tempData, growth)
   return(count(tempData))
 }  
 
 ####################################
 # FUNCTION:  intakeCounter
 # packages: none
 # purpose: Counts the number of samples for a subset of the dataframe
 # input: Name of the subset of the dataframe
 # output: The count for that group
 #----------------------------
 intakeCounter <- function(theCleanData, theStrain) {
   tempData <- filter(theCleanData, Strain == theStrain)
   tempData <- dplyr::select(tempData, total.intake)
   return(count(tempData))
 }  
  
 ####################################
 # FUNCTION:  get_sd_intake
 # packages: none
 # purpose: Calculates the sd total intake for a subset of the dataframe
 # input: Name of the subset of the dataframe
 # output: The sd total intake for that group
 #----------------------------
 get_sd_intake <- function(theCleanData, theStrain) {
   tempData <- filter(theCleanData, Strain == theStrain)
   found_sd <- sd(as.numeric(tempData$total.intake))
   return(found_sd);
 }
 
 ####################################
 # FUNCTION:  get_sd_growth
 # packages: none
 # purpose: Calculates the sd growth for a subset of the dataframe
 # input: Name of the subset of the dataframe
 # output: The sd growth for that group
 #----------------------------
 get_sd_growth <- function(theCleanData, theStrain) {
   tempData <- filter(theCleanData, Strain == theStrain)
   found_sd <- sd(as.numeric(tempData$growth))
   return(found_sd);
 } 
 
 ####################################
 # FUNCTION:  lmCalc
 # packages: none
 # purpose: Run linear regression for a given cockroach group
 # input: cockroach group (by its total intake and growth), and the name of the dataframe
 # output: linear regression
 #----------------------------
 lmCalc <- function(yVar, xVar, frameName) {
   return(lm(yVar ~ xVar, data=frameName));
 } 
 
 ####################################
 # FUNCTION:  scatterplotMaker
 # packages: none
 # purpose: make scatterplot for each of the cockroach groups
 # input: column names, title, and dataframe name
 # output: scatterplot
 #----------------------------
 scatterplotMaker <- function(growth, total.intake, title, dataframe) {
   . <- plot(growth ~ total.intake, main = title, data=dataframe)
   return(.);
 }
 
 ####################################
 # FUNCTION:  regSummary
 # packages: none
 # purpose: provide summary information given the regression previously calculated for each group
 # input: the regression gor each group
 # output: the summary
 #----------------------------
regSummary <- function(regInfo) {
   return(summary(regInfo));
 }