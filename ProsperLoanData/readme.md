# Prosper Loan Data Analysis
## by (Shubham Kumar)


## Dataset

>Dataset is from Prosper, which is America’s first marketplace lending platform, with over $7 billion in funded loans. This data set contains 113,937 loans with 81 variables on each loan, including loan amount, borrower rate (or interest rate), current loan status, borrower income, borrower employment status, borrower credit history, and the latest payment information.

- **Prosper** has been using its own rating system, represented in the loans dataset by the variable ProsperRating, which allegedly has two components: ProsperScore and CreditScore. According to Prosper, ProsperScore **was built using historical Prosper data to assess the risk of Prosper borrower listings** and CreditScore, which is provided by a reporting agency. Prosper has been using the data available in its dataset, either for Personal Data or Credit Information on the borrowers, to evaluate the ProsperScore of the borrowers, based on a model created with past data.

- **Dataset can be found [here](https://s3.amazonaws.com/udacity-hosted-downloads/ud651/prosperLoanData.csv)**

- **Variable definations can be found [here](https://docs.google.com/spreadsheets/d/1gDyi_L4UvIrLTEC6Wri5nbaMmkGmLQBk-Yx3z0XDEtI/edit#gid=0).**

> *Most interesting thing about Prosper is they give certain ratings to people according to their profile and accounts. I want to know more about this rating system, its significance and how it affects the people.*

- Main Features of the dataset are : ***ProsperRatings, Prosper Scores, Occupations, Loans Listing Category, Borrower Rates, Borrowers Annual Percentage Rate, Borrowers Monthly Income, Loan Amount and Monthly Loan Payments by the Borrowers.***

- Features which will be helping me in investigation are : ***Prosper Ratings, Prosper Score and Loan details including Occupations, Loan amount and payments by the borrowers.***

**I performed preliminary wrangling before analysis. Few things i had done are :**
- Checked for duplicates if any, then remove them
- Converting listing category_numeric to their actual values.
- Changing columns to numeric and categorical data type.
- Renaming columns
- Selecting columns with numerical and categorical data for analysis.

## Summary of Findings

- Distribution of the Prosper Scores is interesting as it has kind of 3 Modes. We can find more about these values in bivariate analysis. There are many columns in the dataset which should not be used, also I have to change Listing Category_numeric to their original values and many columns to Categorical data.
- *Distribution of Employment status, might contain redundant data as the Employed Status might contain Full Time and Part time and other things like Firemen or social service people etc.*
- *As checked before the Others data contains the data of Students, Firemen, Plumber etc who don't have fixed amount of earning every month. So, most of the time others data will provide a high bar. No, i didn't remove anything because seperating the others profession will reduce the credibility of the category who don't have fixed incomes also this will create more shorter proportions and create outliers in the plots.*
- *Prosper Ratings are assigned by considering many factors of the person which includes Employment Status, Occupation, Loan Amount and affects many factors also including Number of Investors, Loan Amount, Borrower Rates in direct or indirect manner. **Prosper Ratings are correlated with many variables** including High rates, Monthly laon payments and how much amount to give to an indivisual. **Brorrower Rates are directly proportional to the Annual Percentage rate**.*
- *Prosper use to give loans at **low rates only to the people with low risk profile** and **occupation matters** as equal to the Ratings, which means people with high income pay more monthly payments which are also dependent on type of Occupation. Students take loans only for debt consolidation and People with stable income has high chances of getting loans at lower interest rate. Studens have less loans as compared to the Professionals.*
- *Prosper Ratings has a significant relationship with borrower rates and loan amounts as better rating means low borrower rates and low annual percentage rate. Also, higher the Term duration lower the low monthly payments of the loan amounts which also means that higher Term peroid has low risk profiles i,e better prosper ratings. Loan amounts are higher for the people who have their own homes which assures the security to prosper.*  
- *As, Term affects the monthly loan payments as higher the Term lower the monthly payment, however there is no good relation between Term and interest rates of the loan. Interest are uniform for all Terms and 12 months peroid are choosen by very less amount of people or they are the people with high risk profile.*

## Key Insights for Presentation

> Main focus of the analysis is how the Prosper ratings affect people and their loans. I checked that prosper score is the major criteria for prosper ratings and prosper ratings affect almost every aspect of the loan, from Investors to loan amounts everything. I, then checked how Term, loan amount and rates affect each other and what are the relations between them. For more findings, i checked how occuaptions and listing categories of loans are connected to the variables.

### Things we got from analysis :
- *Prosper uses its **rating system (Prsoper Rating)** in its every decision and it depends on the **person credit score which they take from credit reporting agency and prosper score**.*
- **Prosper scores** *are the major factor for **prosper ratings**.*
- *Prosper Ratings help in deciding Loan Amount, Term, Borrower Rates and APR, Monthly loan Payment and Investors.*
- *Higher the risk of the candidate **higher the borrower rates and APR** will be, this might depends on the person's **occupation and current financial status including home owner status**.*
- *People with good profile use to get **low interest rates and more investors**. These people might have the occuaption with stable and high income.*
- *Doctors and Judges make high **monthly loan payments** as compare to **students, plumbers and firemen.** This might also be related with loan amount which is also related to prosper ratings.*
- ***Higher the peroid of loan, lesser will be the monthly loan payments, however this might not depend on the interest rates as compared with term.***
- *More loans are taken for **debt consolidation, followed by business and home improvements**.*
- *People with **median salaries or income took the most loans**.*
- *People living in vast towns such as **California, New York and Texas** took the most loans as these states consists more professionals and population.*

## Resources:
- [Prosper](https://www.prosper.com/)
- [LendAcadamy](https://www.lendacademy.com/prosper-review/)
- [Prosper Ratings and Score](https://www.prosper.com/invest/how-to-invest/prosper-ratings/?mod=article_inline)

# Installations required:
- Python
- Jupyter Notebook
- Anaconda (Optional)
- Seaborn
- Matplotlib
- nbconvert(Optional)
- Numpy 
- Pandas
