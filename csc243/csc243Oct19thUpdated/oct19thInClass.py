# threshold concept
# 1. challenging
# 2. changes the way you view CS/programming (favorite interview question)
# 3. once you learn it, it's tough to unlearn

# introduce a problem
# go solve it with a partner (pair programming)
# come back and discuss

# (successful) recursive function
# 1. base case (requires no recursive call -> easy) 50% of points on exams
# 2. calls itself (recursion)

def cheer(n):
    'print a silly cheer based on n'
    if n <= 1:
        print("Hurrah!")
    else:
        print("Hip")
        cheer(n-1)

def printLst2(lst):
    'non-destructively print a list of values lst one per line using recursion'
    if len(lst) > 0:
        printLst2(lst[:-1])
        print(lst[-1])

def printLst(lst):
    'non-destructively print a list of values lst one per line using recursion'
    # length 1 list
    # length 0 list -> nothing to print; implicit base case
    if len(lst) > 0:
        print(lst[0]) # print the first element
        printLst(lst[1:]) # print the rest

def revVert(n):           
    'print the digits of n from least to most significant, one per line'
    if n < 10:             
        print(n)           
    else: # n has more than one digit
        print(n % 10) # least sig. digit
        revVert(n // 10) # recursively print the rest
        
# assume n is positive
def vertical(n):           
    'print the digits of n from most significant to least, one per line'
    if n < 10:             
        print(n)           
    else: # n has more than one digit                  
        vertical(n // 10) # make a recursive call on the most sig. digits
        print(n % 10) # print the least sig. digit

def countdown(n):
    'print the numbers from n to 1 followed by blast off'
    if n <= 0:
        print("Blast off!")
    else:
        print(n)
        countdown(n-1)

        
