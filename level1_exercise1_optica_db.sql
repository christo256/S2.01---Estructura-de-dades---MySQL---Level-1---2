CREATE DATABASE IF NOT EXISTS optica_db;
USE optica_db;


CREATE TABLE IF NOT EXISTS supplier (
supplier_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
street VARCHAR(100),
number VARCHAR(10),
floor VARCHAR(10),
door  VARCHAR(10),
city  VARCHAR(50),
postal_code  VARCHAR(10),
country  VARCHAR(50),
phone  VARCHAR(20),
fax  VARCHAR(20),
nif  VARCHAR(20) UNIQUE
);

CREATE TABLE IF NOT EXISTS glasses (
glass_id INT AUTO_INCREMENT PRIMARY KEY,
brand VARCHAR(100) NOT NULL,
lens_power DECIMAL(4,2),
frame_type ENUM('floating', 'plastic', 'metal'),
frame_color VARCHAR(50),
lens_color VARCHAR(50),
price DECIMAL(10,2) NOT NULL,
supplier_id INT NOT NULL,
FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

CREATE TABLE IF NOT EXISTS clients (
client_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
postal_address VARCHAR(200), 
phone VARCHAR(20),
email VARCHAR(50),
registration_date DATE NOT NULL,
recommended_by INT,
FOREIGN KEY (recommended_by) REFERENCES clients(client_id)
);

CREATE TABLE IF NOT EXISTS employees ( 
employee_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS sales (
sale_id INT AUTO_INCREMENT PRIMARY KEY,
client_id INT NOT NULL,
glass_id INT NOT NULL,
employee_id INT NOT NULL,
sale_date DATE NOT NULL,
FOREIGN KEY (client_id) REFERENCES clients(client_id),
FOREIGN KEY (glass_id) REFERENCES glasses (glass_id),
FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

USE optica_db;

INSERT INTO supplier (name, street, number, floor, door, city, postal_code, country, phone, fax, nif)
VALUES  
('Proveïdor Central', 'Carrer Veronica', '12', '2', 'A', 'Barcelona', '08001', 'España', '931234567', '931234568', '12345678'),
('Power Vision', 'Carrer Ramon Lluc', '10', '2', 'A', 'Barcelona', '08017', 'España', '941224567', '922224568', 'B12345678'),
('Lents Plus', 'Gran Via', '50', '1', 'B', 'Valencia', '46001', 'España', '961112233', '961112234', 'C98765432');


INSERT INTO glasses (brand, lens_power, frame_type, frame_color, lens_color, price, supplier_id)
VALUES ('Vans', 1.50, 'plastic', 'black', 'grey', 100.00, 1),
('Oakley', 2.00, 'metal', 'Plateado', 'Azul', 150.00, 2),
('Carrera', 1.25, 'floating', 'Rojo', 'Transparente', 100.00, 1),
('Vogue', 0.75, 'plastic', 'Marrón', 'Verde', 95.00, 3),
('Hawkers', 0.00, 'metal', 'Negro', 'Negro', 60.00, 2);

INSERT INTO clients (name, postal_address, phone, email, registration_date)
VALUES
('Laura Pérez', 'Calle Sol, 33', '600123456', 'laura@example.com', '2025-10-14'),
('Carlos Díaz', 'Av. Libertad, 20', '600654321', 'carlos@example.com', '2025-10-10'),
('Marta Ruiz', 'Passeig de Gracia, 55', '600987654', 'marta@example.com', '2025-10-12');

INSERT INTO clients (name, postal_address, phone, email, registration_date, recommended_by)
VALUES 
('Andrés Gómez', 'Calle Luna, 15', '600112233', 'andres@example.com', '2025-10-14', 1);

INSERT INTO employees (name)
VALUES
('Jordi Serra'),
('Ana Martí'),
('Marcos López');

INSERT INTO sales (client_id, glass_id, employee_id, sale_date)
VALUES 
(1, 1, 1, '2025-10-14'),
(2, 2, 2, '2025-10-13'),
(4, 3, 1, '2025-10-14');







