# Twitter(We Rate Dogs)
## by (Shubham Kumar)


## Dataset

> WeRateDogs is a Twitter account that rates people's dogs with a humorous comment about the dog. These ratings almost always have a denominator of 10. The numerators, though? **Almost always greater than 10. 11/10, 12/10, 13/10, etc.** Why? Because **"they're good dogs Brent."** WeRateDogs has over 4 million followers and has received international media coverage.

### Project Motivation
> Goal: Wrangle WeRateDogs Twitter data to create interesting and trustworthy analyses and visualizations. The Twitter archive is great, but it only contains very basic tweet information. Additional gathering, then assessing and cleaning is required for "Wow!"-worthy analyses and visualizations.

The WeRateDogs Twitter archive contains basic tweet data for all 5000+ of their tweets, but not everything. One column the archive does contain though: each tweet's text, which I used to extract rating, dog name, and dog "stage" (i.e. doggo, floofer, pupper, and puppo) to make this Twitter archive "enhanced." Of the 5000+ tweets, I have filtered for tweets with ratings only (there are 2356).



- **Dataset can be found [here](https://github.com/ZippySphinx/Investigating-Datasets/blob/master/WeRateDogs/twitter_archive_master.csv)**

- **Variable definations can be found [here](https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/tweet-object).**

> *Most interesting thing about WeRateDogs is they rate dogs on the scale of 10 with ratings usually higher than 10 and they created a name for every dog type depending on the age(i.e. doggo, floofer, pupper, and puppo). This gathered a lot of attention from public and media.*

- Main Features of the dataset are : ***Dog Stage, Dog breeds, Their activity, Dog names and their ratings.***

**I performed wrangling before analysis. Things i had done are :**
- Gathered data from many sources (Twitter, Servers and PDF's) and merged them.
- Cleaned the data.
- Performed neccessary steps to maintain data.

***You can find the wrangling steps and report [here](https://github.com/ZippySphinx/Investigating-Datasets/blob/master/WeRateDogs/wrangle_report.html).***

## Summary of Wrangling

### **Main objective of this project is to wrangle data from multiple sources.**

### Gathering Data
- *We collected data from the twitter using twitter api. To access twitter api, a twitter developer account is required and then twitter will provide api keys required to authorize a connection to the twitter. These keys are unique to every indivisual and are private. Sharing these keys are not allowed. After getting keys, we use **tweepy** library to access and authorize twitter api.* 

- *Then, after getting connection, twitter api transmits data into the form of json. So, **json** library is used to load and dump the received json data from the twitter api and save the data in the txt format.*

- *Now, the txt file should be loaded and converted into the pandas dataframe.*

- *We collected data with dog image predictions in it from the server using **request** library and loaded data into the dataframe using **bytesIO** library.*

### Assessing Data

Assess data for :

**Quality:** issues with content. Low quality data is also known as dirty data.

**Tidiness:** issues with structure that prevent easy analysis. Untidy data is also known as messy data. Tidy data requirements:
Each variable forms a column.
Each observation forms a row.
Each type of observational unit forms a table.
Types of assessment:

**Visual assessment:** scrolling through the data in your preferred software application (Google Sheets, Excel, a text editor, etc.).

**Programmatic assessment:** using code to view specific portions and summaries of the data (pandas' head, tail, and info methods, for example).

**``Twitter Api``**

- After doing visual assessment, we found out there are columns present with same data but different data types like id, in_reply_to_user_id etc.

- Source column contains html data.

- There are too many missing values in the columns.
- Entitied , extended entities and user columns contains data in the form of dictionary.
- After doing programmatic assessment,  we found the entities and extended entities columns are similar and contains media information which is useful.

- Entities, extended entities and user columns are of dictionary type.
- contributors, coordinates, geo, place, quoted status id, and quoted status id str all have 0 values present in them.
- favorited, truncated and retweeted column contains false values.
- Created_at column isn't in date-time format.
- possibly_sensitive and possibly_sensitive_appealable are all zero.
- Columns with no useful information are present.
- Datatypes of some column are not correct.
- Retweeted data is present.

**``Image Predictions Data``**

- p1, p2, p3 predicts dog type, and has unique values, therefore, it should contains categorical data.
- There are 66 tweets which have same url which means those are retweets.

**``Twitter Archives``**

- Dog names are not correct, correct names starts with Capital letter and incorrect data starts with small letter.

- Name has None instead of null value.

- Some ratings are wrong. Not all the denominators are 10 and numerators doesn't show exact ratings as it should be.

- timestamp should be changed to datatime format.

- Source column contains (a href=" ... "). It only contains one useful information that is : **client_used** to post the tweet.

- Contains retweeted data.

- **Multiple datasets** with same variables, should be combined together in one dataframe.
- Categories columns **doggo, floofer, pupper and puppo** should be in one column. ``Melt`` the data.

## Cleaning Data

**Types of cleaning:**

**Manual** (not recommended unless the issues are single occurrences).

**Programmatic**
The programmatic data cleaning process:
- **Define:** convert our assessments into defined cleaning tasks. These definitions also serve as an instruction list so others (or yourself in the future) can look at your work and reproduce it.
- **Code:** convert those definitions to code and run that code.
- **Test:** test your dataset, visually or with code, to make sure your cleaning operations worked.
- Always make copies of the original pieces of data before cleaning!

**To clean the data, first we have to make copy and store the dataframes into another dataframes. This can be done using ``.copy()`` function.** 

- We have to convert id column name into tweet_id to get the same reference from other dataframes. Can be done using pandas rename method.

- We have to create one dataset which contains data from multiple datasets with same primary key. To find primary key we used **reduce** library and intersection function.
-  This will give tweet_id as the common column therefore, we can merge the three dataframes into one using pandas merge function. But we have to drop the common column present in the other dataframe therefore, we removed 'source', 'in_reply_to_status_id', 'in_reply_to_user_id' from api data. We will be using inner join to merge data.
-  Now, we will melt the data to maintain the tidy data rules. We will create one categorical column for dog_stages.
- We will extract strings 'puppo', 'doggo', 'pupper', 'floofer' from their respective columns and then concatinate them into one string and replace blanks with null values. Then, we will seperate if there are more than one dog _stage for the dog. Then, we will drop the old columns with different dog stage.
- Next step is to remove the unneccessary columns with all False data or null data.
- After removing all the columns with null data, we have to extract the entities data and append the data into the dataframe and then drop the dictionary type data from the dataframe.
- Above step will keep the data with media information present, if the media information is not present the null values are appended using **numpy.nan**.
- Source column only contains one useful data that is which client was used to tweet. We will extract that by using string analysis and use functions like **__contains__** to check if the string is a substring of the source. After collecting the data it will be appended to the dataframe. Then the source column will be of no use and should be droped.
- Convert timestamp and created at column and change their format from string to datetime. Then, check if they contains same data, if they contains same data then delete timestamp column.

- Now removing retweeted data. Retweeted data can be recognized using retweeted status id or 'RT' at the start of every text. We can identify the rows with retweeted status id not null then, remove the retweeted data.

- Name columns cantains None as string instead of null values therefore null values should be converted to null values using **numpy.nan**.
- Name also contains data which are not names. This can be identified by seeing values, the real names of the dogs starts in the title case and false names start with small letter. We should remove the false names using **numpy.nan**. We can create a new list and append if the name is in title case if not then append null values, then replace the original name data with the list.
- Removing duplicates before automatically removed the tweets with same jpg_url. But since url column contains same data as media_urls and media_urls_https we remove both of them.

- We will extract ratings from the text column using regular expression and then append them into original numerator and denominator. It will be string and then we will convert them into float data type.
- Changing denominators to all 10 and then changing numerators to new values by using the ratios of numerator/denomiantor from previous data and multiplying them to new denominators. After that, there is only one problem left that is numerator greater than 20, this will be fixed by just dividing them with power of 10 as it occurs due to loss of decimal. This will create the data as expected from  the weratedogs.
- Finally converting None values in remaining columns to null values and changing p1, p2, p3 and client_used into a categorical data type.

### **Analyzed data report can be found [here](https://github.com/ZippySphinx/Investigating-Datasets/blob/master/WeRateDogs/act_report.html).**

### Things we got from analysis :
- **The most used dognames** are **Charlie, Lucy, Oliver, Penny and Cooper.** Other names such as Lola, Daisy, Winston, Sadie are also quiet popular.
- **Golden retrivers** are most favorites among the users with almost 1600000 favorites and the second and third popular breeds are labrador retrievers and pembrokes (about 1000000 favorites).
- There is a **linear relation** between favorited and retweeted.
- **WeRateDogs** was active in the month of january but their tweet count decreases as the time passes.
- **WeRateDogs** rated more **pupper** photos than other dog stage. They also rated doggo more than puppo and floofer. These are the names used by WeRateDogs.
- **Most used score** to rate a dog is 12 and 10. Seems like, they usually rate dogs with score between **10 to 13.**

## Resources:
- [Twitter](https://www.twitter.com/)
- [We Rate Dogs](https://twitter.com/dog_rates)

# Installations required:
- Python
- Jupyter Notebook
- Anaconda (Optional)
- Seaborn
- Matplotlib
- nbconvert(Optional)
- Numpy 
- Pandas
- Requests
- json
- tweepy
