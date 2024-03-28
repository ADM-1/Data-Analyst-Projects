#!/usr/bin/env python
# coding: utf-8

# # Simple Calculator in Python

# In[1]:


# Calculus funcions 

def add(num1, num2):
    return num1 + num2

def subtract(num1, num2):
    return num1 - num2

def multiply(num1, num2):
    return num1 * num2

def divide(num1, num2):
    return num1 / num2

# Main calculator program

while True:
    print("Please select operation:")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")
    print("5. Exit Calculator")

    # Take input from the user
    select = int(input("Select operation (1/2/3/4/5): "))

    if select ==  5:
        break

    number_1 = float(input("Insert first number: "))
    number_2 = float(input("Insert second number: "))

    if select ==  1:
        print(number_1, "+", number_2, "=", add(number_1, number_2))
    elif select ==  2:
        print(number_1, "-", number_2, "=", subtract(number_1, number_2))
    elif select ==  3:
        print(number_1, "*", number_2, "=", multiply(number_1, number_2))
    elif select ==  4:
        if number_2 !=  0:
            print(number_1, "/", number_2, "=", divide(number_1, number_2))
        else:
            print("Error: You cannot divide by zero.")
    else:
        print("Invalid input. Only valid numerical inputs are accepted.")


# In[ ]:





# In[ ]:




