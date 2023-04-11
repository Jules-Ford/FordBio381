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

 # Yay! Now that I figured out how to read the file, before I convert it as a function and do all that jazz, I want to clean it and distill the data to the values that I care about.
 
 # I only want the medprot data. So, I want to make a new and improved table that does this.

####################################
# FUNCTION:  clean_up
# packages: none
# purpose: Pare down the raw data file
# input: Raw data frame
# output: Cleaner data frame
#----------------------------
clean_up <- function(rawDataFrame) {
  cleanDataFrame <- filter(rawDataFrame, Diet == "medprot") # keeps only the data for roaches that had medium protein diets
  cleanDataFrame <- select(cleanDataFrame, Strain, Diet, total.intake, growth) # keeps only the relevant columns
  cleanDataFrame <- filter(cleanDataFrame, growth != '.') # this gets rid of the pesky missing value
  
  
  # cleanDataFrame <- filter
  # I want to put complete.cases in here so it gets rid of rows with incomplete cases in every column remaining.
  
  
  return(cleanDataFrame);
}

# This is much better. Now, everything listed is just the medprot diet roaches. Thank you filter() function!
# But, it could be a bit nicer. My plan is to only keep the columns that I care about. To do this, I can use the select() function.
# Perfect. This is a lot prettier and less busy. Now I want to calculate all the summary statistics from this dataframe. But, I'll probably want to do that in a separate function. So, I'm going to send this final dataframe as the output to the main program file. 

# I will use summarize() and group_by() in a minute, but in a different function!
 

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
   meanGrowth <- mean(tempDataGrowth$growth)
   return(meanGrowth);
 }
 
 
 ####################################
 # FUNCTION:  count
 # packages: none
 # purpose: Counts the number of samples for a subset of the dataframe
 # input: Name of the subset of the dataframe
 # output: The count for that group
 #----------------------------
 growthCounter <- function(theCleanData, theStrain) {
   tempData <- filter(theCleanData, Strain == theStrain)
   tempData <- select(tempData, growth)
   print(tempData)
   print(count(tempData))
   #return(count(tempData$growth));
 } 
 
 
 ####################################
 # FUNCTION:  functionname
 # packages: none
 # purpose:
 # input:
 # output:
 #----------------------------
 functionname1 <- function(message) {
   return(message);
 }
 
 
 ####################################
 # FUNCTION:  functionname
 # packages: none
 # purpose:
 # input:
 # output:
 #----------------------------
 functionname <- function(message) {
   return(message);
 }