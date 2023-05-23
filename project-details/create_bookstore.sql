-- Create the bookstore database
CREATE DATABASE bookstore;

-- Use the bookstore database
USE bookstore;

-- Create the categories table
CREATE TABLE categories (
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(255) NOT NULL
);

-- Create the authors table
CREATE TABLE authors (
  author_id INT PRIMARY KEY AUTO_INCREMENT,
  author_name VARCHAR(255) NOT NULL
);

-- Create the publishers table
CREATE TABLE publishers (
  publisher_id INT PRIMARY KEY AUTO_INCREMENT,
  publisher_name VARCHAR(255) NOT NULL
);

-- Create the books table
CREATE TABLE books (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  category_id INT NOT NULL,
  isbn VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  author_id INT NOT NULL,
  publisher_id INT NOT NULL,
  image VARCHAR(255),
  FOREIGN KEY (category_id) REFERENCES categories (category_id),
  FOREIGN KEY (author_id) REFERENCES authors (author_id),
  FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id)
);

-- Create the admin table
CREATE TABLE admin (
  admin_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(255) NOT NULL
);

-- Create the members table
CREATE TABLE members (
  member_id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);
