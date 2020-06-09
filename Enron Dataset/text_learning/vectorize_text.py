#!/usr/bin/python

from sklearn.feature_extraction import text
from sklearn.feature_extraction.text import TfidfVectorizer, TfidfVectorizer
import os
import pickle
import re
import sys

sys.path.append("D:/ud120-projects/")
from tools.parse_out_email_text import parseOutText

"""
    Starter code to process the emails from Sara and Chris to extract
    the features and get the documents ready for classification.

    The list of all the emails from Sara are in the from_sara list
    likewise for emails from Chris (from_chris)

    The actual documents are in the Enron email dataset, which
    you downloaded/unpacked in Part 0 of the first mini-project. If you have
    not obtained the Enron email corpus, run startup.py in the tools folder.

    The data is stored in lists and packed away in pickle files at the end.
"""


from_sara  = open("text_learning/from_sara.txt", "r")
from_chris = open("text_learning/from_chris.txt", "r")

from_data = []
word_data = []

### temp_counter is a way to speed up the development--there are
### thousands of emails from Sara and Chris, so running over all of them
### can take a long time
### temp_counter helps you only look at the first 200 emails in the list so you
### can iterate your modifications quicker
temp_counter = 0


for name, from_person in [("sara", from_sara), ("chris", from_chris)]:
    for path in from_person:
        ### only look at first 200 emails when developing
        ### once everything is working, remove this line to run over full dataset
        temp_counter += 1
        #if temp_counter < 20000000000:
        print(path)
        path = os.path.join('..', path[:-1])
        print (path)
        print(path[:-1])
        email = open(path, "r")
        ### use parseOutText to extract the text from the opened email
        text_from_email = parseOutText(email)
        ### use str.replace() to remove any instances of the words
        ### ["sara", "shackleton", "chris", "germani"]

        edit_one = text_from_email.replace("sara", "")
        edit_two = edit_one.replace("shackleton", "")
        edit_three = edit_two.replace("chris", "")
        edit_four = edit_three.replace("germani", "")
        edit_five = edit_four.replace("sshacklensf", "")
        edit_six = edit_five.replace("cgermannsf", "")
        ### append the text to word_data
        word_data.append(edit_six)

        ### append a 0 to from_data if email is from Sara, and 1 if email is from Chris
        if name == "sara":
            from_data.append(0)
        else:
            from_data.append(1)
        email.close()

print ("emails processed")
from_sara.close()
from_chris.close()

pickle.dump( word_data, open("your_word_data.pkl", "wb") )
pickle.dump( from_data, open("your_email_authors.pkl", "wb") )


### in Part 4, do TfIdf vectorization here
sw = text.ENGLISH_STOP_WORDS
vectorizer = TfidfVectorizer(stop_words=sw)
a = vectorizer.fit_transform(word_data)
y = vectorizer.get_feature_names()
print(len(y))
print(y[34597])
