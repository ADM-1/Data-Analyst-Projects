#!/usr/bin/env python
# coding: utf-8

# # BMI CALCULATOR (in Centimeters and kilograms)

# In[1]:


name = input("Insert your name: ")

weight = int(input("Insert your weight in kilograms: "))

height = int(input("Insert your height in centimeters: "))

BMI = weight / (height/100)**2

print(BMI)

if BMI>0:
    if(BMI<18.5):
        print(name +", you are underweight.")
    elif (BMI<=24.9):
        print(name +", you are normal weight.")
    elif (BMI<29.9):
        print(name +", you are overweight.")
    elif (BMI<34.9):
        print(name +", you are obese.")
    elif (BMI<39.9):
        print(name +", you are severely obese.")
    else:
        print(name +", you are morbidly obese.")
else:
    print("Enter valid input")
    

             


# In[ ]:





# In[ ]:





# In[ ]:





# In[4]:





# In[ ]:





# In[ ]:





# In[ ]:



