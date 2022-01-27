# CSC 243-701
# Assignment 1 template
# Nikhil Bhalala


# when completing assignments
#i only collaborator with: 	 
# Professor: Amber Settle
# about question number 4
#1.You have to check if the list is non-empty first. Only input the number and do the for loop if the list is non-empty. A list is non-empty if its length isn’t 0.

#2. You need to loop through the list nlst, not use a range function.

#3. Inside the loop you should only print the item if it’s larger than n.


# and rest of question i do myself

# List your collaborator(s) here (no more than four other people)
# Include a comment that provides significant details about each
# person's contribution to the assignment

# If you did not collaborate with anyone, place a comment in the
# file indicating that

# Files without this information will earn a 0

# Include doc strings for full credit
# A doc string is a string that appears below the header for a function
# It's not the same thing as a comment
# Ask if you don't know what I mean

# Question 1
def computeK():
    'input a  temperature in fahrrenheit from the user and return temperature in Kelvin'

    f=eval(input('Enter a temperature in Fahrenheit: '))
    k=((f-32)*(5/9))+(273.15)
    return k
    

# Question 2
def repeat_word(word):
    'input a number from the user and return str*that number'
    s=int(input('Enter a no-negavtive(>=0) whole number: '))
    return s*word

# Question 3
def sequences():
    ' print a sequences'
    for num in range(10, 51, 10):
        print(num , end=" ")
    print("")
    for num in range(21, 70, 3):
        print(num ,end=" ")
    print("")
    for num in range(39,11,-3):
        print(num ,end=" ")
    
          

# Question 4
def printAllLarger(nlst):
    'input a number (either integer or floating point), and then prints all of the numbers in the list that are larger than the value entered by the user, one per line.'
    n=eval(input('Enter a number: '))
    for i in nlst:
        if i > n:
            print(i)
    
    

# Question 5
def printNth(lst):
    'input a whole number at  n index that nth element will print from a list'
    n= int(input( 'Enter a whole number:' ))
    for i in lst[n]:
        print(i, end="")
    
    
