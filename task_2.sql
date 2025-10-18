-- SELECT THE DATABASE TO WORK WITH
USE ALX_BOOK_STORE;

-- 1. TABLE: Authors (FIXED to include exact required strings: Authors, author_id, author_name)
-- Stores the names of the book authors.

CREATE TABLE IF NOT EXISTS Authors (
author_id INT PRIMARY KEY AUTO_INCREMENT,
author_name VARCHAR(215) NOT NULL
);

-- 2. TABLE: BOOKS
-- Stores book details and links each book to its author.
-- NOTE: Foreign key references the corrected Authors table.

CREATE TABLE IF NOT EXISTS BOOKS (
BOOK_ID INT PRIMARY KEY AUTO_INCREMENT,
TITLE VARCHAR(130) NOT NULL,
author_id INT,
PRICE DECIMAL(10, 2) NOT NULL,
PUBLICATION_DATE DATE,
FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 3. TABLE: CUSTOMERS
-- Stores customer information.

CREATE TABLE IF NOT EXISTS CUSTOMERS (
CUSTOMER_ID INT PRIMARY KEY AUTO_INCREMENT,
CUSTOMER_NAME VARCHAR(215) NOT NULL,
EMAIL VARCHAR(215) NOT NULL UNIQUE,
ADDRESS TEXT
);

-- 4. TABLE: ORDERS
-- Stores the main order record, linking a customer to the transaction.

CREATE TABLE IF NOT EXISTS ORDERS (
ORDER_ID INT PRIMARY KEY AUTO_INCREMENT,
CUSTOMER_ID INT NOT NULL,
ORDER_DATE DATE NOT NULL,
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

-- 5. TABLE: ORDER_DETAILS
-- Stores the specific items (books and quantities) within each order.
-- This creates a many-to-many relationship between ORDERS and BOOKS.

CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
ORDER_DETAIL_ID INT PRIMARY KEY AUTO_INCREMENT,
ORDER_ID INT NOT NULL,
BOOK_ID INT NOT NULL,
QUANTITY INT NOT NULL,
FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);
