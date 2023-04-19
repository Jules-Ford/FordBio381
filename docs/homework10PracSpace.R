# Temporary Practice Space for Homework 10
# Jules Ford
# 17 April 2023

# problem 3
# Write a function that takes as input two integers representing the number of rows and columns in a matrix. The output is a matrix of these dimensions in which each element is the product of the row number x the column number.


####################################
# FUNCTION: matrixMaker
# packages: none
# purpose: generate a matrix given its row and column
# input: 2 integers, reprsenting rows and columns in a matrix
# output: a matrix with the inputted dimensions, where each element is the product of the given row and column number
#----------------------------
matrixMaker <- function(rows, cols) {
  theMatrix <- matrix(data=NA, nrow=rows, ncol=cols)
  for (i in 1:nrow(theMatrix)) {
    
  #  m[i,] <-  need to figure out how to pull the row and column number
  }
  return(theMatrix)
} # this is a great start. Now I just need to fill the rows and columns with the product of the row and column

test <- matrixMaker(3,4)


m <- matrix(data=NA, nrow=3, ncol=6)
m[3,4] <- 5
m[,]

