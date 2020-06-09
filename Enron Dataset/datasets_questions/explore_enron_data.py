#!/usr/bin/python

"""
    Starter code for exploring the Enron dataset (emails + finances);
    loads up the dataset (pickled dict of dicts).

    The dataset has the form:
    enron_data["LASTNAME FIRSTNAME MIDDLEINITIAL"] = { features_dict }

    {features_dict} is a dictionary of features associated with that person.
    You should explore features_dict as part of the mini-project,
    but here's an example to get you started:

    enron_data["SKILLING JEFFREY K"]["bonus"] = 5600000
"""

import pickle
import sys
sys.path.append("D:/ud120-projects/")
from tools.feature_format import featureFormat

names = []
features = []
enron_data = pickle.load(
	open("final_project/final_project_dataset.pkl", "rb"))

for people in enron_data:
	names.append(people)
	features.append(enron_data[people])

print (features[0][])
#data = featureFormat(names,features)
#print(data)

# Loading a text file and displaying it

poiNames = open("../final_project/poi_names.txt", "r").readlines()
print(poiNames)

#calculating number if NaN email address in the data
tot = 0
nan = 0
for people in enron_data:
	if (enron_data[people]["poi"] == 1):
		tot = tot + 1
		if (enron_data[people]["total_payments"] == "NaN"):
			nan = nan+1
print(nan)
print(tot)
print(nan/tot)



#calculating total payment of executives
print(enron_data["SKILLING JEFFREY K"]["total_payments"])
print(enron_data["LAY KENNETH L"]["total_payments"])
print(enron_data["FASTOW ANDREW S"]["total_payments"])
