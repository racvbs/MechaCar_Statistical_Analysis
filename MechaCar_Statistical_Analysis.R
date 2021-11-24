# import libraries
library(dplyR)
library(tidyverse)
library(validate)
library(GGally)

# MechaChar - (1)

mechaCar_data <- read.csv('D:/Dropbox/Cursos/Bootcamp/Module 15 - Challenge/MechaCar_Statistical_Analysis/MechaCar_mpg.csv')

# Head view of the data
head(mechaCar_data)

# Get the columns names
colnames(mechaCar_data)

# Generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechaCar_data) 

#generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechaCar_data)) 

# It's multivaribale regression plot. Library GGally
ggpairs(mechaCar_data) 

# Suspension Coil - (2)

suspension_data <- read.csv('D:/Dropbox/Cursos/Bootcamp/Module 15 - Challenge/MechaCar_Statistical_Analysis/Suspension_Coil.csv')

# Head view of the data
head(suspension_data)

# Get the columns names
colnames(suspension_data)

# Create a data frame with statics info
total_summary <- suspension_data %>% group_by() %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# Create a data frame with statics info with group by
lot_summary<- suspension_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))


# Test t-test - (3)

# One sample t-test
t.test(x=suspension_data$PSI,mu=1500)

# Different samples t-test

t.test(subset(suspension_data, Manufacturing_Lot=='Lot1')$PSI, mu=1500)

t.test(subset(suspension_data, Manufacturing_Lot=='Lot2')$PSI, mu=1500)

t.test(subset(suspension_data, Manufacturing_Lot=='Lot3')$PSI, mu=1500)