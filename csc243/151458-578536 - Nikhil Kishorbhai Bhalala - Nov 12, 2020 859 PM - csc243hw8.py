# CSC 243-701
# Assignment 8 template
# Put your name here NIKHIL BHALALA

# Other than pythontutor.com you are not allowed to use any online
# resources when completing assignments. You may not use the online
# help on pythontutor.com only the visualization tool.

# List your collaborator(s) [Professor SETTLE AMBER]:[Q2,Q3]
#dave,ben,james we work together very problem
#
##The search() function we did in class may be helpful here.
##Then you need to have a variable assigned at the top of the function. It will
##be used to count the number of subdirectories inside of path. If the number
##of subdirec
##tories in path is at least n, then you can return it at the end of
##the function.

##I also recommend that you have two variables. One variable will be a total
##
##that you’re going to return in the end. The other will be a count of the 
##number of files inside the current directory. You need the second variable so
##that you can decide if you need to adjust the total variable before you
##return it


# directly or indirectly) and clearly state how you worked with them
# If you did not collaborate with anyone, say that
# Files without the above information will earn a 0

# Include doc strings for full credit

# The first three functions must be recursive and may not use global
# variables. You may not define any helper functions or modify the
# header of the functions in any way.
# The last function will not use recursion at all.

# You can change the import statement if you like
import os

# Question 1
# This function must be recursive and should use a loop
# Note that the function needs to have a variable that is set at
# the top of the function, modified in the body of the function,
# and involved in the return statement ONLY at the END
def uniqueDirs(path):
    ' returns a list of all the unique directories found inside the file system located at or below the parameter.'
    lst=[]
    
    for i in os.listdir(path):
        fullitem= os.path.join(path, i)
        
        if os.path.isdir(fullitem):
           
           val1=i.lower()
           
           lst.append(val1)
           val = uniqueDirs(fullitem)
          
           lst+= val
           
           
           
    return list(set(lst))
           
        
  
        
            

# Question 2
# This function must be recursive and should use a loop
def wideBranch(path, n):
    'returns a string representing the first directory found in path (including path) that has at least n subdirectories.' 
    
     
    for item in os.listdir(path):
        fullItem = os.path.join(path, item)
        if os.path.isdir(fullItem):
            val = wideBranch(fullItem ,n)
            if val!=None:
                return val
            elif len(os.listdir(fullItem))==n:
                return fullItem

    return None

    

# Question 3
# This function must be recursive and should use a loop
# Note that the function needs to have a variable that is set at
# the top of the function, modified in the body of the function,
# and involved in the return statement ONLY at the END

def countSparseDirs(path):
    'returns the number of directories in path that have no files.'
    count= 0
    
    
    for item in os.listdir(path):
        fullitem= os.path.join(path,item)

        if os.path.isdir(fullitem) :
             val1=countSparseDirs(fullitem)
             count+=val1
            
        else:
       
                count+=1
     
    return count 
                
            

# Question 4
# This question will not use recursion at all
class Weight(object):
    'represents a weight measurement and supports the following methods'

    # Change the header as requested in the assignment
    def __init__(self, val=0.0, scale='p'):
        'provided the default is 0.0 and if a scale is not provided the default is p for pounds.'
        valscale=['k','p','K','P']
        if val<0:
            self.val=0.0
        else :
            self.val=val
        if scale not in  valscale:
            self.scale='p'
        else:
            self.scale = scale
            
        
        

    def setWt(self):
        ' enters a weight measurement and a scale from the user.'
        valscale=['k','p','K','P']
        
        done= False
        while not done:
            
            scalein= input('Enter a scale (p for pound, K for kilos):')
            if scalein in valscale:
                self.scale=scalein.casefold()
                done= True
            else:
                print( f'{scalein}, is not a valid scale')
        
        d= False
        while not d :
            num= float(input( 'enter a weight:'))
            if num > 0:
                self.val=num
                d= True
            
            else:
                print('A weigth measurement cannot be negtive.')
            

    def getP(self):
        'weight measurement in pounds'
        if self.scale=='p'.casefold():
             return self.val
        else:
             return self.val*2.20462262185
             
         

    def getK(self):
        'returns the weight measurement in kilograms'
        if self.scale=='k'.casefold():
             return self.val
        else:
             return self.val*0.45359237
        
