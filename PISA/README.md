# PISA Data Analysis
## by Shubham Kumar


## Dataset

>Dataset is from PISA, which is the OECD's Programme for International Student Assessment. PISA measures 15-year-olds’ ability to use their reading, mathematics and science knowledge and skills to meet real-life challenges.
- PISA is a survey of students' skills and knowledge as they approach the end of compulsory education. It is not a conventional school test. Rather than examining how well students have learned the school curriculum, it looks at how well prepared they are for life beyond school.
- The PISA for Development initiative aims to encourage and facilitate PISA participation of interested and motivated low- and middle-income countries. Find out more about which countries are participating and it how it contributes to the Education Sustainable Development Goal for quality and equity of learning outcomes for children, young people and adults.

- Around 510,000 students in 65 economies took part in the PISA 2012 assessment of reading, mathematics and science representing about 28 million 15-year-olds globally. Of those economies, 44 took part in an assessment of creative problem solving and 18 in an assessment of financial literacy.

**More about PISA can be found [here](https://www.oecd.org/pisa/aboutpisa/).**

- **Dataset can be found [here](https://www.oecd.org/pisa/data/)**

- **Variable definations can be found [here](https://github.com/ZippySphinx/Investigating-Datasets/blob/master/PISA/pisadict2012.csv).**

> *The PISA-based Test for Schools provides school-level estimates of performance and information about the learning environment and students’ attitudes gathered from student questionnaires. Find out more and how schools and their networks can take part.*

- Features which will be helping me in investigation are : ***Scores of the subjects (Maths, Science, Reading), review scores by students on their parents attitudes and country.***

**I performed preliminary wrangling before analysis. Few things i had done are :**
- Checked for duplicates if any, then remove them
- Selecting only relevant data
- Changing columns to numeric and categorical data type.
- Renaming columns

***Wrangling** can be found [here](https://github.com/ZippySphinx/Investigating-Datasets/blob/master/PISA/pisa2012_data_wrangling.ipynb).*

## Summary of Findings

- **The average Score of Math is normally distributed with a peak at around 450.**
- **The average Score of Reading is normally distributed with a peak at around 500.**
- **The average Score of Science is normally distributed with a peak at around 500.**
- Most countries have between 5000 to 7000 students taking the survey. The boxplot also shows that there are a few outliers. For example, **Mexico and Italy have over 30,000 students and Liechtenstein has well below 1000 students.**
- *The graph is slightly skewed to the left showing that most students have a positive view of their parent's attitudes towards Mathematics.*
- **As the top nth percentile increases, the gender gap increases as well** i.e. Male is increasing as the percentile increases.
- **While most countries show an almost 50/50 split between gender, there are some countries like Mexico, Thailand and Israel that show an very uneven split.**
- *If we take a look at the top 10 countries with the most gender differences, 7 out of 10 countries are female dominated.*
- **The Female students has consistent high scores in all subjects(Maths, Science, Reading) than the Male students.**
- *It looks like the there is only a slight difference in male/female perception of their parent's towards mathematics. For both male and female, the 25%, 50%, and 75% are same.*
- **We see that only a slight amount of Male Students view their parent's having a higher perception of Mathematics.**
- *Males students have a high score under motivation, interest, and self. Female students seem to score higher under anxiety as well as work_ethic. There is only slight variation between scores of male and female.*
- **We can see that there is high correlation between scores of subjects and an significant correlation between attitudes.**
- *Almost all countries show the male students outweighing female students in motivation scores. This shows that male students are more motivated in some countries to their studies than females.
- Almost all of the countries show Males have a higher than average or similar axienty score compared to their females but in some countries females have more anxiety than male mainly in countries where most females are prevented from those.*
- *Females interest scores are higher in developed countries as compare to the countries where females still lack some major rights.*
- *Under Work Ethic, the females seem to score higher (or about the same) in proportion comparted to the males.*
- *Under behavior, females seem to have a higher score than male.*
- *Males have higher self scores than females.*
- **We can see clearly here that as the top percentile increases, so does the gender gap. Initially, the female proportion was higher (due to the fact that there was a slightly more female students taking the survey as compared to the male students). But by the time we arrived to the top (approximately) 20th percentile, the amount of female students was equal to the amount of male students. All throughout the increase of top percentiles, we see that the proportion of male students strictly increases as well. Notice that the further we get along the top percentile of students, the gender gap's increase accelerates.**
- **The average motivation score for males is consistently higher that the average motivation score for females.**
- **The average anxiety score for females is consistently higher than the average anxiety score for males. As the top percentile increases, - the anxiety scores for both gender decreases.**
- **The average interest score for males is consistently higher that the average interest score for females.**
- **The average work ethic score for females is consistently higher that the average work score for males.**
- **The average parent score for males is consistently higher that the average motivation score for females. Notice how there is a sharp dip in parent score for males students at around the 85th percentile.**
- **The average behavior score for males is consistently higher that the average behavior score for females.**
- **The average self score for males is consistently higher and a lot higher than the average self score for females. Note how there is a large gap between how females feel about themselves regarding their math skills as compared to how males feel about themselves in their math skills.**

## Key Insights

> Main focus of the analysis is how the gender and attitude affect students and their studies.

### Things we got from analysis :
- *Female students have higher scores than male studentsin many aspects however scores are low for females students for the countries where the gender of the child is still the problem like in Middle Eastern States.*
- *Students from the developed countries are doing well in their studies and have better scores than the other students in countries.*
- *Female students used to score themselves low as compared to male students respect to their attitude towards education.*
- *Self score of male students are lot higher than the female students.*
- *Also parents attitude towards male students are higher than the females.*
- *Female students scores lot high in anxiety than male counterparts.*
- *According to visuals parents score for the female student is similar to themale students but in some countries the scores are relatively low.*
- *There is high correlation between scores of mathematics, science and reading, this might be because some students are equally good at all subjects, but this is not always the case.*
- *Distribution of all the subject scores are normally distributed around 450.*
- *Gender gap increases as the top percentile of scores increases.*
- *Scores are low for developing countries and high for many european countries.*

Can be found [here](https://github.com/ZippySphinx/Investigating-Datasets/blob/master/PISA/pisa2012_data_analysis.pdf).

## Resources:
- [PISA](https://www.oecd.org/pisa/)
- [Frontier](https://www.frontiersin.org/articles/10.3389/fpsyg.2020.00884/full)
- [Factmaps](https://factsmaps.com/pisa-2018-worldwide-ranking-average-score-of-mathematics-science-reading/)

# Installations required:
- Python
- Jupyter Notebook
- Anaconda (Optional)
- Seaborn
- Matplotlib
- nbconvert(Optional)
- Numpy 
- Pandas
