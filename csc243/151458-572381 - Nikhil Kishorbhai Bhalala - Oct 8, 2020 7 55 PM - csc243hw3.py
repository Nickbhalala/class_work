# CSC 243-701
# Assignment 3 template
# Put your name here nihkil bhalala

# Remember that you are not allowed to use online resources
# or tutors outside of CDM when completing assignments

# List your collaborator(s)Professor Amber Settle , dev patel,ben wesley,wier christopher
#Q1andQ3
#I would try making a variable that represents the largest difference and return that at the end. What you are doing wont
#go through the for loop, it will just go once, and if the two numbers are different return
#the diff. Also I would note that if you subtract two equal numbers you get a result of zero either way, so you should only
#need to force a return of zero if the list isn’t large enough
# question 1 I’m not sure what you’re even trying to do. You’re not taking a difference between two elements in the list, so I don’t even see that it’s addressing the problem.
#For question 2, you need to seriously think about what impact case has on the problem.
#And for question 4, you’ve used the same name for the parameter and the list you’re building. I don’t think that’s going to be a good strategy.
# Q5)I’m not 100% sure what your question is. But I found that there is a string function, which can be found using help(str), that
#will allow you to check if a string has only digits in it. It starts with “is”.
#You need to build a string with dashes out of it using slices, e.g., pieces
#of the string formed using indices.
# your collaboration. If you did not collaborate with anyone,
# please indicate that. One or the other statement is required.

# Include doc strings for full credit

# Question 1
def maxDiff(lst):
    ' returns the largest difference between any two adjacent numbers in the list.'
    if len(lst)>1:
        num=lst[0]-lst[1]
        for i in range(2,len(lst)):
            if num < abs(lst[i])-abs(lst[i-1]):
                
                num= abs(lst[i])-abs(lst[i-1])
        return abs(num)
    else:
        return 0
    

# Question 2
def alphabetical(slst):
    ' returns True if the strings are in alphabetical order in the list and False if there is any pair of strings in the list that are not in alphabetical'
    for w in range(1,len(slst)):
                   if slst[w].casefold() < slst[w-1].casefold():
                       return False
    return True

# Question 3
def getIndices(target, special):
    'returns a list of the indices where any character found in special is found in target.'
    lst=[]
    for i in range(len(target)):
        for j in range(len(special)):
            if target[i]==special[j]:
                lst.append(i)
    return lst

# Question 4
def allSmaller(lst, num):
    ' returns a list of all the values in the parameter list that are less than or equal to num. '
    nlst=[]
    for i in range(len(lst)):
        for j in range(len(lst[i])):
            if lst[i][j]<=num:
                nlst.append(lst[i][j])
    return nlst
                

# Question 5
def getSSNum():
    'enter a Social Security number and returns a string representing a formatted version of the first valid number entered by the user. '
    s=''
    while True:
        s=input('Please enter a nine-digit social security number:')
        if len(s)==9 and s.isdigit():
            
            return (f'{s[0:2]}-{s[2:5]}-{s[5:]}')
        else:
            print('That is not a valid number. Please try again.')

            




            
            
            
