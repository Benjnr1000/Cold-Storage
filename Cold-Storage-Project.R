# Environment Set up and Data Import

# Invoking Libraries
library(readr) # To import csv files
library(ggplot2) # To create plots
library(gridExtra) # To plot multiple ggplot graphs in a grid
library(car) # for Levenetest
library(dplyr) # To manipulate dataset
library(knitr) # Necessary to generate sourcecodes from a .Rmd File
library(markdown) # To convert to HTML
library(rmarkdown) # To convret analyses into high quality documents

# Set working directory
setwd("C:/Users/egwuc/Desktop/PGP-DSBA-UT Austin/Fundamental of Business Statistics/Week 4 - Project/")

# Read input file
cold_storage_temp <- read_csv("Cold_Storage_Temp_Data.csv")

# Read input file
cold_storage_mar <- read_csv("Cold_Storage_Mar2018.csv")

# Global options settings 
options(scipen = 999) # turn off scientific notation like 1e+06

# Variable identification
# check dimension of dataset 
dim(cold_storage_temp)

# check first 6 rows(observations) of dataset
head(cold_storage_temp)

# check last 6 rows(observations) of dataset
tail(cold_storage_temp)

# change season and month to factor variable
cold_storage_temp$Season <- as.factor(cold_storage_temp$Season)
cold_storage_temp$Month <- as.factor(cold_storage_temp$Month)

# get summary of dataset
summary(cold_storage_temp)

# view the dataset
View(cold_storage_temp)

# Variable identification
# check dimension of dataset 
dim(cold_storage_mar)

# check first 6 rows(observations) of dataset
head(cold_storage_mar)

# check last 6 rows(observations) of dataset
tail(cold_storage_mar)

# change season and month to factor variable
cold_storage_mar$Season <- as.factor(cold_storage_mar$Season)
cold_storage_mar$Month <- as.factor(cold_storage_mar$Month)

# get summary of dataset
summary(cold_storage_mar)

# view the dataset
View(cold_storage_mar)

# Population graph
histogram_coldstoragetemp <- hist(cold_storage_temp$Temperature, xlab = "Temperature", main = "Cold Storage Temperature")
boxplot_coldstoragetemp <- boxplot(cold_storage_temp$Temperature, ylab = "Temperature", main = "Cold Storage Temperature", horizontal = TRUE)

# Sample graph
histogram_coldstoragemar <- hist(cold_storage_mar$Temperature, xlab = "Temperature", main = "Cold Storage Temperature")
boxplot_coldstoragemar <- boxplot(cold_storage_mar$Temperature, ylab = "Temperature", main = "Cold Storage Temperature", horizontal = TRUE)

mean_of_season <- cold_storage_temp %>% group_by(Season) %>% summarise(Mean.Temperature = mean(Temperature))
print(mean_of_season)

mean_of_fullyear <- mean(cold_storage_temp$Temperature)
print(mean_of_fullyear)

sd_of_fullyear <- sd(cold_storage_temp$Temperature)
print(sd_of_fullyear)

prob_below_2C <- pnorm(2, mean = mean_of_fullyear, sd = sd_of_fullyear)
print(prob_below_2C)

prob_above_4C <- 1 - pnorm(4, mean = mean_of_fullyear, sd = sd_of_fullyear)
print(prob_above_4C)

penalty <- prob_below_2C + prob_above_4C
print(penalty)
if(penalty > 0.025 && penalty < 0.05) {
  print("Penalty is 10%")
} else if(Penalty > 0.05) {
  print("Penalty is 25%")
} else {
  print("No need to pay penalty")
}

# Apply one-way ANOVA
aovOutput <- aov(Temperature ~ Season, data = cold_storage_temp)
summary(aovOutput)

# Pairwise comparisons
TukeyHSD(x = aovOutput, conf.level = 0.95)

mu = 3.9
a = 0.90
# Null Hypothesis H0: E[Temperature] <= 3.9
# Alternative Hypothesis H1: E[Temperature] > 3.9

mean_of_sample <- mean(cold_storage_mar$Temperature)
print(mean_of_sample)

sd_of_sample <- sd(cold_storage_mar$Temperature)
print(sd_of_sample)

std_error <- sd_of_sample / (sqrt(35))
print(std_error)

z_test <- (mean_of_sample - mu) / std_error
print(z_test)

# Finding the critical value
z_critical <- qnorm(0.90)
print(z_critical)

# P-value of z
pnorm(z_test, lower.tail = FALSE)

t_test <- t.test(cold_storage_mar$Temperature, mu = 3.9, conf.level = 0.90, alternative = "greater")
print(t_test)

#======================================================================= 
# 
# T H E - E N D 
# 
#=======================================================================

# Generate the .R file from this .Rmd to hold the source code 

purl("Cold-Storage-Project.Rmd", documentation = 0)
