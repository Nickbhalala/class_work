# CSC 243-701
# Assignment 7 template
# Put your name here NIKHIL BHALALA

# Other than pythontutor.com you are not allowed to use any online
# resources when completing assignments. You may not use the live
# tutoring part of pythontutor.com, only the visualization tool.

# List your collaborator(s)[Professor SETTLE AMBER]:Q3,Q4,Q2 ,[DEV]:Q2 and  {DEV ,JAMES}:Q4

# either directly or indirectly)
# If you did not collaborate with anyone, say that
# Files without the above information will earn a 0

# Include doc strings for full credit

# The functions for this assignment must be recursive, cannot use global
# variables, and cannot use any loops. Do not change the headers below in
# any way. Only use the functions allowed for each problem. Do not create
# any helper functions.

# Question 1
def countDict(lst):
    'returns the number of dictionaries in the list. '
    if len(lst)==0:
        return 0
    elif type(lst[0])==dict:
         return 1+ countDict(lst[1:])
    elif type(lst[0])==list:
        return lst[0]+ countDict(lst[1:])
    else:
         return  countDict(lst[1:])
        
             
            

# Question 2
def hasPosNum(lst):
    ' returns True if lst has at least one positive number (either integer or floating point) and False if the list has no positive numbers.'
    if len(lst)==0:
        return False
    elif type(lst[0])==list:
        num=hasPosNum(lst[0])
        if num==True:
            return True
        else:
            hasPosNum(lst[1:])
    elif type(lst[0])==int or type(lst[0])==float:
        if lst[0]>0:
            return True
        else:
            return hasPosNum(lst[1:])
    else:
        return hasPosNum(lst[1:])
        
       
    
    

# Question 3
def maxLenD(lst):
    ' returns the length of the biggest dictionary found in the list.'
    if len(lst)==0:
        return 0
    elif type(lst[0])==dict:
        d= 1+ maxLenD(lst[1:])
        return max(d, len(lst[0]))
    elif type(lst[0])==list:
        return maxLenD(lst[0])+maxLenD(lst[1:])
    else:
        return maxLenD(lst[1:])
    
    
        
          
                     
          
         
    

# Question 4
def getAllSetElem(lst):
    ' returns a set that contains all of the items in all the sets found in the list '
        
    if len(lst)==0:
        return set()
    elif type(lst[0])==list:
         if lst[0] ==set:
             
             set1= lst[1]
             set1.update(getAllSetElem2(lst[1:]))
             return set1
         else:
            
            return getAllSetElem2(lst[1:])
             
                                            
           
        
    elif type(lst[0])==set:
        
         st=lst[0]
        
         st.update(getAllSetElem2(lst[1:]))
         
         
        
         return st
    else:
        return getAllSetElem2(lst[1:])


