# Investigate Soccer Database

## Introduction

*This datasource is from Kaggle-European Soccer Database. It contains data for soccer matches, players, and teams from several European countries from 2008 to 2016.*

Dataset can be found [here](https://www.kaggle.com/hugomathien/soccer).

*The data consists of following:*
>- +25,000 matches
>- +10,000 players
>- 11 European Countries with their lead championship
>- Seasons 2008 to 2016
>- Players and Teams' attributes* sourced from EA Sports' FIFA video game series, including the weekly updates
>- Team line up with squad formation (X, Y coordinates)
>- Betting odds from up to 10 providers
>- Detailed match events (goal types, possession, corner, cross, fouls, cards etc...) for +10,000 matches

***Data wrangling Procedures and work can be found [here](https://github.com/ZippySphinx/Investigating-Datasets/blob/master/Exploratory%20Analysis/Soccer%20Database/Investigate_Soccer_Database.ipynb).***

## Conclusions

- Team Celic, Manchester United and Juventus are the top teams with high points over time which include all points and goals from all the seasons of the European Championship when played as home team.

- Team FC Bayern Munich, Celic and Juventus are the top teams with high points over time which include all points and goals from all the seasons of the European Championship when played as away team.

- Teams which have shown great improvement over time are : Celic, FC Bayern Munich and Manchester United.

- Player Rickie Lambert has the highest number penalities(96).

- The relationship of vision and free kick_accuracy is positively and highly correlated.

- Among many attributes of players, Potential of player has a strong postive correlation with player's overall rating.

### Packages Used
- Numpy
- Pandas
- Python3
- Matplotlib
- Seaborn
- sqlite3