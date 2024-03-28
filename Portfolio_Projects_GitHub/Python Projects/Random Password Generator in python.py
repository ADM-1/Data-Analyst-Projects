#!/usr/bin/env python
# coding: utf-8

# # Random Password Generator in python

# In[10]:


import random

# Asking user for the length of the password to be generated
while True:
    try:
        pass_len = int(input("Enter the length of the password: "))
        break  # If the input can be converted to an integer, break the loop
    except ValueError:
        print("Invalid input. Enter an integer value.")

# Characters and symbols to generate a random password
pass_data = "qwertyuiopasdfgjklzxcvbnm1234567890!@#$%^&*_+?"

# Using random.sample() to collect random data from pass_data as a list & 
# using .join() to join the list elements to form a string 

password = "".join(random.sample(pass_data, pass_len))

print(password)




# In[ ]:





# In[ ]:





# In[ ]:





# In[ ]:




