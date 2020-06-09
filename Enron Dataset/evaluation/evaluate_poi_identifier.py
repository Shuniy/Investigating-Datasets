#!/usr/bin/python


"""
    Starter code for the evaluation mini-project.
    Start by copying your trained/tested POI identifier from
    that which you built in the validation mini-project.

    This is the second step toward building your POI identifier!

    Start by loading/formatting the data...
"""

from sklearn.metrics import precision_score, recall_score
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
import pickle
import sys
sys.path.append("D:/ud120-projects/")
from tools.feature_format import featureFormat, targetFeatureSplit

data_dict = pickle.load(open("final_project/final_project_dataset.pkl", "r") )

### add more features to features_list!
features_list = ["poi", "salary"]

data = featureFormat(data_dict, features_list)
labels, features = targetFeatureSplit(data)


### your code goes here

features_train, features_test, labels_train, labels_test = train_test_split(
    features, labels, test_size=0.3, random_state=42)
clf = DecisionTreeClassifier()
clf.fit(features_train, labels_train)
print (clf.score(features_test, labels_test))
#print(precision_score(labels_test, clf.predict(features_test), average=None))
#print(precision_recall_fscore_support(labels_test, clf.predict(features_test), average=None))
print (labels_test)
print (clf.predict(features_test))
