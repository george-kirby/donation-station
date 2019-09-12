# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# $ettlr!

$ettlr is a bill-splitting CLI application. Users can record payments they have made on behalf of others, to keep track of what they are owed. These payments result in debts for other users. Users can then view these debts and mark them as paid. 


### Functionality

On the start menu, users are invited to log in or create a new account. Once logged in, users can manage their payments, manage their debts, or edit their profile.

**Manage Payments** allows a user to create new payments, with an amount, a reference, and other users to split it with. Once created, payments can be viewed and managed, for example by being marked as settled. 

**Manage Debts** allows a user to view outstanding debts they owe to other users. If they have paid their creditor back, they can mark a debt as settled. Settled debts can then be viewed in their own list. 

Both payments and debts can be filtered by user, amount or reference, to allow for easier viewing. 

**Edit Profile** allows a user to change their profile details, including First Name, Last Name, Username and Password.

$ettlr contains security features when creating or editing an account, such as hiding passwords and requiring confirmation for certain changes. 

### Domain model

The app's domain model is made up of three class models:
- **User**: a user has a *one-to-many* relationship with payments that they have created. They have a *many-to-many* relationship with payments that another user has created, *through* the **debt** that they owe to that other user. 
- **Payment**: a payment *has many* debts, but only *has one* user that created it. 
- **Debt**: a debt *belongs to* one payment and one user.

### CLI class

In addition to the three models, a CLI class manages the user interface. It: 
- takes input from the user
- calls on the three models to perform CRUD (Create, Read, Update, Delete) actions
- outputs useful information to the terminal, for the user to read. 

### Credits

Oliver Burt, George Kirby (2019)