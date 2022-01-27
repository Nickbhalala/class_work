# CSC 243-701
# Assignment 5 template
# Put your name here NIKHIL BHALALA

# Remember that you are not allowed to use online resources
# or tutors outside of CDM when completing assignments

# List your collaborator(s)Q1,Q2,Q3[Professor SETTLE AMBER] AND Q3 [DEV,JAME ECKERMANN]
# your collaboration. If you did not collaborate with anyone,
# please indicate that. One or the other statement is required.
##I think you’ve taken the wrong approach for the first question. You want to create an empty dictionary.
##Then loop through the parameter dictionary to get the keys in voteDict. If voteDict[key] is already in
##the new dictionary, you increase its value by 1. Otherwise you add it to the dictionary.
##
## 
##
##In the second problem, both the try and the except need to be inside the loop.
##You don't want any for loop in this problem.
##You can find out if a key is in a dictionary using "in" and y
##ou can access a value by using the key as an "index".
##
##You need to check if what the user enters is a key
##in the dictionary before trying to access the value.
##
##I don't know why you're creating a new dictionary.
##
##And please remove the else:pass. Can you see that is useless?

 
# Include doc strings for full credit


# All of the functions should use loops.
# None of the functions should use recursion.

# You can change the import statement if you wish
import random 

# Question 1
def recordVotes(voteDict):
    'returns the voteDict[key] new dictionary.'
    newd={}
    for key in voteDict:
        voteDict[key]=voteDict[key].casefold()
##        newd[voteDict[key]]=key
        if voteDict[key]in newd:
            newd[voteDict[key]]+=1
        else:
               newd[voteDict[key]]=1
    return newd
        
    

# Question 2
def makeRDict(lst, num):
    'returns a dictionary with keys taken from lst and values that are random numbers based on num.'
    d={}
    for key in lst:
        
        try:
        
            d[key]=val = random.randint(1,num)
        except:
            pass
    return d
            
    

# Question 3
def updateVote(voteDict):
    ' update the dictionary.'
    done= False
    while not done:
        key=input('Enter a name:')
       
        if key==" ":
            done=True
        elif key in voteDict:
             print(key, 'is current voting for',voteDict[key])
             voteDict[key]= input('enter the new vote:').lower()
             
                
           
        else:
            ("I'm sorry, but that choice did not vote")
    return voteDict

  

            
                
            
                
