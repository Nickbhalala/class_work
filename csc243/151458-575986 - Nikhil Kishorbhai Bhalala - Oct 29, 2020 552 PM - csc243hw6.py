# CSC 243-701
# Assignment 6 template
# Put your name here:NIKHIL BHALALA

# Other than pythontutor.com you are not allowed to use any online
# resources when completing assignments. You may not use the live
# tutoring part of pythontutor.com, only the visualization tool.

# List your collaborator(s):[Professor SETTLE AMBER]-Q5 AND DEV-Q3 FOR SETUP indent+2 
##The else seems fine. I’m concerned about the if statement. You should be checking a single character,
##not the entire string. And you should
##be adding a character onto a recursive call, not returning the entire string.
# either directly or indirectly)
# Include a clear and detailed explanation of each person's work
# If you did not collaborate with anyone, say that
# Files without the above information will earn a 0

# Include doc strings for full credit

# The functions for this assignment must be recursive, cannot use global
# variables, and cannot use any loops. Do not change the headers below in
# any way. Only use the functions allowed for each problem. Do not create
# any helper functions.

# Question 1
def recRange(k, n):
    'hat takes two integers k and n as parameters and prints the numbers from k up to n'
    if k<=n:
        print(k)
        recRange(k+1, n)
        

# Question 2
def printEven(n):
    ' takes an integer n as a parameter and prints the even numbers from n to zero to the screen one per line followed by the string "Done!".'
    
    if n<=-1:
        print('Done!')
    elif n%2==0:
        print(n)
        printEven(n-2)
    else:
        print(n-1)
        printEven(n-2)
        
        

# Question 3
def printPlatform(n, indent):
    'that takes two integers as parameters and prints a platform of askterisks using those parameters level of the platform decreases the number of asterisks on each side by 2'
    if n>0:
        printPlatform(n-4, indent+2)
        print(' '*indent,'*'*n)

# Question 4
def recRT(c1, c2, n, indent):
    'takes two characters and two integers n and indent as parameters and prints an indented triangle pattern that represents half of an hour glass pattern using the characters.'
    if n>0:
        print(' '*indent,c1*n)
        recRT(c1, c2, n-1, indent+1)
        print(' '*indent,c2*n)
        
        
    
    

# Question 5
def getDigits(s):
    ' returns a new string consisting of the digits found in the string s. A digit is one of 0 through 9.'
    if len(s)==0:
        return ''
    else:
        if s[0].isdigit():
            
            nw=s[0]+ getDigits(s[1:])
            return nw
        
        else:
            news=getDigits(s[1:])
            return news
    
   
      
        
    
        
    
