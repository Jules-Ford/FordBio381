# This is the work space I am using for Homework 4

# TRY These out with problem 4 to make things more efficient!

z <- c(3.1, 9.2, 1.3, 0.4, 7.5)

# positive index values
z[c(2,3)]

# negative index values to exclude elements
z[-c(2,3)]



x <- c(1,2,3,4,5)
x[1]


# The problem asks for us to create a vector for numbers 1-100 that aren't divisible by 2, 3, or 7 using arithmetic operators. `&` means and, `|` means or, and `5 %% 4` gives 1 as a remainder.


bigVec <- c(1:100) # I start by making a vector called bigVec with numbers 1-100
print(bigVec) # printing it out to confirm that it works

endVec <- bigVec[(bigVec %% 2 != 0) & (bigVec %% 3 != 0) & (bigVec %% 7 != 0)] # I make a new vector that's assigned to the selection of values from bigVec

print(endVec) # I print out the vector at the end

