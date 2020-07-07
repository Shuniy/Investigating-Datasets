# Citi Bike Data Analysis
## by (Shubham Kumar)

## Introduction

>**Citi Bike** *is a privately owned **public bicycle sharing system** serving the **New York City** boroughs of the **Bronx, Brooklyn, Manhattan, and Queens, as well as Jersey City, New Jersey**. Named after lead sponsor **Citigroup**, it is operated by Motivate (formerly Alta Bicycle Share), with former Metropolitan Transportation Authority CEO Jay Walder as chief executive until September 30th, 2018. When the company was acquired by **Lyft.** The system's bikes and stations use **BIXI-branded technology from PBSC Urban Solutions**.*
- **First proposed in 2008** *by the **New York City Department of Transportation**, Citi Bike's scheduled 2011 opening was delayed by Hurricane Sandy and technological problems. It officially opened in May 2013 with 332 stations and 6,000 bikes. Annual expansions have brought the totals to 706 stations and 12,000 bikes as of October 2017, making the service the largest bike sharing program in the United States. Further expansions for Citi Bike are planned to extend its service area across the Bronx, Brooklyn, Manhattan, and Queens, and increase the number of bikes to 40,000.*

- *As of July 2017, there are **130,000 annual subscribers.** Citi Bike riders took an average of **48,315 rides per day in 2018**, and the system reached a total of **50 million rides** in October 2017.*
- ***The bikes are available for use 24 hours/day, 7 days/week, 365 days/year and riders have access to all bikes in the network when they become a member or purchase a pass.***

***Data can be found [here](https://www.citibikenyc.com/system-data).***


- Main Features of the dataset are : ***Trip Duration, Start time, longitude and latitude, places, distance and Gender.***

- Features which will be helping me in investigation are : ***Gender, Age, Start Time, Distance calculated from Latitude and Longitude, Trip duration and Months.***

**I performed preliminary wrangling before analysis. Few things i had done are :**
- Checked for duplicates if any, then remove them
- Converting variables to their actual data types.
- Changing columns to numeric, object and categorical data type.
- Renaming columns
- Selecting columns with numerical and categorical data for analysis.
- Added multiple columns for analysis.

***All the steps can be found [here](https://github.com/ZippySphinx/Investigating-Datasets/blob/master/Citi%20Bike/Citi_Bike.ipynb).***

## Summary of Findings

***Citi Bikes is a A fun and affordable way to get around town:***
>- Environmentally friendly, budget friendly, and lifetsyle friendly. 
- Subscribers (i.e. daily commuters) benefit from a health commuting choice
- Customers (i.e. tourists, students, etc.) have a sustainable, yet flexible option for touring the city.
- Affordable and convenient transportation for the people of all socioeconomic classes

- *Renting a bike from Citi Bike System is a healthy and environmentally friendly way of moving around in the city, both for enjoyment and work. There are two types of clients using the system: Subscribers and Customers. Subscribers are primarily daily commuters, having short trips to and from work, who rent a bike on weekdays **at 8-9am and 5-6pm**, and, occasionally around lunch time. Customers are usually tourists or occassional riders who use the system mainly on weekends to explore the New York.*
- ***Males are using Citi Bike system more than the females.***
- ***Also Older people are using the bikes equally as the young people. Most of the young people comes from the age groups from 30-40, by which we can say that they are working professionals and using bikes for travelling to workplace.***

***More can be found [here](https://github.com/ZippySphinx/Investigating-Datasets/blob/master/Citi%20Bike/Citi_Bike_Slide_Deck.slides.html).***

## Key Insights for Presentation

> *Main focus of the analysis is how the Citi bikes are performing among the people.*

### Things we got from analysis :
- *Summer and Winter months are more popular of bike riding, which is because in winters people mainly use bikes to complement travel with the exercise, as we can see January and February has high number of bike trips than trips reduced in March and April as summer approaches. Then number of trips increases as May contains vacations for many people therefore, people used the service to spend their free time.*
- ***The data is almost uniform, which suggests that weekdays might not have anything to do with number of trips. However, there are more trips on Sundays maybe because of holiday.***
- *The bikes are most used in the evening around 5 - 6 PM which makes sense as at that time many people go out for a walk, or meet people or for exercise. Also, exercise and walk in park also occurs in the morning therefore, there are lots of trips in the morning around 7-8 AM.*
- *The average trip is just under 10 minutes, with 75% of trips being under 14 minutes. Looking at the histogram, most rides fall in between the 3 - 11 minute range. This suggests riders are taking the bikes short distances.*
- *The mean distance traveled is 0.98 miles, with 75% of rides being 1.34 miles or less. Looking at the histogram above a majority of the rides fall under 2 miles, with over half of those 1 mile of less.*
- *The mean age of a user is 39 years old. As a reminder, in the cleaning portion of this data set all users over the age of 75 were removed. The histogram shows the majority of users fall between the ages of 25 - 40 years, which is also the same age range of working adults. However, people at 52-55 also used most of the bikes.*
- *The overwhelming majority of users of the bike share system are male, representing 72% of the total users.*
- *The majority of users for the Citi Bike System almost 80 % are Subscribers i.e. customers who subscribe to the monthly membership. Customers pay by trip which is 3 dollars per trip.*
- *Customers: demand is high around summertime, reaching its peak in May. Customers are most probably tourists, or the occasional riders who visit the New York.*
- *Subscribers: the highest demand is from January to March, with it's peak in January. Subscribers are most likely riders using the bikes for their daily commute and exercise.*
- *Customers have a relatively low usage of the bike share system with a small increase on the weekends. Subscribers are the opposite - there is steadily high usage on weekdays, with a sharp decline on the weekend.*
- *The average distance traveled by customers is slightly higher than subscribers but almost same around 0.96 Km. Customers use has low total distance travelled as compared to subscribers which makes sense as subsrcibers use this as a daily means of travelling and customers might be the people who use it occasionally.*
- *Customer typically have trip durations are longer (5 to 18 minutes according to the box plot) than for subscribers (2 to 12 minutes according to the box plot). This can probably be explained by the fact that subscribers are mainly commuters who take short trips to work/school rather than longer trips around the New York.*
- *Both user type graphs show the high number of people in their 30s falling within both catgoires. Subscribers have a wider range of ages while Customers tends to have mostly older people with age of 51 while the Subscriber user group is more spread out between varying ages with plenty of users in their thirties.*

## Resources:
- [Citi Bike Data Set](https://www.citibikenyc.com/system-data)
- [Haversine formula](https://www.movable-type.co.uk/scripts/latlong.html) used to calculate distances using latitude and longitude
- [Seaborn catplot](https://seaborn.pydata.org/generated/seaborn.catplot.html) documentation
- [IPython Display](https://ipython.org/ipython-doc/3/api/generated/IPython.display.html)
- [Citi Bikes](https://www.citibikenyc.com/)

# Installations required:
- Python
- Jupyter Notebook
- Anaconda (Optional)
- Seaborn
- Matplotlib
- nbconvert(Optional)
- Numpy
- Pandas
