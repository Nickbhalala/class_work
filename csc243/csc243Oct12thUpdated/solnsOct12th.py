def lookup(pb):
    'allow the user to lookup items in a pre-built dictionary pb'
    while True:
        fname = input("Enter a first name: ")
        lname = input("Enter a last name: ")
        if len(fname) == 0 and len(lname) == 0:
            print("Goodbye!")
            return
        key = (fname, lname)
        if key in pb:
            print(pb[key])
        else:
            print("Unlisted number")

def uniqueWords(fname):
    'return a list of the unique words in fname'
##    wlst = getWords(fname)
##    wset = set(wlst)
##    wlst = list(wset)
    wlst = list(set(getWords(fname)))
    wlst.sort()
    return wlst
##    rlst = []
##    for item in wset:
##        rlst.append(item)
##    rlst.sort()
##    return rlst

def duplicates2(fname):
    'return True if there are duplicated words in fname and False otherwise'
    lst = getWords(fname)
    #print(lst)
    nset = set(lst)
    if len(lst) != len(nset):
        return True
    else:
        return False
    
def duplicates(fname):
    'return True if there are duplicated words in fname and False otherwise'
    wd = wordFreq(fname)
    #print(wd)
    # use wd to determine if we want to return True or False
    for key in wd:
        if wd[key] > 1:
            return True
    return False
    
def itemFreq(lst):
    'return a dictionary with items as keys and frequences of items as values'
    itemd = {}
    for singlelst in lst:
        for item in singlelst:
            if item in itemd:
                itemd[item] += 1
            else: # item is new
                itemd[item] = 1
    return itemd

def wordFreq(fname):
    'return a dictionary with words as keys and frequencies of words as values'
    wlst = getWords(fname)
    wd = {}
    for word in wlst:
        if word in wd: # word is already there
            wd[word] += 1
        else: # this is a new word
            wd[word] = 1
    return wd

def getWords(fname):
    'return a list of the lowercase words found in the file fname'
    try:
        inf = open(fname, 'r')
    except:
        print(f"{fname} is not found.")
        return []
    contents = inf.read()
    for ch in '!?,;:.':
        contents = contents.replace(ch, ' ')
    contents = contents.lower()
    wlst = contents.split()
    return wlst

def inverse(d):
    'return the inverse dictionary of d'
    invd = {}
    for key in d:
        invd[d[key]] = key # set the value associated with key in d to 
    return invd

def copyDict(d):
    'return a copy of d, that is, a new dict with the same key-value pairs as d'
    cd = {}
    for key in d:
        cd[key] = d[key] # d[key] is the value associated with key in d
    return cd

def checkFcn(param):
    'print yes if the param is an integer and no otherwise'
    if type(param) == int:
        print("yes")
    else: # not an int
        print("no")
