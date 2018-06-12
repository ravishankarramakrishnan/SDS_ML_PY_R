# Importing the Libraries

import nltk
import string
import re
from nltk.corpus import stopwords
from nltk.stem.snowball import SnowballStemmer
from nltk.tokenize import sent_tokenize
from nltk.tokenize import word_tokenize
import numpy as np
import pandas as pd
import docx2txt

# Importing the job Description Dataset
data = open('desc.txt').read()

# Importing the Resume dataset
# Change Resume(x) to get the similarity of JD and CV
import docx2txt
resume = docx2txt.process("Resume 1.docx")

# Defining the Description functions
def clean_desc(data):
  data =data.replace('\t', ' ').replace('\n', ' ')
  for punctuation in string.punctuation:
     data = data.replace(punctuation, ' ')
     data = data.split()

# Removing Stopwords/Stemming
   clean_desc = []
   stemmer = SnowballStemmer("english")
   for word in data:
      if word not in stopwords.words('english') and not word.isdigit():
         clean_desc.append(word.lower()) # Converts Caps to lowercase & append to empty list
      final = ' '.join(clean_desc)       # Joins all splitted words

# Defining the Resume functions
def clean_res(resume):
  resume = resume.replace('\t', ' ').replace('\n', ' ')
  for punctuation in string.punctuation:
     resume = resume.replace(punctuation, ' ')
     resume = resume.split()

# Removing Stopwords/Stemming
   clean_res = []
   stemmer = SnowballStemmer("english")
   for word in resume:
      if word not in stopwords.words('english') and not word.isdigit():
         clean_res.append(word.lower())
      res1 = ' '.join(clean_res)

      
# Using Corpus to find similarity between resumes
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import euclidean_distances
corpus = [final,res1]          

# Vectorizing (Converting Text to numbers so Computer can Understand)
# Comparing Job Description to Resume
vectorizer = CountVectorizer()
features = vectorizer.fit_transform(corpus).todense()
print(vectorizer.vocabulary_ )

for f in features:
   print(euclidean_distances(features[0],f))   # Comparing the inbetween distances 

'''
Other Method i tried 

'''
# Using For Loop and putting two lists
list1 = [final]

# List of string
list2 = [res1]

#Checking Result for for loop
result =  all(elem in list1  for elem in list2)

if result:
    print("Yes, list1 contains all elements in list2")    
else :
    print("No, list1 does not contains all elements in list2")
    

# Thank You!
