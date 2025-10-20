DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE provinces (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE locations (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL UNIQUE ,
province_id INT NOT NULL,
FOREIGN KEY (province_id) REFERENCES provinces(id)
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    location_id INT NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    FOREIGN KEY (location_id) REFERENCES locations(id)
);

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    price DECIMAL(7,2) NOT NULL CHECK (price >= 0),
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE stores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(100) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    location_id INT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locations(id)
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dni VARCHAR(15) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    role ENUM('cook', 'rider') NOT NULL,
    store_id INT NOT NULL,
    FOREIGN KEY (store_id) REFERENCES stores(id)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    store_id INT NOT NULL,
    order_datetime DATETIME NOT NULL,
    order_type ENUM('pickup', 'delivery') NOT NULL,
    total_price DECIMAL(9,2) NOT NULL CHECK (total_price >= 0),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (store_id) REFERENCES stores(id)
    );
    
    CREATE TABLE order_details (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE deliveries (
    order_id INT PRIMARY KEY,
    rider_id INT NOT NULL,
    delivery_datetime DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (rider_id) REFERENCES employees(id)
);


INSERT INTO provinces (name) VALUES
('Barcelona'),
('Madrid'),
('Valencia');


INSERT INTO locations (name, province_id) VALUES
('Barcelona', 1),
('Hospitalet de Llobregat', 1),
('Madrid', 2),
('Valencia', 3);


INSERT INTO customers (first_name, last_name, address, postal_code, location_id, phone) VALUES
('Juan', 'Perez', 'Carrer de la Lluna 5', '08001', 1, '600123456'),
('Maria', 'Gomez', 'Av. Diagonal 120', '08015', 1, '600654321'),
('Carlos', 'Lopez', 'Calle Mayor 23', '28013', 3, '610123456');


INSERT INTO categories (name) VALUES
('Pizzas'),
('Hamburguesas'),
('Begudes');


INSERT INTO products (name, description, image, price, category_id) VALUES
('Margarita', 'Pizza clásica con tomate, mozzarella y albahaca', 'margarita.jpg', 7.50, 1),
('Barbacoa', 'Pizza con salsa barbacoa y carne', 'barbacoa.jpg', 9.00, 1),
('Cheeseburger', 'Hamburguesa con queso cheddar', 'cheeseburger.jpg', 6.00, 2),
('Coca-Cola', 'Bebida refrescante', 'cocacola.jpg', 1.50, 3),
('Agua', 'Agua mineral sin gas', 'agua.jpg', 1.00, 3);


INSERT INTO stores (address, postal_code, location_id) VALUES
('Carrer del Comerç 10', '08003', 1),
('Calle Gran Via 45', '28013', 3);


INSERT INTO employees (first_name, last_name, dni, phone, role, store_id) VALUES
('Laura', 'Martínez', '12345678A', '650123456', 'cook', 1),
('Javier', 'Sánchez', '87654321B', '650654321', 'rider', 1),
('Ana', 'Fernández', '11223344C', '660123456', 'rider', 2);


INSERT INTO orders (customer_id, store_id, order_datetime, order_type, total_price) VALUES
(1, 1, '2025-10-20 19:30:00', 'delivery', 16.50),
(2, 1, '2025-10-21 13:00:00', 'pickup', 7.50),
(2, 1, '2025-10-21 14:00:00', 'delivery', 7.50),
(3, 2, '2025-10-22 20:15:00', 'delivery', 8.00);


INSERT INTO order_details (order_id, product_id, quantity) VALUES
(1, 1, 1),  -- 1 Margarita para pedido 1
(1, 4, 5),  -- 5 Coca-Colas para pedido 1
(2, 1, 1),  -- 1 Margarita para pedido 2
(3, 5, 8);  -- 8 Aguas para pedido 3


INSERT INTO deliveries (order_id, rider_id, delivery_datetime) VALUES
(1, 2, '2025-10-20 20:00:00'),
(4, 2, '2025-10-20 21:00:00'),
(2, 2, '2025-10-22 20:45:00');