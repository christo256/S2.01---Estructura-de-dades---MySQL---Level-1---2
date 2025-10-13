CREATE DATABASE OpticaCulDampolla;
USE OpticaCulDampolla;


CREATE TABLE supplier (
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

CREATE TABLE glasses (
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

CREATE TABLE clients (
client_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
postal_adress VARCHAR(200), 