## read Oakland data into dataframe. A popup window will let you select the file manually. R can read CSVs and a host of other data formats that can also be exported from Excel spreadsheets. Highlight the script and do Shift+ Enter to run the code.

dat = read.csv(file.choose())


# This will produce a detailed summary of the data

## For those of you from the Bay, check out the location information 

summary(dat)

## Let's say we are interested in specific relationships, like the race of someone who is pulled over

# this allows you to refer to categories in the "dat" dataframe without having to type "dat$category_name" each time, and instead just type "category_name"

attach(dat)


summary(subject_race)

#This will automatically do bar plots for categorical data
plot(subject_race)

##not the most informative plot
plot(subject_age)
## little bit better 
hist(subject_age)


# Let's say I'm interested in whether or not the race of a person influences whether or not an arrest is made:

#variable_name = lm(y~x1 + x2 + x3....etc, dataframe_name)
# ?lm wil tell you much more information about the linear model function

lin_model_race = lm(arrest_made~subject_race, dat)

##not surprising summary statistics (sadly)
summary(lin_model_race)

## examining age

#curious
lin_model_age1 = lm(arrest_made~subject_age, dat)
summary(lin_model_age1)

lin_model_age2 = lm(search_conducted~subject_age, dat)
summary(lin_model_age2)

#What does this suggest about policing in Oakland?
summary(lin_model_age2)











