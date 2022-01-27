# CSC 243-701
# Assignment 4 template
# Put your name here NIKHIL BHALALA

# Remember that you are not allowed to use online resources
# or tutors outside of CDM when completing assignments

# List your collaborator(s):Professor:SETTLE AMBER
#Q1 AND Q2
#Those two questions are very similar to problems we've done before. The course ID
#problem is similar to the social security number problem, and the
#viewLines problem is very similar (at least in the initial steps) to the
#payReport problem.
#So why don't you start by telling me what similarities you see between those
#two problems and how you might start on each?
#To access the line in the file in position index, you write: s(index) where
#the parentheses should be square brackets which my phone keyboard doesn't
#have
# your collaboration. If you did not collaborate with anyone,Q3 AND Q4 DO MYSELF
# please indicate that. One or the other statement is required.

# Include doc strings for full credit


# You can change the import statement if you like
#from random import *
import random
# Question 1
def getCourseID():
    'enter a valid course ID from the user and returns the ID as a string. '
    s=''
    while True:
        s = input('Enter a course ID:')
        if len(s)==6 and s.isalnum()and s[0:3].isalpha()and s[3:].isdigit():
            return s.upper()
        else:
            print('That dose not have a valid format.')
            print('It must start with three letters and end with three digits.')
            
    
    

# Question 2
def viewLines(fname):
    'viewLines() that takes a string representing a file name as a parameter and allows the user to repeatedly view lines in the file.'
    try:
        inf= open(fname ,'r')
        
    except:
         print(f'{fname} could not  be opened')
         return
        
    s =inf.readlines()
    if len(s)==0:
        print(f'{fname} is empty')
        return
    else:
        n= eval(input('Enter a line number(negative to stop):'))
        if n < 0:
            return
        
        elif n>=0:
            for line in s:
                if line == s[n]:
                    print(line)
                    return
                          
                    
        else:                                        
            print('That is not a vaild line number.Try again.')
                    
               
              
                          
                   
          
    
        
                    

# Question 3
  
def getRandomWords(fname, n):
    'returns a list of n random words chosen from the file.'
    lst=[]
    try:
        inf= open(fname, 'r')
    except:
        print(f'{fname} could not  be opened')
        return lst
    s=inf.read()
    if len(s)==0:
        print(f'{fname} is empty')
        return lst 
    
        
    else:
            for ch in',!?.;:':
                s= s.replace(ch,'')
                s= s.lower()
                wlst= s.split()
                if type(n)!= int or n<=0:
                    print(f'{n} is an invalid parameter.')
                    return lst
                val= random.sample(wlst, n)
                
    return val
                
        
    
    

# Question 4
def nameGame(lst):
    ' takes a list of strings representing names as a parameter and plays a guessing game with the user. '
    if len(lst)==0:
        print("I'm sorry , but I can't play a game with an empty list.")
    else:
            s= random.randrange(len(lst))
            #print(lst[s])
            while True:
                w= input('Enter your guess:')
                if w.casefold()==lst[s].casefold():
                    print('you got it! Thanks for playing.')
                    return
                else:
                    print("That's not it . Please try again.")
            
           
        


