#!/usr/bin/python

""" 
    This is the code to accompany the Lesson 2 (SVM) mini-project.

    Use a SVM to identify emails from the Enron corpus by their authors:    
    Sara has label 0
    Chris has label 1
"""
from sklearn.metrics import accuracy_score
from sklearn.svm import SVC
import sys
from time import time
sys.path.append("D:/ud120-projects/")
from tools.email_preprocess import preprocess


### features_train and features_test are the features for the training
### and testing datasets, respectively
### labels_train and labels_test are the corresponding item labels
features_train, features_test, labels_train, labels_test = preprocess()

c = 0
classifier = SVC(kernel='rbf', C = 10000.0)

features_train = features_train[:len(features_train)//100] #changing to 1% of total train features
labels_train = labels_train[:len(labels_train)//100]  # changing to 1% of total train labels

ini_time = time()
classifier.fit(features_train, labels_train)
print ("training time:", round(time()-ini_time, 3), "s")

final_time = time()

pred = classifier.predict(features_test)
print ("Testing time:", round(time()-final_time, 3), "s")
print(accuracy_score(pred, labels_test))

for x in pred:
	if x == 1:
		c = c+1
print(c)
