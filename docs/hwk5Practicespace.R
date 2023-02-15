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
print(vals <- firstFrame[[my_unis == NA, ]])
# this is currently incorrect


#re-order the entire data frame to arrange the second variable in alphabetical order



#calculate the column mean for the first variable.
mean(firstFrame[1,]) # this is currently wrong


