START TRANSACTION;

DROP TABLE IF EXISTS locations, menu, orders;

-- Create locations table
CREATE TABLE locations (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(80) NOT NULL,
address VARCHAR(100) NOT NULL
);

-- Create menu table
CREATE TABLE menu (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
location_id INT NOT NULL,
item_name VARCHAR(80) NOT NULL,
price INT NOT NULL,
is_available BOOLEAN NOT NULL DEFAULT TRUE
);

-- Create orders table
CREATE TABLE orders (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
location_id INT NOT NULL,
customer_name VARCHAR(80) NOT NULL,
order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data into locations
INSERT INTO locations (name, address) VALUES
('Arnela', '100 Main St.'),
('Mary Ann', '200 Main St.');

-- Insert sample data into menu
INSERT INTO menu (location_id, item_name, price, is_available) VALUES
(1, 'Burger', '10.99', true),
(2, 'Spaghetti', '20.99', true);

-- Insert sample data into orders
INSERT INTO orders (location_id, customer_name) VALUES
(1, 'Arnela'),
(2, 'Mary Ann');

COMMIT;