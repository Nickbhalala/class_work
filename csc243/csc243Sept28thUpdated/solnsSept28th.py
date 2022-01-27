from math import *
# import math
# math.sqrt(2)
# math.ceil(3.57)

# Not quite as described in notes
def greater(lst, num):
    'solve easyGreater with a while -- no for'
    i = 0
    while i < len(lst): #lst[i] <= num:
        if lst[i] > num:
            return lst[i]
        i += 1
    return -999

def easyGreater(lst, num):
    'return the first value in lst larger than num or -999'
    for i in range(len(lst)):
        if lst[i] > num:
            return lst[i]
    return -999

def getPosNum():
    'get a positive number from the user'
    num = -1
    while num <= 0: # while cond: -> True; execute the body
        num = eval(input("Enter a positive number: "))
        if num <= 0:
            print("That is not positive.")
            print("Please give me a number > 0.")
    return num

# If you want to change a list, use an indexed loop!

def add2D(lst):
    'solve the add2D problem'
    #for slst in lst:
    for j in range(len(lst)):
        for i in range(len(lst[j])):
            lst[j][i] += 1
        #for i in range(len(slst)):
            #slst[i] += 1
    return lst

def print2DIndex(lst):
    'print a 2D list using indices'
    for i in range(len(lst)):
        for j in range(len(lst[i])):
            print(lst[i][j])

def print2D(lst):
    'print a 2D list'
    for slst in lst:
        for value in slst:
            print(value)

# loopFcn2(10)
def loopFcn2(n):
    'demonstrate dependent nested loops'
    for i in range(n): # n = 10: 0 1 2 ... 9
        for j in range(i+1): # i = 0 -> 0; i = 1 -> 0 1
            print(j, end = " ")
        print()

def multmult(lst1, lst2):
    'return a list of the product of all numbers in lst1 and lst2'
    lst = []
    for num1 in lst1:
        #for j in range(len(lst2)):
        #    lst.append(num1 * lst2[j])
        for num2 in lst2:
            lst.append(num1 * num2)
    return lst

# independent nested loops
# loopFcn1(10)
def loopFcn1(n):
    'create an independent nested loop using n'
    for i in range(n):
        # num of executions of outer loop = n (e.g., 10)
        for j in range(n):
            print(j, end = " ")
            # n = 10: 0 1 2 .... 9
        print()

# CSC 233 or CSC 333
def encode(s):
    'demonstrate a shift-1 cipher'
    encs = ''
    for ch in s:
        encs += chr(ord(ch) + 1)
    return encs

def fastDivisors(n):
    'return a list of the divisors of n'
    dlst = []
    for num in range(1, ceil(sqrt(n))):
        if n % num == 0:
            dlst.append(num) # "small" divisor
            dlst.append(n // num) # "large" divisor
    dlst.sort()
    return dlst

def divisors(n):
    'return a list of the divisors of n'
    dlst = []
    for num in range(1, n+1):
        if n % num == 0: # num is a divisor of n
            dlst.append(num)
    return dlst

def assnHint(s):
    'this is an assignment hint'
    return s.split(',')

def upAbbrev(pstr):
    'return the uppercase letters in pstr'
    abv = ''
##    for i in range(len(pstr)):
##        if pstr[i].isupper() == True:
##            abv += pstr[i]
    for ch in pstr:
        if ch.isupper():
            abv += ch
    return abv

def acronym(phrase):
    'return the string of capitalized first letters of each word'
    acr = ''
    # phrase = phrase.title()
    # llst = phrase.split()
    llst = phrase.title().split()
    #print(llst)
    for word in llst:
        acr += word[0]#.upper()
    return acr

def getAllSmaller(fname, num):
    'return the sum of all the numbers in fname smaller than num or 0'
    infile = open(fname, 'r')
    s = infile.read()
    infile.close()
    nlst = s.split()
    total = 0 # 0 is the additive identity
    for val in nlst:
        val = eval(val)
        if val < num:
            total += val # addition
    return total

def getAllLarger(fname, num):
    'return sum of all the numbers in fname larger than num or 0'
    infile = open(fname, 'r')
    s = infile.read()
    infile.close()
    nlst = s.split()
    llst = [] # empty list is the identity under += or append
    for val in nlst:
        val = eval(val)
        if val > num:
            llst.append(val)
            #llst += [val]
    return sum(llst)

def arithmetic(lst):
    'return True if the numbers in lst form an arithmetic sequence'
    if len(lst) > 1:
        diff = lst[1] - lst[0]
        for i in range(2, len(lst)):
            if lst[i] - lst[i-1] != diff:
                return False
        # all pairs had the same difference
        return True
    else:
        return False # you must have at least two items to have a sequence

def testFcn(name):
    'should printing'
    for ch in name: # loop using an iterator
        print(ch, end = " ")
    print()
    print("Now the loop is done.")
    #print("\nNow the loop is done.")

# Solutions from September 21st
def hasConsDups(s):
    'return True if s has consecutive duplicate characters, False otherwise'
    s = s.lower()
    for i in range(1, len(s)):
        if s[i] == s[i-1]:
            return True
    return False

def issorted(lst):
    'return True if lst is sorted and False otherwise'
    for i in range(1, len(lst)):
        if lst[i] < lst[i-1]:
            return False
    return True
