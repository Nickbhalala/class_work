import os

# write classes -> subclass -> HTML parser (+ recursion) -> web crawler

# template of a plan:
# 1. for loop over each item in the current directory
# 2. form the full name of the item
# 3. what if the item is a directory? -> make a recursive call and use it!
# 4. what if the item is a file?

# plan for search:
# what if it's a directory -> make a recursive call
# 1. the search succeeded (didn't fail): return the result
# 2. the search failed -> do nothing!! (stay optimistic)
# what if it's a file
# 1. it's the right file! -> return the result
# 2. it's not the right file -> do nothing! (stay optimistic)

def search(fname, path):
    'return the (first found) location of fname in path or None if it is not there'
    for item in os.listdir(path):
        fullItem = os.path.join(path, item)
        if os.path.isdir(fullItem):
            ans = search(fname, fullItem)
            if ans != None: # didn't fail -> succeeded
                return ans
        elif item.lower() == fname.lower():
        #elif fullItem == os.path.join(path, fname):
            return fullItem
    #return None

# plan for countFiles:
# what if it's a directory? -> make a recursive call -> add the value to count
# what if it's a file? -> increment count

# this function must return only once AT THE END
def countFiles(path):
    'return the number of files found inside of path'
    count = 0
    for item in os.listdir(path):
        fullItem = os.path.join(path, item)
        if os.path.isdir(fullItem):
            val = countFiles(fullItem)
            count += val
        else: # it's a file
            count += 1
    return count

rules={'Virus1':'iyfp9fg394g539gf',
       'Virus2':'9f8g8408h3498hff'} # virus only

def scan(pathname, signatures):
    '''recursively scans all files contained, directly or
       indirectly, in the folder pathname'''
    for item in os.listdir(pathname): # general
        if item[0] != '.': # Mac fix -> general
            fullItem = os.path.join(pathname, item) # any OS -> general
            if os.path.isdir(fullItem): # general
                scan(fullItem, signatures) # recursive call -> general
            elif os.path.isfile(fullItem): # general
                f = open(fullItem, 'r') # virus only lines 15 - 20
                s = f.read()
                for virus in signatures:
                    if s.find(signatures[virus]) >= 0:
                        print(f'{fullItem}, found virus {virus}')
                f.close()

def fastFib(n):
    curr, prev = 1, 1
    count = 1
    while count < n:
        curr, prev = prev + curr, curr
        count += 1
    return curr

def fib(n):
    'return the nth Fibonacci number'
    if n == 0 or n == 1:
        return 1
    else:
        return fib(n-1) + fib(n-2)

def boolFcn(s):
    if s.lower() == 'true':
        return True
    else:
        return False
