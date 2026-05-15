CREATE DATABASE CAFETERIA;
USE cafeteria;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    user_phone VARCHAR(15) UNIQUE NOT NULL
);
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_phone VARCHAR(15),
    items VARCHAR(100), 
    type VARCHAR(20),   -- Dine-in or Takeaway
    status VARCHAR(20) DEFAULT 'Pending',
    -- Link to users table via user_phone
    FOREIGN KEY (user_phone) REFERENCES users(user_phone) 
);
CREATE TABLE feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_phone VARCHAR(15),
    rating INT CHECK (rating BETWEEN 1 AND 5), 
    comment TEXT,
    -- Link to users table via user_phone
    FOREIGN KEY (user_phone) REFERENCES users(user_phone)
);
CREATE TABLE menu_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(20)
);
