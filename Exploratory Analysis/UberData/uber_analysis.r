# Importing libraries
library(ggplot2)
library(ggthemes)
library(lubridate)
library(dplyr)
library(tidyr)
library(DT)
library(scales)

# Colors to be used
colors = c("#CC1011", "#665555", "#05a399", "#cfcaca", "#f5e840", "#0683c9", "#e075b0")

# Changing column names
column_names = c('timestamp', 'latitude', 'longitude', 'base')

# Loading data sets
april_data <- read.csv(file.path(getwd(), 'datasets/uber-raw-data-apr14.csv'), stringsAsFactors = FALSE, col.names = column_names)
may_data <- read.csv(file.path(getwd(), 'datasets/uber-raw-data-may14.csv'), stringsAsFactors = FALSE, col.names = column_names)
june_data <- read.csv(file.path(getwd(), 'datasets/uber-raw-data-jun14.csv'), stringsAsFactors = FALSE, col.names = column_names)
july_data <- read.csv(file.path(getwd(), 'datasets/uber-raw-data-jul14.csv'), stringsAsFactors = FALSE, col.names = column_names)
august_data <- read.csv(file.path(getwd(), 'datasets/uber-raw-data-aug14.csv'), stringsAsFactors = FALSE, col.names = column_names)
september_data <- read.csv(file.path(getwd(), 'datasets/uber-raw-data-sep14.csv'), stringsAsFactors = FALSE, col.names = column_names)

# Summary of data sets
summary(april_data)
summary(may_data)
summary(june_data)
summary(july_data)
summary(august_data)
summary(september_data)

# Checking if data can be merged
(names(april_data) == names(may_data)) == ((names(june_data) == names(july_data)) == (names(august_data) == names(september_data)))

# identical function can also be used 
# identical(april_data, may_data) but it might not work as they both are different dataframes and have different properties, use identical with names

# Can be merged, we will use row binding
six_months_data = rbind(april_data, may_data, june_data, july_data, august_data, september_data)

#Clearing workplace
rm(april_data, may_data, june_data, july_data, august_data, september_data)

# Converting date time column into date time format and separating time
six_months_data$timestamp <- as.POSIXct(six_months_data$timestamp, format = "%m/%d/%Y %H:%M:%S")

six_months_data$time <- format(as.POSIXct(six_months_data$timestamp, format = "%m/%d/%Y %H:%M:%S"), format = "%H:%M:%S")

six_months_data$timestamp <- ymd_hms(six_months_data$timestamp)

# Adding some columns
six_months_data$day <- factor(day(six_months_data$timestamp))
six_months_data$month <- factor(month(six_months_data$timestamp, label = TRUE))
six_months_data$year <- factor(year(six_months_data$timestamp))
six_months_data$weekday <- factor(wday(six_months_data$timestamp, label = TRUE))

six_months_data$hour <- factor(hour(hms(six_months_data$time)))
six_months_data$minute <- factor(minute(hms(six_months_data$time)))
six_months_data$second <- factor(second(hms(six_months_data$time)))

# Trips by hour
hour_data <- six_months_data %>% group_by(hour) %>%
                            dplyr::summarize(Total = n())

datatable(hour_data)

ggplot(hour_data, aes(hour, Total)) + 
    geom_bar( stat = "identity", fill = "steelblue", color = "orange") +
    ggtitle("Trips Every Hour") +
    theme(legend.position = "none") +
    scale_y_continuous(labels = comma)

# Trips by Hour by month
month_hour <- six_months_data %>% group_by(month, hour) %>%
    dplyr::summarize(Total = n())

ggplot(month_hour, aes(hour, Total, fill = month)) + 
    geom_bar( stat = "identity") +
    ggtitle("Trips by Hour and Month") +
    scale_y_continuous(labels = comma)

# Trips by day 
day_data <- six_months_data %>% group_by(day) %>% 
            dplyr::summarize(Total = n())

datatable(day_data)

ggplot(day_data, aes(day, Total)) + 
    geom_bar( stat = "identity", fill = "steelblue") +
    ggtitle("Trips by Day") +
    theme(legend.position = "none") +
    scale_y_continuous(labels = comma)

# Trips by day and month
day_month_group <- six_months_data %>%
    group_by(month, day) %>%
    dplyr::summarize(Total = n())

ggplot(day_month_group, aes(day, Total, fill = month)) + 
    geom_bar( stat = "identity") +
    ggtitle("Trips by Day and Month") +
    scale_y_continuous(labels = comma) +
    scale_fill_manual(values = colors)

# Number of trips by months
month_group <- six_months_data %>%
    group_by(month) %>%
    dplyr::summarize(Total = n()) 
datatable(month_group)

ggplot(month_group, aes(month, Total, fill = month)) + 
    geom_bar( stat = "identity") +
    ggtitle("Trips by Month") +
    theme(legend.position = "none") +
    scale_y_continuous(labels = comma) +
    scale_fill_manual(values = colors)

month_weekday <- six_months_data %>%
    group_by(month, weekday) %>%
    dplyr::summarize(Total = n())

ggplot(month_weekday, aes(month, Total, fill = weekday)) + 
    geom_bar( stat = "identity", position = "dodge") +
    ggtitle("Trips by Day and Month") +
    scale_y_continuous(labels = comma) +
    scale_fill_manual(values = colors)

# Number of trips by bases
ggplot(six_months_data, aes(base)) + 
    geom_bar(fill = "blue") +
    scale_y_continuous(labels = comma) +
    ggtitle("Trips by Bases")


ggplot(six_months_data, aes(base, fill = month)) + 
    geom_bar(position = "dodge") +
    scale_y_continuous(labels = comma) +
    ggtitle("Trips by Bases and Month") +
    scale_fill_manual(values = colors)

ggplot(six_months_data, aes(base, fill = weekday)) + 
    geom_bar(position = "dodge") +
    scale_y_continuous(labels = comma) +
    ggtitle("Trips by Bases and Weekday") +
    scale_fill_manual(values = colors)

# Heat map
day_and_hour <- six_months_data %>%
    group_by(day, hour) %>%
    dplyr::summarize(Total = n())

datatable(day_and_hour)

ggplot(day_and_hour, aes(day, hour, fill = Total)) +
    geom_tile(color = "white") +
    ggtitle("Heat Map by Hour and Day")

ggplot(day_month_group, aes(day, month, fill = Total)) +
    geom_tile(color = "white") +
    ggtitle("Heat Map by Month and Day")

ggplot(month_weekday, aes(weekday, month, fill = Total)) +
    geom_tile(color = "white") +
    ggtitle("Heat Map by Month and Day of Week")


month_base <-  six_months_data %>%
    group_by(base, month) %>%
    dplyr::summarize(Total = n()) 

day_of_week_bases <-  six_months_data %>%
    group_by(base, weekday) %>%
    dplyr::summarize(Total = n()) 

ggplot(month_base, aes(base, month, fill = Total)) +
    geom_tile(color = "white") +
    ggtitle("Heat Map by Month and Bases")

ggplot(day_of_week_bases, aes(base, weekday, fill = Total)) +
    geom_tile(color = "white") +
    ggtitle("Heat Map by Bases and Day of Week")

ggplot(day_of_week_bases, aes(base, weekday, fill = Total)) +
    geom_tile(color = "white") +
    ggtitle("Heat Map by Bases and Day of Week")

# Map visualizations of rides in New York
min_lat <- 40.5774
max_lat <- 40.9176
min_long <- -74.15
max_long <- -73.7004

ggplot(six_months_data, aes(x = longitude, y = latitude)) +
    geom_point(size = 1, color = "blue") +
    scale_x_continuous(limits = c(min_long, max_long)) +
    scale_y_continuous(limits = c(min_lat, max_lat)) +
    theme_map() +
    ggtitle("NYC Map based on UBER Rides (APR-SEP)")

ggplot(six_months_data, aes(x = longitude, y = latitude, color = base)) +
    geom_point(size = 1) +
    scale_x_continuous(limits = c(min_long, max_long)) +
    scale_y_continuous(limits = c(min_lat, max_lat)) +
    theme_map() +
    ggtitle("NYC Map based on UBER Rides (APR-SEP) by Base")