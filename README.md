## How to interact with my code

* Fork this repo and clone
* Navigate to the root directory using your terminal.

```
* bundle install
* irb
* require './lib/statement.rb'
* my_account = Account.new
```
* This will create an account for you to deposit and withdraw
```
* my_statement = Statement.new(my_account)
```
* This allows you to create a statement and print it when you wish
```
* my_account.credit(100)
* my_account.withdraw(25)
* my_statement.print_statement
```
* For testing please run
```
* rspec
```

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

| date              | credit                                                  | debit   | balance |
| --------------------- |:------------------------------------------------------------- | :------------- | :-------|
| 14/01/2012   | | 500.00 | 2500.00 |
| 13/01/2012   | 2000.00 |  | 3000.00 |
| 10/01/2012 | 1000.00 |  | 1000.00 |

```
As a client,
So I can own a bank account,
I would like to be able to create one with an initial balance of 0.
```

```
As a client,
So I can safely store my hard earned money,
I would like to be able to deposit a sum into my bank account.
```

```
As a client,
So I can spend my hard earned money,
I would like to be able to withdraw a sum from my bank account
```

```
As a client,
So I can see my personal wealth,
I would like to be able to see the total amount of money I have in my bank account
```

```
As a client,
So I can keep track of my transactions,
I would like to be able to see a transaction date
```

```
As a client,
So I can see a summary of my account,
I would like to be able to see my bank statement
```
