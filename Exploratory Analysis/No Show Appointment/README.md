# Investigate No Show Medical Appointments Dataset

## Introduction

*The dataset under investigation is a collection of information from 100k medical appointments in Brazil and is focused on the question of whether or not patients show up for their appointment.*


***Data wrangling Procedures and work can be found [here](https://github.com/ZippySphinx/Investigating-Datasets/blob/master/Exploratory%20Analysis/No%20Show%20Appointment/No_Show_Appointment.ipynb).***

## Conclusions

- Patient age was charted to see if there was a large difference between the no-shows and shows segments. The mean age of the no-shows segment was 34 compared to the shows segment which was 38. No significant differences to note.
- Patient health desigations were charted to see if there was a large difference between the no-shows and shows segments. Hypertension was the largest category in both segments due to the popularity of the designation. No correlations to note.
- Neighborhood in which the appointment took place was charted to see if certain areas saw higher no-show rates. JARDIM CAMBURI and MARIA ORTIZ were the Top 2 neighborhoods in both the no-shows and shows segments. This is likely due to the population of these neighbhorhoods. It would be worth see if there is any statistical significance in the rate of no shows across different regions.
- The proportion of no-shows was nearly double when an SMS message was NOT sent to the patient before their appointment day. There is a correlation between SMS messaging and appointment show rate. It would be worth performing additional analyses to understand how strong this correlation is.
- Timeframe between schedule date and apppointment date was investigated to see if there was any correlation with show rates. The mean timeframe between schedule date and appointment date for no-shows was significantly higher than shows. The show rate was better if the appointment was booked fewer days from the appointment date. There is a correlation between the number of days out and appointment show rate; it would be worth performing additional analyses to understand how strong this correlation is.
- Appointment no-shows occurred the most on Tuesdays and the least on Thursdays. Overall, appointments early in the week have a higher no-show rate. It's difficult to draw any conclusions from this but could be run through a regression analysis to better understand which other show rate influencer day of week correlates with.
- Appointment no-shows are increasing at a higher rate than appointment shows. Performing a regression analysis could provide insight into which factors are impacting appointment show rates the most.


### Packages Used
- Numpy
- Pandas
- Python3
- Matplotlib
- datetime
