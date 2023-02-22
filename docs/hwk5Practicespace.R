# Create a data frame with the two variables (= columns) and 26 cases (= rows) below:

# call the first variable my_unis and fill it with 26 random uniform values from 0 to 10
my_unis <- runif(n = 26, min = 0, max = 10)

# call the second variable my_letters and fill it with 26 capital letters in random order.
my_letters <- sample(LETTERS)
  
# Creating the initial data frame:
firstFrame <- data.frame(my_unis, my_letters)
print(firstFrame)

# for the first variable, use a single line of code in R to select 4 random rows 
# and replace the numerical values in those rows with NA.
firstFrame[sample(1:26, size = 4),1] <- NA
print(firstFrame)

#for the first variable, write a single line of R code to identify which rows have the missing values.
firstFrame[!complete.cases(firstFrame),]


#re-order the entire data frame to arrange the second variable in alphabetical order

firstFrame$my_letters # This line is for my sake; it says the original order of the letters

order(firstFrame$my_letters) # This line is for my sake; it says the original row numbers of the letters of the alphabet (before firstFrame was alphabetized, "A" was in row 24)

firstFrame[order(firstFrame$my_letters), ] # This properly reorders things!

#calculate the column mean for the first variable.
workableFrame <- firstFrame[complete.cases(firstFrame),] # making a new dataframe with only the rows that have values
print(mean(workableFrame[,1])) # calculating and printing the mean



