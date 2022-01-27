class Account(object):
    'a bank account class'

    # add a parameter to provide an initial balance
    # acct = Account(100)
    def __init__(self):
        'the constructor'
        self.balance = 0

    def __repr__(self):
        'the representation of the Account object'
        return f"Account({self.balance})"
        #return Account.__str__(self)

    def __str__(self):
        'the string representation of the Account object'
        return f"${self.balance:.2f}"

    def set(self, value):
        'set the balance to value'
        self.balance = value

    def get(self):
        'return the current balance on the account'
        return self.balance

    def deposit(self, value):
        'deposit value into the account'
        self.balance += value

    def withdraw(self, value):
        'withdraw value from the account'
        self.balance -= value

        
