# recusion is a threshold concept:
# 1. challenging
# 2. changes the way you view CS/programming (favorite interview question)
# 3. once you learn it, it's tough to unlearn

# introduce a problem
# go solve it with a partner (pair programming)
# come back and discuss

# (successful) recursive function
# 1. base case (requires no recursive call -> easy) 50% of points on exams
# 2. calls itself (recursion)

# recursive functions that return values must either:
# 1. return in EVERY branch, or
# 2. return only at the END,
# but NOT both

# the plan:
# base case: if the list is empty -> return 0
# plan for the first element:
# if the first element is a int or float: assign a variable to the first element
# then assign a variable to the result of calling the function on the rest of
# the list; return the bigger of the two
# if the first element is a list: return the larger of a recursive call on the
# rest of the list and a recursive call on the first element

def findMax(lst):
    'return the largest value in an arbitrarily nested list of non-zero numbers'
    if len(lst) == 0:
        return 0
    elif type(lst[0]) == list:
        val1 = findMax(lst[0])
        val2 = findMax(lst[1:])
        if val1 > val2:
            return val1
        else:
            return val2
        # return max(val1, val2)
    else: # the first element is an int or a float
        val = findMax(lst[1:])
        #return max(lst[0], val)
        if lst[0] > val:
            return lst[0]
        else:
            return val

# the plan:
# base case: if the list is empty -> there are no integers, result is 0
# first element: plan
# first element is a list: make a recursive call on first element and add
# it to the result of making a recursive call on the rest of the list
# first element is a integer: add 1 to the result of making a recursive
# call on the rest of the list
# if the first element is neither a list nor an int: make a recursive call
# on the rest of the list

def countInts(lst):
    'return the number of integers in the arbitrarily nested list lst'
    if len(lst) == 0:
        return 0
    elif type(lst[0]) == int:
        return 1 + countInts(lst[1:])
    elif type(lst[0]) == list:
        return countInts(lst[0]) + countInts(lst[1:])
    else: # neither an int nor a list
        return countInts(lst[1:])

# no loops
# empty list -> nothing (implicit base case)
# first element: plan
# if the first element isn't a list: print it (use the print function)
# if the first element is a list: make a recursive call on the first element
# what about the rest of the list?
# rest of list: lst[1:]
# make a recursive call on the rest of the list
def listPrint(lst):
    'print an arbitrarily nested list lst, one non-list element per line'
    if len(lst) > 0:
        # there is a first element
        if type(lst[0]) == list: # first element is a list
            listPrint(lst[0])
        else: # the first element is not list
            print(lst[0])
        listPrint(lst[1:]) # print the rest of the list

def printLst(lst):
    'non-destructively print a list of values lst one per line using recursion'
    if len(lst) > 0:
        print(lst[0]) # print the first element
        printLst(lst[1:]) # print the rest
    # implicit base case: if len(lst) == 0, then do nothing
    
def fastExp(a, n):
    'compute a to the power n, computed recursively and efficiently'
    # a ^ 0 = 1
    # n even: a ^ n = a ^ (n/2) * a ^ (n/2)
    # n odd:  a ^ n = a ^ (n/2) * a ^ (n/2) * a ^ 1
    # n = 5 : a ^ 5 = a ^ 2 * a ^ 2 * a
    if n == 0:
        return 1
    else:
        val = fastExp(a, n // 2)
        if n % 2 == 0:
            return val * val
        else: # n is odd
            return val * val * a

def slowExp(a, n):
    'return a raised to the power n, not using a loop or **'
    # a ^ n = a ^ (n-1) * a ^ 1
    # a ^ 0 = 1
    if n == 0:
        return 1
    else: # n > 0
        val = slowExp(a, n-1)
        return val * a

def factorial(n):
    'return 1 * 2 * .... * (n-1) * n, computed recursively'
    if n <= 1:
        return 1
    else:
        val = factorial(n-1)
        return n * val

def makePattern2(n):
    rstr = ''
    if n <= 1:
        rstr = "1"
    else:
        pstr = makePattern2(n-1)
        rstr = pstr + f" {n} " + pstr
    return rstr

def makePattern(n):
    if n <= 1:
        return "1"
    else:
        pstr = makePattern(n-1)
        return pstr + f" {n} " + pstr
    # inefficient solution:
    # return makePattern(n-1) + f" {n} " + makePattern(n-1)

def pattern(n):
    'print a pattern of numbers based on n'
    if n <= 1:
        print(1, end = " ")
    else: # "sandwich"; bread = previous pattern, rest = print of n
        pattern(n-1)
        print(n, end = " ")
        pattern(n-1)
        
def makeCheer(n):
    'return a string built out of silliness using n'
    if n <= 1:
        return "Hurrah!"
    else:
        # recursive call
        partStr = makeCheer(n-1) # "Hip Hip .... Hip Hurrah!"
        return "Hip " + partStr # use it here!
        # I can't reach this!!

def cheer(n):
    'print a silly cheer based on n'
    if n <= 1:
        print("Hurrah!")
    else:
        print("Hip")
        cheer(n-1)

