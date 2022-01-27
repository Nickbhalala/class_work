# CSC 243-701
# Assignment 2 template
# Put your name here nikhil bhalala
# Remember that you are not allowed to use online resources
# when completing assignments

# List your collaborator(s) professor Settle, Amber,
# Include a comment that provides significant details about each
# person's contribution to the assignment
#Q2 ,Q4
# If you did not collaborate with anyone, place a comment in the
# file indicating that

# Files without this information will earn a 0

# Include doc strings for full credit

# Question 1
def strongReject(name, reason, company):
    'string representing a name, a string representing a rejection reason, and a string representing a company name and prints a form letter rejecting the person'
    name= name.title()
    reason= reason.upper()
    print(f'Dear {name},')
    print('we are sorry to infrom you that were not selected. ')
    print('Regretfully ,you are')
    for r in reason:
    
        print(r ,end=" ")
    print(" ")
        
    print('we appreciate your application.')
    print('Best of luck in the future.')
    
    print("sincerely,")
    
    print(f'{company}')
          
           
 


          

# Question 2
def printRec(rfile, rating):
    ''' function printRec() that takes a string fname representing a file name and an integer rating representing a restaurant rating as parameters.
    restaurant representing the number of stars the restaurant has earned.'''
    
    print(f'The at least {rating} star restaurants in {rfile} are:')
    fname= open( rfile, 'r')
    i=fname.readlines()
    fname.close()
    
    lst=[]
     
    for line in i:
        lst=line.split(",")
        
        if eval(lst[1])>=rating:
             print(lst[0])
                
               
                    
        else:
            print(f'The at least {rating} star restaurants in {rfile} are')
                
             
        
         
             
             
             
             
       
    
         
            
      
          

# Question
'''  print(lst[1] ,lst[0], 'earned $',lst[2])'''
def payReport(infile):
    fname= open(infile ,'r')
    i=fname.readlines()
    fname.close()
    lst=[]
    for line in i:
       lst=line.title().split()
       
       
       print(lst[1] ,lst[0], 'earned $',lst[2])
          
       
        
   
    
    
    
        
    
    
        
    
    

# Question   4
def separate(fname):
    fnamne =open('pos.txt' ,'a')
    


