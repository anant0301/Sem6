#!/usr/bin/env python
# coding: utf-8

# ## PROBLEM SET (MapReduce & SPARK)

# In[29]:


import sys
import os
os.environ['SPARK_HOME'] = '/opt/spark'
# SparkContext is available as sc and HiveContext is available as sqlContext.
sys.path.append('/opt/spark/python')
sys.path.append('/opt/spark/data')


# In[14]:


import findspark
findspark.init()


# In[17]:


from pyspark import SparkContext as SC
sc = SC('local')


# 1. For the given input file, calculate Wordcount using Hadoop MapReduce and Spark. Also, develop an equivalent conventional program (without spark RDDs) and compare the time taken by the two versions.

# In[18]:


import time


# In[19]:


start_time = time.time()
from collections import Counter
with open("./WordCount input.txt", "r") as fp:
    word_count = Counter([word.lower() for line in fp.readlines() for word in line.strip().split(" ")])
    print(word_count)
print("--- %s seconds ---" % (time.time() - start_time))    


# In[45]:


start_time = time.time()
text_file = sc.textFile("../data/wordcount.txt")
counts = text_file.flatMap(lambda line: line.split(" "))\
                    .map(lambda word: (word, 1))\
                    .reduceByKey(lambda a, b: a + b)
output = counts.collect()
print(output)
print("--- %s seconds ---" % (time.time() - start_time))    


# 2. Consider two 10*10 matrix and perform Matrix Multiplication using Hadoop Mapreduce and Pyspark. (Note: matrix elements can be randomly populated)
# 

# In[ ]:





# 3. Randomly populate 1000 numbers and calculate mean, variance, standard deviation for the generated data.
# 

# In[ ]:





# 4. Compute correlation between the given two series using Pearson’s and Spearman’s Method. (Use the Spark MLlib libraries and helper functions available)
#     * Series A: 35, 23, 47, 17, 10, 43, 9, 6, 28
#     * Series B: 30, 33, 45, 23, 8, 49, 12, 4, 31
# 

# In[ ]:





# 5. Remove Stop words from the ‘sentence’ column given in the “StopWordRemoval_input” document.
# 

# In[ ]:





# 6. In the given input file, binarize the column ‘E’ (fifth column). Set the threshold as 2.5
# 

# In[ ]:


# 7. a. Randomly generate 10k numbers and apply the following functions on the generated random numbers. Also, develop an equivalent conventional program (without spark RDDs) and compare the time taken by the two versions.
# Exponential Function, f1(x)=e x
# Logarithmic Function, f2(x)=log(x)
# Square root Function, f3(x)= √x
# Square function, f(4)=x 2
# 7. b. Extension to the previous question: Instead of printing transformed values for all 10k words, print transformed values of the first 100 numbers only. Also, develop an equivalent conventional program (without spark RDDs) and compare the time taken by the two versions.

