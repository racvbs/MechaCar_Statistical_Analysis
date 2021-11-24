# import libraries
library(dplyR)
library(tidyverse)
library(validate)
library(GGally)

# Delivery 1
# Read MechaCar_mpg.csv
mechaCar_data <- read.csv('D:/Dropbox/Cursos/Bootcamp/Module 15 - Challenge/MechaCar_Statistical_Analysis/MechaCar_mpg.csv')

# Head view of the data
head(mechaCar_data)

# Get the columns names
colnames(mechaCar_data)

# Generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechaCar_data) 

#generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechaCar_data)) 

## It's multivaribale regression plot. Library GGally
ggpairs(mechaCar_data) 

# Delivery 2
# Read Suspension_Coil.csv
suspen_data <- read.csv('D:/Dropbox/Cursos/Bootcamp/Module 15 - Challenge/Suspension_Coil.csv')

# Head view of the data
head(suspen_data)

# Get the columns names
colnames(suspen_data)

# Create a data frame with statics info
total_summary <- suspen_data %>% group_by() %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# Create a data frame with statics info with group by
lot_summary<- suspen_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))


# Delivery3

# One sample t-test
t.test(x=suspen_data$PSI, mu=1500)

# Different samples t-test

# Lot1
t.test(subset(suspen_data, Manufacturing_Lot=='Lot1')$PSI, mu=1500)

# Lot2
t.test(subset(suspen_data, Manufacturing_Lot=='Lot2')$PSI, mu=1500)

# Lot3
t.test(subset(suspen_data, Manufacturing_Lot=='Lot3')$PSI, mu=1500)