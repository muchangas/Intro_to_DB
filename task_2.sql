-- SELECT THE DATABASE TO WORK WITH
USE ALX_BOOK_STORE;

-- 1. TABLE: Authors (Corrected Casing)

CREATE TABLE IF NOT EXISTS Authors (
author_id INT PRIMARY KEY AUTO_INCREMENT,
author_name VARCHAR(215) NOT NULL
);

-- 2. TABLE: Books (Corrected Casing)

CREATE TABLE IF NOT EXISTS Books (
BOOK_ID INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(130) NOT NULL,
author_id INT,
price DECIMAL(10, 2) NOT NULL,
PUBLICATION_DATE DATE,
FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 3. TABLE: Customers (FIXED to include exact required strings: Customers, customer_id, customer_name VARCHAR(215), email VARCHAR(215), address TEXT)

CREATE TABLE IF NOT EXISTS Customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(215) NOT NULL,
email VARCHAR(215) NOT NULL UNIQUE,
address TEXT
);

-- 4. TABLE: ORDERS (Remaining tables kept in original uppercase identifier style)
-- Stores the main order record, linking a customer to the transaction.

CREATE TABLE IF NOT EXISTS ORDERS (
ORDER_ID INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
ORDER_DATE DATE NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) -- Updated reference
);

-- 5. TABLE: ORDER_DETAILS
-- Stores the specific items (books and quantities) within each order.

CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
ORDER_DETAIL_ID INT PRIMARY KEY AUTO_INCREMENT,
ORDER_ID INT NOT NULL,
BOOK_ID INT NOT NULL,
QUANTITY INT NOT NULL,
FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
FOREIGN KEY (BOOK_ID) REFERENCES Books(BOOK_ID)
);
