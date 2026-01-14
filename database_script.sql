START TRANSACTION;

-- Drop tables if they exist
DROP TABLE IF EXISTS orders, products, customers;

-- Create customers table
CREATE TABLE customers (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create products table
CREATE TABLE products (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    stock INT DEFAULT 0
);

-- Create orders table
CREATE TABLE orders (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL REFERENCES customers(id),
    product_id INT NOT NULL REFERENCES products(id),
    quantity INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data into customers
INSERT INTO customers (name, email) VALUES
('Carol Divine', 'cdivine@example.com'),
('Victor Chaos', 'vchaos@example.com'),
('Chris Teapot', 'cteapot@example.com');

-- Insert sample data into products
INSERT INTO products (name, price, stock) VALUES
('Laptop', 700, 10),
('Smartphone', 500, 20),
('Headphones', 100, 30);

-- Insert sample data into orders
INSERT INTO orders (customer_id, product_id, quantity) VALUES
(1, 1, 1),  -- Carol buys 1 Laptop
(2, 2, 2),  -- Victor buys 2 Smartphones
(3, 3, 3);  -- Chris buys 3 Headphones

COMMIT TRANSACTION;