getwd()
setwd("D:/DataScience/Data Analyst Nanodegree/Weather Trend")

# Include Libraries
library(tseries)
library(forecast)
library(ggplot2)

# Loading City Data
city_data <- read.csv("city_data.csv", header = TRUE)

summary(city_data)

#Subsetting only New Delhi, London, Barcelona and Berlin Data
city_data_new_delhi <- subset(city_data, city_data$city == 'New Delhi' & city_data$country == 'India')
city_data_london <- subset(city_data, city_data$city == 'London' & city_data$country == 'United Kingdom')
city_data_barcelona <- subset(city_data, city_data$city == 'Barcelona' & city_data$country == 'Spain')
city_data_berlin <- subset(city_data, city_data$city == 'Berlin' & city_data$country == 'Germany')

# Removing data with no values
city_data_new_delhi <- subset(city_data_new_delhi, !is.na(city_data_new_delhi$avg_temp))
city_data_london <- subset(city_data_london, !is.na(city_data_london$avg_temp))
city_data_barcelona <- subset(city_data_barcelona, !is.na(city_data_barcelona$avg_temp))
city_data_berlin <- subset(city_data_berlin, !is.na(city_data_berlin$avg_temp))

#Loading global Data
global_data <- read.csv("global_data.csv", header = TRUE)

# Taking only neccessary data
city_data_new_delhi <- city_data_new_delhi[c("year", "avg_temp")]
city_data_london <- city_data_london[c("year", "avg_temp")]
city_data_barcelona <- city_data_barcelona[c("year", "avg_temp")]
city_data_berlin <- city_data_berlin[c("year", "avg_temp")]

# Summary of the data to be analyzed
summary(city_data_new_delhi)
summary(city_data_london)
summary(city_data_barcelona)
summary(city_data_berlin)
summary(global_data)

# Making Plot for rough observations and references
plot(global_data$year, global_data$avg_temp, main = "Global Data Temperature")
lines(global_data$year, global_data$avg_temp, col="red", lwd=2)

plot(city_data_new_delhi$year, city_data_new_delhi$avg_temp, main = "New Delhi Data Temperature")
lines(city_data_new_delhi$year, city_data_new_delhi$avg_temp, col="green", lwd=1)

plot(city_data_london$year, city_data_london$avg_temp, main = "London Data Temperature")
lines(city_data_london$year, city_data_london$avg_temp, col="purple", lwd=1)

plot(city_data_barcelona$year, city_data_barcelona$avg_temp, main = "Barcelona Data Temperature")
lines(city_data_barcelona$year, city_data_barcelona$avg_temp, col="pink", lwd=1)

plot(city_data_berlin$year, city_data_berlin$avg_temp, main = "Berlin Data Temperature")
lines(city_data_berlin$year, city_data_berlin$avg_temp, col="blue", lwd=1)

# Creating a repetition of 7 for taking moving avergae of 7 years
f7 <- rep(1/7,7)

# Creating moving average temperature for global data
global_data$moving_avg_temp <- filter(global_data$avg_temp, f7, sides = 2)

#Creating moving average for cities data
city_data_new_delhi$moving_avg_temp <- filter(city_data_new_delhi$avg_temp, f7, sides=2)
city_data_london$moving_avg_temp <- filter(city_data_london$avg_temp, f7, sides=2)
city_data_barcelona$moving_avg_temp <- filter(city_data_barcelona$avg_temp, f7, sides=2)
city_data_berlin$moving_avg_temp <- filter(city_data_berlin$avg_temp, f7, sides=2)

# Creating moving average plot for global data
gplot1 <- ggplot(data = global_data, aes(global_data$year, global_data$moving_avg_temp))
gplot1 <- gplot1 + geom_line(size = 1, col = "darkcyan") + labs(title = "Moving Line Plot of Global Data", x = "Year", y = "Moving Average Temperature")
gplot1 <- gplot1 + geom_smooth(method = "lm", se = FALSE, col = 'red')
gplot1

#Creating moving average plot for new delhi's data
gplot2 <- ggplot(data = city_data_new_delhi, aes(city_data_new_delhi$year, city_data_new_delhi$moving_avg_temp))
gplot2 <- gplot2 + geom_line(size = 1, col = "orange4") + labs(title = "Moving Line Plot of New Delhi Data", x = "Year", y = "Moving Average Temperature")
gplot2 <- gplot2 + geom_smooth(method = "lm", se = FALSE, col = 'red')
gplot2

#Creating moving average plot for new london's data
gplot3 <- ggplot(data = city_data_london, aes(city_data_london$year, city_data_london$moving_avg_temp, color = "purple"))
gplot3 <- gplot3 + geom_line(size = 1, col = "green4") + labs(title = "Moving Line Plot of London Data", x = "Year", y = "Moving Average Temperature")
gplot3 <- gplot3 + geom_smooth(method = "lm", se = FALSE, col = 'red')
gplot3

#Creating moving average plot for new Barcelona's data
gplot4 <- ggplot(data = city_data_barcelona, aes(city_data_barcelona$year, city_data_barcelona$moving_avg_temp))
gplot4 <- gplot4 + geom_line(size = 1, col = "darkblue") + labs(title = "Moving Line Plot of Barcelona Data", x = "Year", y = "Moving Average Temperature")
gplot4 <- gplot4 + geom_smooth(method = "lm", se = FALSE, col = 'red')
gplot4

#Creating moving average plot for berlin's data
gplot5 <- ggplot(data = city_data_berlin, aes(city_data_berlin$year, city_data_berlin$moving_avg_temp))
gplot5 <- gplot5 + geom_line(size = 1, col = "purple3") + labs(title = "Moving Line Plot of Berlin Data", x = "Year", y = "Moving Average Temperature")
gplot5 <- gplot5 + geom_smooth(method = "lm", se = FALSE, col = 'red')
gplot5
