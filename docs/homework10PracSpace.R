# Temporary Practice Space for Homework 10
# Jules Ford
# 17 April 2023

#Using a for loop, write a function to calculate the number of zeroes in a numeric vector. Before entering the loop, set up a counter variable counter <- 0. Inside the loop, add 1 to counter each time you have a zero in the vector. Finally, use return(counter) for the output.

# Problem 1

x <- c(8, 4, 0, 10, 900, 4, 0)



check <- zeroCalculator(x) 

vec <- c(8, 4, 0, 10, 900, 4, 0)

####################################
# FUNCTION: zeroCalculator
# packages: none
# purpose: determine the number of zeros inside a numeric vector
# input: a numeric vector
# output: the number of zeros inside the numeric vector
#----------------------------
crazyZeroCalculator <- function(vec) {
  counter <- 0
  betterVec <- paste(vec, collapse="")
  betterVec <- strsplit(betterVec, split="")
  for (i in seq_along(betterVec[[1]])) {
    if (betterVec[[1]][i] == "0") {
     counter <- counter + 1
    }
  }
  return(counter)
  #message("There are" + counter + " zeroes in this vector.")
}

check <- crazyZeroCalculator(vec) 
print(check)


#------------------------

####################################
# FUNCTION: zeroCalculator
# packages: none
# purpose: determine the number of zeros inside a numeric vector
# input: a numeric vector
# output: the number of zeros inside the numeric vector
#----------------------------
zeroCalculator <- function(vec) {
  counter <- 0
  #betterVec <- paste(vec, collapse="")
  for (i in seq_along(vec)) { 
    if (vec[i] == 0) {
      counter <- counter + 1
    }
  } 
  return(counter)
  #message("There are" + counter + " zeroes in this vector.")
}

check <- zeroCalculator(x) 




# new idea: smush everything in the vector into one thing without spaces and then count along the entire string 

# testing the paste function

first <- c(50,40,300,2,01)
second <- paste(first, collapse="")
print(second)

# this is getting somewhere

for (x in second)
  if 