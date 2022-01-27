# Pledge: I never need to use "is" in this class!
import random

def guess(n):
    'play a guessing game using n'
    if n <= 0:
        print("That was invalid.")
    else:
        val = random.randint(1, n)
        print(val)
        done = False
        while not done:
            try:
                num = int(input(f"Enter a guess (between 1 and {n}): "))
                if num <= 0 or num > n:
                    print("That was not a valid guess.")
                elif num < val:
                    print("The guess was too low.")
                elif num > val:
                    print("The guess was too high.")
                else: # num == val
                    print("You got it.")
                    done = True
            except: #Exception as e:
                #print(e)
                print("That was not a valid number. Try again.")

# This is not a successful approach
def safeOpen3():
    'return a successfully opened file to the user'
    e = 'f'
    while len(e) > 0:
        try:
            fname = input("Enter a file name: ")
            inf = open(fname, 'r')
        except Exception as err:
            print(err)
            print(e)
            print(f"{fname} could not be opened.")
            print("Please try again.")
    return inf

def safeOpen2():
    'return a successfully opened file to the user'
    #n = 0
    #while n == 0:
    done = False
    while not done:
        try:
            fname = input("Enter a file name: ")
            inf = open(fname, 'r')
            #n = 1
            done = True
        except:
            print(f"{fname} could not be opened.")
            print("Please try again.")
    return inf
            
def safeOpen():
    'return a successfully opened file to the user'
    while True:
        try:
            fname = input("Enter a file name: ")
            inf = open(fname, 'r')
            return inf
        except:
            print(f"{fname} could not be opened.")
            print("Please try again.")

def fancyPrintNth(lst):
    n = 0
    while n == 0:
        try:
            n = int(input("Enter an index: "))
            print(lst[n])
        except IndexError:
            print("That index was not valid for the list.")
            n = 0 # n got reset so we have to set it back to 0
        except ValueError:
            print("That was not a valid integer.")

def printNth(lst):
    try:
        n = int(input("Enter an index: "))
        print(lst[n])
    except:
        pass

def oldPrintNth(lst):
    n = int(input("Enter a whole number: "))
    if n < 0:
        if abs(n) <= len(lst):
            print(lst[n])
    else:
        if n < len(lst):
            print(lst[n])

# Not functioning the way I want it to
# The function only gives one try at user mistakes in input
# because the try is around the loop and not within it
def wrongPosNum():
    'get a positive number from the user'
    num = -1
    try:
        while num <= 0:
            num = eval(input("Enter a positive number: "))
            if num <= 0:
                print("That is not positive.")
                print("Please give me a number > 0.")
    except:
        print("That was not a valid number. Please use digits.")
    return num

def getPosNum2():
    'get a positive number from the user'
    num = -1
    while num <= 0:
        try:
            num = eval(input("Enter a positive number: "))
            if num <= 0:
                print("That is not positive.")
                print("Please give me a number > 0.")
        except: #Exception as err:
            #print(err)
            print("That was not a valid number. Please use digits.")
    return num

def interact():
    'build a list of positive integers input from the user'
    nlst = []
    num = 1
    while num > 0:
    # while True:
        num = int(input("Enter a positive integer: "))
        if num > 0:
            nlst.append(num)
##        else:
##            return nlst
    return nlst

def hello3():
    'greet the user until they enter an empty string'
    name = 'test'
    while len(name) > 0:
        name = input("Enter your name: ")
        if len(name) > 0:
            print(f"Hello, {name}!")
        
def hello2():
    'greet the user until they enter an empty string'
    while True:
        name = input("Enter your name: ")
        if len(name) > 0:
            print(f"Hello, {name}!")
        else:
            #return
            break
        
def hello():
    'greet the user forever'
    while True:
        name = input("Enter your name: ")
        print(f"Hello, {name}!")

# A solution from Monday, September 28th
def getPosNum():
    'get a positive number from the user'
    num = -1
    while num <= 0:
        num = eval(input("Enter a positive number: "))
        if num <= 0:
            print("That is not positive.")
            print("Please give me a number > 0.")
    return num
