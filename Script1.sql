
#Creacion de la base de datos con el nombre store si no existe
CREATE DATABASE IF NOT EXISTS store;
#Selección de la base de datos con la que se va a trabajar
USE store;
#Crear la tabla con la información de los proveedores#
CREATE TABLE IF NOT EXISTS suppliers( 
id_supplier INT NOT NULL AUTO_INCREMENT,
suplier_name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
PRIMARY KEY(id_supplier)
);

#Creación de la tabla con información de los productos
CREATE TABLE IF NOT EXISTS products(
id_product INT NOT NULL AUTO_INCREMENT,
product_name VARCHAR(50) NOT NULL,
price FLOAT NOT NULL,
id_supplier INT NOT NULL,
PRIMARY KEY(id_Product),
FOREIGN KEY(id_supplier) REFERENCES suppliers(id_supplier)
);

#Creación de la tabla con la información del cliente
CREATE TABLE IF NOT EXISTS clients(
id_client INT NOT NULL,
client_name VARCHAR(50) NOT NULL,
id_type VARCHAR(30) NOT NULL,
PRIMARY KEY(id_client)
);

#Creación de la tabla con la información de las ventas
CREATE TABLE IF NOT EXISTS sales(
id_sale INT NOT NULL AUTO_INCREMENT,
date_sale DATE NOT NULL,
id_client INT NOT NULL,
id_product INT NOT NULL,
units_purchased INT NOT NULL,
subtotal Float NOT NULL,
state INT NOT NULL,
PRIMARY KEY(id_sale),
FOREIGN KEY(id_client) REFERENCES clients(id_client),
FOREIGN KEY(id_product) REFERENCES products(id_product)
);

#Inserción de información predefinida a las tablas

#Inserción de datos para la tabla de proveedores
INSERT INTO suppliers(suplier_name, email, phone ) VALUES
('Bavaria', 'pedidosBavaria@dominioBavaria.com', 2345677),
('Incauca', 'pedidosIncauca@dominioIncauca.com', 3456789),
('Quala', 'pedidosQuala@dominioQuala.com', 97652332),
('Alpina', 'pedidosAlpina@dominioAlpina.com', 6745832),
('Alqueria', 'pedidosAlqueria@dominioAlqueria.com', 76548329);

#Insersión de datos para la tabla de productos
INSERT INTO products(product_name, price, id_supplier) VALUES
('Pony Malta 1.5 litros', 5200, 1),
('Budweiser lata 269 ml', 2600, 1),
('Lonja de bocadillo', 2200, 2),
('Azucar 500gr', 3100, 2),
('Vive 100 380ml', 2500, 3),
('Yogurt original 150gr', 2400, 4),
('Leche deslactosada 1300ml', 6400, 5);

#Inserción de datos para la tabla de usuarios
INSERT INTO clients(id_client, id_type, client_name) VALUES
(123456, 'Cedula de ciudanania', 'Jose Bohorquez'),
(9867543, 'Cedula de extranjeria', 'Vanesa Torres'),
(456789, 'Tarjeta de identidad', 'Alexandra Mora');

#Inserción de datos a la tabla de ventas
INSERT INTO sales(date_sale, id_client, id_product, units_purchased, subtotal, state) VALUES
('2022-12-01', 123456, 1, 3, 15600, 0),
('2023-03-12', 123456, 3, 3, 6600, 0),
('2022-10-21', 9867543, 7, 2, 12800, 0),
('2022-10-22', 9867543, 6, 1, 2400, 0),
('2022-09-20', 456789, 5, 2, 5000, 0),
('2022-07-19', 456789, 4, 5, 12500, 0);

#Borrar de forma lógica dos ventas realizadas
/*El parámetro state tendra el valor 0 para los registros de la base de datos que no esten
 borrados de forma lógica y 1 cuando el borrado lógico este activado.*/
 
 UPDATE sales SET state = 1 WHERE id_sale = 2;
 UPDATE sales SET state = 1 WHERE id_sale = 5;

#Borrar dos ventas de forma fisica
DELETE FROM sales WHERE id_sale = 3;
DELETE FROM sales WHERE id_sale = 6;

#Modificar productos en proveedor y nombre 
UPDATE products SET product_name = 'Panela 500 gr', id_supplier = 2 WHERE id_product= 1;
UPDATE products SET product_name = 'Poker 330 cc lata', id_supplier = 1 WHERE id_product= 2;
UPDATE products SET product_name = 'Nutriday', id_supplier = 5 WHERE id_product= 6;



