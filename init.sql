CREATE DATABASE IF NOT EXISTS bank_db;
USE bank_db;

CREATE TABLE address (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20)
);

CREATE TABLE customer (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    address_id BIGINT,
    FOREIGN KEY (address_id) REFERENCES address(id)
);

CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    role VARCHAR(50)
);

CREATE TABLE bank_account (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    account_number VARCHAR(50) UNIQUE,
    balance DECIMAL(15,2),
    customer_id BIGINT,
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE saving_accounts (
    id BIGINT PRIMARY KEY,
    interest_rate DECIMAL(5,2),
    FOREIGN KEY (id) REFERENCES bank_account(id)
);

CREATE TABLE current_accounts (
    id BIGINT PRIMARY KEY,
    overdraft_limit DECIMAL(15,2),
    FOREIGN KEY (id) REFERENCES bank_account(id)
);

CREATE TABLE premium_account (
    id BIGINT PRIMARY KEY,
    benefits VARCHAR(255),
    FOREIGN KEY (id) REFERENCES bank_account(id)
);

CREATE TABLE transaction (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(15,2),
    type VARCHAR(50),
    account_id BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES bank_account(id)
);
