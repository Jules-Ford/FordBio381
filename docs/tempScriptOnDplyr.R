# temp script on using dplyr

# check packages are installed in console: install.packages(tidyverse), or you can go to tools -> install packages and write in the box 'tidyverse' and hit install

library(tidyverse) # running this enables tidyverse for this project

library(dplyr)

# conflicts means that filter() and lag() functions with conflicts don't work as well

#--------------------------------------
# tidyverse is the universe of clean usable datasets with standardized operations for data science!

# tidyverse has more available to us than dplyr but they're really similar
#----------------------------------

# The core verbs:
# filter()
# arrange()
# select()
# summarize() and group_by()
# mutate()


#dplyr is focused on manipulating datasets

# all these functions ask for the name of the dataset first, followed by other more specific operations

#------------------------------------

data(starwars)
class(starwars)

# Start with template dataset "Starwars"
# if we click on the dataframe we can see the full dataframe in the system
# the dataset is purposefully not clean so it's perfect for us to practice with!
# it is a dataframe but also a tibble which helps nitpick ways to improve the dataframe and it tells you when errors pop up (way more useful than dataframes just coercing things willy-nilly)

glimpse(starwars)

# Clean the dataset

# we can use things like complete.cases()
starwarsClean <- starwars[complete.cases(starwars[,1:10]),] # looks for complete cases in the first through tenth column

# we can also use is.na()
is.na(starwarsClean[1,1]) # useful for individual/few observations

anyNA(starwarsClean) # this regards the whole dataset

# n() is a context-dependent expression that could be used to count the number of NAs


#------------------------------------


# filter() - subset observations by their values
# uses conditional statements and logical operators (>, <, !=, ==). & | .

filt <- filter(starwarsClean, gender=="feminine" & height < 180)

filt <- filter(starwarsClean, gender=="feminine" & height < 180, height > 100)

# %in% is used for a few conditions, similar to ==

filt <- filter(starwars, eye_color %in% c("blue", "brown")) # this is for adding multiple conditions in the same column so it's asking for cases where the character either has a blue or brown eye color

#-------------------------------------------

# arrange() - reorder rows by either ascending, descending, whatever we want

order <- arrange(starwarsClean, by=height)
order <- arrange(starwarsClean, by=desc(height))
order <- arrange(starwarsClean, height, by=desc(mass))

# Missing values are placed at the end of the dataset

#----------------------------------------

# select() - Choosing variables/columns by their names
starwarsClean[,1:10] # Base R
select(starwarsClean, 1:10)
x <- select(starwarsClean, name:species) # using column names, picks every column from name through species
x <- select(starwarsClean, -(films:starships)) # will subset everything except these particular variables

# rearrange columns
x <- select(starwarsClean, gender, name, species, everything()) # everything() pulls in whatever is left

x <- select(starwarsClean, contains("color")) # contains() looks for a pattern to match

#--------------------------------------------

# Rename columns
x <- select(starwarsClean, haircolor=hair_color) # New name=Old Name

x <- rename(starwarsClean, haircolor=hair_color)

#--------------------------------------------

# summarize() and group_by() - collapses values down to single summary plots

x <- summarize(starwarsClean, meanHeight=mean(height))
# mean table for the entire tibble

x <- summarize(starwars, meanHeight=mean(height)) # won't work with NA's still inside the dataset

summarize(starwars, meanheight=mean(height, na.rm=TRUE), TotalNumber=n()) # na.rm tells it to strip NA values before doing the calculation for the mean

# use group_by() to specify grouping values
starwarsGender <- group_by(starwars, gender)

x <- summarize(starwarsGender, meanHeight=mean(height, na.rm=TRUE))


#-------------------------------------------------

# mutate() - adding/creating new variables
x <- mutate(starwarsClean, ratio=height/mass)

starwars_lbs <- mutate(starwarsClean, mass_lbs=mass*2.2) # converts kg to lbs

x <- select(starwars_lbs, 1:3, mass_lbs, everything())


# if we only want the new variable
transmute(starwarsClean, mass_lbs=mass*2.2)

transmute(starwarsClean, mass, mass_lbs=mass*2.2)

#-----------------------------------------

# Pipe statements, or piping %>%
# Pipe statements translate roughly to "and then"

# We feed in the original functions and pass them onto the next part
# this generates a chain of different things together

# George's way of visualizing it:
# x %>%
#   y%>%
#   z%>%

starwarsClean2 <- starwarsClean %>%
  group_by(gender)%>%
  summarize(meanHeight=mean(height, na.rm=TRUE), number=n())
# this statements produces a table with three columns, gender, meanHeight, and number!

starwarsClean2 <- starwarsClean %>%
  mutate(sp=case_when(species == "Human" ~"Human", TRUE ~ "Non-Human")) %>%
  select(name, sp, everything())


# Pipe statements and tidyverse were created hand in hand, so they're not available in Base R and you need to be working in tidyverse for them to function

#---------------------------------------

# Pivoting datasets

# Long format to wide format
starwarsClean

wideSW <- starwarsClean%>%
  select(name, sex, height)%>%
  pivot_wider(names_from=sex, values_from=height, values_fill=NA)

starwarsclean2 <- starwarsClean%>%
  select(name, sex, height)

x <- wideSW%>%
  pivot_longer(cols = male:female, names_to="sex", values_to="height", values_drop_na=T)

# for Hwk 6: don't use pipe statements at the beginning of the code and then do everything over in pipe statements
