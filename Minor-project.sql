CREATE DATABASE Bank;
USE Bank;

Create TABLE Customer(
    CUSTOMER_NAME VARCHAR(15) PRIMARY KEY,
    CUSTOMER_STREET VARCHAR(15),
    CUSTOMER_CITY VARCHAR(15)
);

DESC Customer;

CREATE TABLE Branch(
    BRANCH_NAME VARCHAR(15) PRIMARY KEY NOT NULL,
    BRANCH_CITY VARCHAR(15) NOT NULL,
    ASSETS INT
);

DESC Branch;

CREATE TABLE Account(
    ACCOUNT_NUMBER INT PRIMARY KEY NOT NULL,
    BRANCH_NAME VARCHAR(15),
    FOREIGN KEY (BRANCH_NAME) REFERENCES Branch(BRANCH_NAME),
    BALANCE INT,
    Date_accessed DATE
);

DESC Account;

CREATE TABLE Loan(
    LOAN_NUMBER INT PRIMARY KEY,
    BRANCH_NAME VARCHAR(15),
    FOREIGN KEY (BRANCH_NAME) REFERENCES Branch(BRANCH_NAME),
    AMOUNT INT
);

DESC Loan;

CREATE TABLE Depositor(
    CUSTOMER_NAME VARCHAR(15),
    FOREIGN KEY (CUSTOMER_NAME) REFERENCES Customer(CUSTOMER_NAME),
    ACCOUNT_NUMBER INT,
    FOREIGN KEY(ACCOUNT_NUMBER) REFERENCES Account(ACCOUNT_NUMBER)
);

DESC Depositor;

CREATE TABLE Borrower(
    CUSTOMER_NAME VARCHAR(15),
    FOREIGN KEY (CUSTOMER_NAME) REFERENCES Customer(CUSTOMER_NAME),
    LOAN_NUMBER INTEGER(8) PRIMARY KEY,
    FOREIGN KEY (LOAN_NUMBER) REFERENCES Loan(LOAN_NUMBER)
);

DESC Borrower;
