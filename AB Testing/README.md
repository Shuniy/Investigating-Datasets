# Analyze A/B Test Results

## Introduction
***A/B testing (also known as split testing) is a process of showing two variants of the same web page to different segments of website visitors at the same time and comparing which variant drives more conversions.***

>- We will be working to understand the results of an A/B test run by an e-commerce website. 
>- We have to help the company understand if they should implement the new page, keep the old page, or perhaps run the experiment longer to make their decision.

**We will be doing testing in Three Parts :**
- Probability
- A/B Testing
- Regression

**Procedure and work can be found [here](https://github.com/ZippySphinx/Investigating-Datasets/blob/master/AB%20Testing/Analyze_ab_test_results_notebook.ipynb).**

## Summary

### Probablity
**Is there sufficient evidence to conclude that the new treatment page leads to more conversions?**

- The Probability of converting regardless of page is: 0.1196
- Individual received the control page, the probability of converting is: 0.1204
Individual received the treatment page, the probability of converting is: 0.1188
- The probability of receiving the new page which is also treatment group is: 0.5001 ~ 0.5
- The probability of receiving the old page which is also control group is: ~ 0.5
- Probability that the new treatment leads to more conversion can be found using bayes rule which means : Probabilty that conversion happened and it is because new treatment page

> P(conversions|Treatment) = 0.4966 ~ 0.5.

***This means chances of conversions due to control group is more than the convertions due to new treatment page which is 49.6%. Since 12% of times the conversion occurs and chances of conversion due to new treatment page is less than conversion due to control group therefore, we don't have enough evidence that new page treatment leads to more conversion.***

### A/B Testing

- Notice that because of the time stamp associated with each event, We could technically run a hypothesis test continuously as each observation was observed.

However, then the hard question is do we stop as soon as one page is considered significantly better than another or does it need to happen consistently for a certain amount of time? How long do we run to render a decision that neither page is better than another?

These questions are the difficult parts associated with A/B tests in general.

For now, consider we need to make the decision just based on all the data provided. If we want to assume that the old page is better unless the new page proves to be definitely better at a Type I error rate of 5%, what should null and alternative hypotheses be? We can state our hypothesis in terms of words or in terms of p_old and p_new, which are the converted rates for the old and new pages.

 **$$H_{0}: p_{new} - p_{old} <= 0$$**

**$$H_{1}: p_{new} - p_{old} > 0$$**

Assume under the null hypothesis, $p_{new}$ and $p_{old}$ both have "true" success rates equal to the **converted** success rate regardless of page - that is $p_{new}$ and $p_{old}$ are equal. Furthermore, assume they are equal to the **converted** rate in **ab_data.csv** regardless of the page. <br><br>

- ***In our, p-value is 0.89 which is greater than 0.05, therefore, we failed to reject the null hypothesis which means conversion rate of new pages is less than the conversion rate of old pages. It also means old pages did better than the new pages.***

- ***We could also use a built-in to achieve similar results. Though using the built-in might be easier to code, the above portions are a walkthrough of the ideas that are critical to correctly thinking about statistical significance.***
- ***use `stats.proportions_ztest` to compute your test statistic and p-value.  [Here](https://docs.w3cub.com/statsmodels/generated/statsmodels.stats.proportion.proportions_ztest/) is a helpful link on using the built in.***
- **Here stats is the Z- stats and pvalue is the p-value from the z-test.**

[Z Test](https://www.investopedia.com/terms/z/z-test.asp)

- Z-Test assumes the distribution to be normal. The z-score  is a number representing how many standard deviations above or below the mean population a score derived from a z-test is.
- If the value of z is greater than 1.96 or less than -1.96, the null hypothesis is rejected.

***The z-score we get here is 1.3109 which is less than 1.95 and p-value we get here is 0.9050 which is closer to the p-value we found 0.899 in part j and greater than 0.05. So, these values do agree to j. and k. This means, we fail to reject the null hypothesis, so the old pages perform better than new pages.***

### Regression

***Since each row is either a conversion or no conversion, what type of regression should we be performing in this case?***

- This case is of binary outcomes, a logistic regression should be performed.

- The goal is to use statsmodels to fit the regression model you specified in part a. to see if there is a significant difference in conversion based on which page a customer receives.

***p-value here is 0.1899. This p-value is the result from the two sided test and we performed one sided test in Z-Test in A/B Testing.***

- The null hypothesis in Z-Test was the conversion rate of new page is lower than the conversion rate of old page and alternate hypothesis was conversion rate of new page is higher than conversion rate of older page.

- In Regression, the hypothesis are different. Here the conversion rate is dependent on the ab_page. ab_page contains data whether the group is treatment or control which also means the page was new page or old page.

**Here,**

>*H0 (null hypothesis ) : There is no relationship between the two variables
H1 (alternative hypothesis): There exist a relationship between the two variables.*
- *The smaller the p-value means the more confident you are about the existence of relationship between the two variables.
In our case, p-value is greater therefore, there is no significant relationship between the converted and ab_page. This means the conversion of page is not much dependent on the ab_page or the groups.*

*Since, conversion of the page didn't depend on the ab_page, we have to consider other factors and variables in our regression model.*

**Factors to be considered in our regression model should be : **timestamp.**
The day of the week, time, gender, income, environment (if this data would be available) may affect the conversion rate.**

- The conversion rate depending on the group and landing page didn't work well because, there may be change aversion or novelty effect taking place among the people.

>- **Change Aversion** : Change aversion is the negative short-term reaction to changes in a product or service.
> - **Novelty effect** : The novelty effect, in the context of human performance, is the tendency for performance to initially improve when new technology is instituted, not because of any actual improvement in learning or achievement, but in response to increased interest in the new technology.

**Disadvantages of adding additional terms is:**
>- Multicollinearity (Could be solved using VIF)
>- Increased complexity

## Conclusion

***According, to analysis using **Probability, hypothesis testing and regression models**, we have enough evidence that company should keep the old page and not to implement the new page as we have failed to reject our null hypothesis in every statistics which is old page performed better than new page.***

### Packages Used
- Numpy
- Pandas
- Python3
- Matplotlib
- statsmodel.api