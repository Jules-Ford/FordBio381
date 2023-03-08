library(tidyverse)
library(dplyr)

data(iris)

# Problem 1

str(iris) # function to examine the structure of the iris dataset
# There are 150 observations of 5 variables

#----------------------------

# Problem 2

# This requires the use of the filter() function
iris1 <- filter(iris, Species == "virginica" | Species == "versicolor", Sepal.Length > 6, Sepal.Width > 2.5)
# There are 56 observations of 5 variables

#----------------------------

# Problem 3

# This requires the use of the select() function
iris2 <- select(iris1, Species, Sepal.Length, Sepal.Width)
# There are 56 observations of 3 variables

#----------------------------

# Problem 4

# This requires the use of the arrange() function
iris3 <- arrange(iris2, by=Sepal.Length)
head(iris3)
# This requires the use of the arrange() function

#----------------------------

# Problem 5

# I need to use the mutate() function
iris4 <- mutate(iris3, Sepal.Area=Sepal.Length*Sepal.Width)
# There are 56 observations of 4 variables

#----------------------------

# Problem 6

# Need to use the summarize() function
iris5 <- summarize(iris4, Average.Sepal.Length=mean(Sepal.Length), Average.Sepal.Width=mean(Sepal.Width), Sample.Size=n())
print(iris5)

#----------------------------

# Problem 7

# need to use group_by() function and the summarize() function

iris6 <- group_by(iris4, Species)
iris6 <- summarize(iris6, Average.Sepal.Length=mean(Sepal.Length), Average.Sepal.Width=mean(Sepal.Width), Sample.Size=n())
print(iris6)

#----------------------------

# Problem 8

# start with iris, end with irisFinal

irisFinal <- iris %>%
  filter(Species == "virginica" | Species == "versicolor", Sepal.Length > 6, Sepal.Width > 2.5)%>% # Problem 2 (we skip Problem 1)
  select(Species, Sepal.Length, Sepal.Width)%>% # Problem 3
  arrange(by=Sepal.Length)%>% # Problem 4
  mutate(Sepal.Area=Sepal.Length*Sepal.Width)%>% # Problem 5
  group_by(Species)%>% # Problem 7 (we skip Problem 6)
  summarize(Average.Sepal.Length=mean(Sepal.Length), Average.Sepal.Width=mean(Sepal.Width), Sample.Size=n()) # Problem 7

print(irisFinal)

#----------------------------

# Problem 9

# first attempt:
#longerFrame <- pivot_longer(iris, cols = Species, Measure, Value, Species=Species, names_to=Measure, values_to=Value)
# but this doesn't work very well; I think I'm not properly using pivot_longer


#"Create a ‘longer’ data frame using the original iris data set with three columns named “Species”, “Measure”, “Value”. The column “Species” will retain the species names of the data set. The column “Measure” will include whether the value corresponds to Sepal.Length, Sepal.Width, Petal.Length, or Petal.Width and the column “Value” will include the numerical values of those measurements."

longerFrame <- pivot_longer(iris, cols=c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width"), names_to="Measure")

# I believe this works