-- SELECT THE DATABASE TO WORK WITH
USE ALX_BOOK_STORE;

-- 1. TABLE: Authors

CREATE TABLE IF NOT EXISTS Authors (
author_id INT PRIMARY KEY AUTO_INCREMENT,
author_name VARCHAR(215) NOT NULL
);

-- 2. TABLE: Books

CREATE TABLE IF NOT EXISTS Books (
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(130) NOT NULL,
author_id INT,
price DECIMAL(10, 2) NOT NULL,
PUBLICATION_DATE DATE,
FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 3. TABLE: Customers

CREATE TABLE IF NOT EXISTS Customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(215) NOT NULL,
email VARCHAR(215) NOT NULL UNIQUE,
address TEXT
);

-- 4. TABLE: Orders

CREATE TABLE IF NOT EXISTS Orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
order_date DATE NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. TABLE: Order_Details (FIXED to include exact required strings: Order_Details, quantity DOUBLE)
-- Stores the specific items (books and quantities) within each order.

CREATE TABLE IF NOT EXISTS Order_Details (
order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT NOT NULL,
book_id INT NOT NULL,
quantity DOUBLE NOT NULL, -- FIXED: Data type changed to DOUBLE
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
