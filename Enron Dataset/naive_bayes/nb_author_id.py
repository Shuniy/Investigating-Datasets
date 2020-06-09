#!/usr/bin/python

"""
    This is the code to accompany the Lesson 1 (Naive Bayes) mini-project.

    Use a Naive Bayes Classifier to identify emails by their authors

    authors and labels:
    Sara has label 0
    Chris has label 1
"""

import sys
from time import time
sys.path.append("D:/ud120-projects/")
from tools.email_preprocess import preprocess

### features_train and features_test are the features for the training
### and testing datasets, respectively
### labels_train and labels_test are the corresponding item labels
features_train, features_test, labels_train, labels_test = preprocess()

# Naive_Bayes

from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score

classifier = GaussianNB()
ini_time = time()

classifier.fit(features_train, labels_train)

print("training time: ", round(time() - ini_time, 3), "s")

final_time = time()

pred = classifier.predict(features_test)

print("testing time: ", round(time() - final_time, 3), "s")

print("Accuracy of the test is : ", accuracy_score(pred, labels_test))
