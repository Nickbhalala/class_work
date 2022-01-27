# CSC 243-701
# Assignment 9 template
# Put your name here

# Other than pythontutor.com you are not allowed to use any online
# resources when completing assignments. You may not use the online
# help on pythontutor.com only the visualization tool.

# List your collaborator [Professor SETTLE AMBER]: [Q3] dev -Q1 TO FIX MY checkWt(self) AND HOW CALL THE FUNCTION PARENT FUNCATION 
##The handle_starttag method shouldn’t use a loop.
##You just need to use the tag to update the dictionary.
# If you did not collaborate with anyone, say that
# Files without the above information will earn a 0

# Include doc strings for full credit

# You can change the import statements if you like
from html.parser import HTMLParser
from urllib.request import urlopen

# Parent class for the first question
# Do not change this class
class Weight(object):

    def __init__(self, val = 0.0, scale = 'p'):
        if scale.lower() in ['p', 'k']:
            self.scale = scale.lower()
        else:
            self.scale = 'p'
        if val >= 0:
            self.measure = val
        else:
            self.measure = 0.0

    def setWt(self):
        done = False
        while not done:
            s = input("Enter a scale (p for pounds, k for kilos): ")
            if s.lower() in ['p', 'k']:
                self.scale = s
                done = True
            else:
                print(f"{s} is not a valid scale.")
        done = False
        while not done:
            try:
                val = float(input("Enter a weight: "))
                if val >= 0:
                    self.measure = val
                    done = True
                else:
                    print("A weight measurement cannot be negative.")
            except:
                print("Please enter the reading using digits.")

    def getP(self):
        if self.scale.lower() == 'p':
            return self.measure
        else:
            return self.measure * 2.20462262185

    def getK(self):
        if self.scale.lower() == 'k':
            return self.measure
        else:
            return self.measure * 0.45359237

# Question 1
# Write this class
# Include doc strings for all methods of the class
class CatWeight(Weight):
    'the CatWeight class '

    def checkWt(self):
        'range for a domestic cat, it resets'

       
        if self.scale == 'p'.casefold():
                if self.measure<4 or self.measure>25:
                    self.measure=25
                
        else:
                if self.measure<1.8 or self.measure>11.5:
                    self.measure=11.5
                
                    
            

    # Change the header as required by the assignment
    def __init__(self, val=10, s='p'):
        ' takes two optional parameters representing the measurement and the scale for the cat weight'
        
        Weight.__init__(self ,val, s)
        CatWeight.checkWt(self)

        

    def setWt(self):
        ' Weight class to obtain a scale and measurement from the user'
        Weight.setWt(self)
        CatWeight.checkWt(self)


    def __repr__(self):
        'CatWeight(measure, scale) where measure is the measurement of the object and scale is the scale'
       
        
        return (f'Catweight({self.measure},{self.scale })')
        
    
    def __str__(self):
        'returns a string that depends on the scale of the object'
        if  self.scale =='p'.casefold():
             return(f'{self.measure} pounds' )
        else:
            return (f'{self.measure} kilos' )
            
           

# Question 2
# Write this class
# Include doc strings for all methods
class AltCollector(HTMLParser):
    ' subclass of the HTMLParser class'
    
    def __init__(self):
        'constructor calls the parent class constructor and sets a variable to hold the list of alt values that the parser collects.'
        HTMLParser.__init__(self)
        self.lst=[]
         

    def handle_starttag(self, tag, attrs):
        ' collects the values associated with the alt attribute in image tags.'
        if tag.lower()=='img':
            for item in attrs:
               if item[0].lower()=='alt':
                   self.lst.append(item[1])
        
    def getAlt(self):
        ' returns the list of alt values collected by the parser'
        return self.lst

# For reference only -- do not change
def testAParser(url):
    content = urlopen(url).read().decode()
    parser = AltCollector()
    parser.feed(content)
    return parser.getAlt()

# Question 3
# Write this class
# Include doc strings for all methods
class TagCounter(HTMLParser):
    'counts all of the tags found in an HTML page'
    
    def __init__(self):
        'creates an empty dictionary in which the tag-frequency pairs will be stored'
        HTMLParser.__init__(self)
       
        self.d={}

    def handle_starttag(self, tag, attrs):
        ' adds it to the dictionary with an appropriate frequency'
        
        if tag.casefold() in self.d:
            self.d[tag.casefold()]+=1
            
            
        else:
            self.d[tag.casefold()]=1
        
       
    def getTags(self):
        ' returns the dictionary of tag-frequency pairs constructed by the parser.'
        return  self.d

# For reference only -- do not change
def testTParser(url):
    content = urlopen(url).read().decode()
    parser = TagCounter()
    parser.feed(content)
    return parser.getTags()
