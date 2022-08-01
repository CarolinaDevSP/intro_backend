CREATE DATABASE BDdonRufino;

USE  BDdonRufino;

CREATE TABLE producto (
id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
descripcionP VARCHAR(255) NOT NULL,
precio DECIMAL NOT NULL,
sku VARCHAR(255) NULL);


CREATE TABLE cliente (
id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(255) NOT NULL,
apellidos VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
telefono VARCHAR(11) NOT NULL,
direccion VARCHAR(255) NOT NULL,
codigo_postal VARCHAR(255) NOT NULL,
ciudad VARCHAR(255) NOT NULL);


CREATE TABLE ventas (
id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_cliente INT,
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
id_producto INT,
FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
cantidad INT NOT NULL);


INSERT INTO producto (nombre, descripcionP, precio, sku) VALUES 
('arroz', 'blanco', 5, '34KFDS'),
('fideos', 'don vittorio', 12, '54SKDS'),
('arroz', 'integral', 7.4, '7JD8F'),
('aceite', 'vegetal', 6, '3K52K2'),
('azucar', 'blanca', 4.5, '765KL'),
('manzana', 'verde', 2, '23JJ'),
('coliflor', 'medio kilo', 2.5, 'IU7H8'),
('avena', '3 ositos', 10, 'LJK8SJ'),
('aceite', 'de oliva', 16, '87DJHA'),
('pollo', 'kilo', 10.5, '49KJS5');


INSERT INTO cliente (nombre, apellidos, email, telefono, direccion, codigo_postal, ciudad) VALUES
('FABIOLA','LEON','FABIOLA@GMAIL.COM','65312312','Calle Balderas','43','MONTERREY'),
('FRANCO','ZAPATA','FRANCO@GMAIL.COM','99312256','Calle Del Carmen','42','GUADALAJARA'),
('MARTIN','ALVARADO','MARTIN@HOTMAIL.COM','675674546','Avenida 16','43','MONTERREY'),
('ANA','TORRES','ANA@GMAIL.COM','99312312','Avenida 13','43','MONTERREY'),
('LUCIA','GARCIA','LUCIA@HOTMAIL.COM','65465476','Avenida 13','43','MONTERREY'),
('JUAN','LOPEZ','JUAN@GMAIL.COM','99313242','Av. Veracruz','41','CANCUN'),
('PEDRO','JIMENEZ','PEDRO@GMAIL.COM','65312312','Avenida 19','43','MONTERREY'),
('MARIA','LEON','MARIA@HOTMAIL.COM','86545356','Avenida 24','42','GUADALAJARA'),
('LAURA','NAVARRO','LAURA@GMAIL.COM','993123452','Avenida 13','43','MONTERREY'),
('JULIO','FLORES','JULIO@GMAIL.COM','99235312','CALLE 3','41','CANCUN'),
('DANIEL','LINCH', 'DANIEL@GMAIL.COM.COM', '99235312', 'CALLE 4', '42', 'GUADALAJARA');



INSERT INTO ventas (id_cliente, id_producto, cantidad) VALUES 
(1, 1, 15),
(1, 2, 14),
(1, 3, 13),
(1, 4, 12),
(1, 5, 10),
(1, 6, 09),
(1, 7, 08),
(1, 8, 07),
(1, 9, 06),
(1, 10, 05),
(2, 2, 16),
(3, 3, 17),
(4, 3, 11),
(5, 5, 10),
(6, 6, 18),
(7, 6, 09),
(8, 8, 19),
(9, 9, 20),
(10, 10, 21);


-- ID de los clientes de la Ciudad de Monterrey.
SELECT id_cliente, nombre FROM cliente WHERE ciudad = 'Monterrey';


-- ID y descripción de los productos que cuesten menos de 15 pesos.
SELECT id_producto, nombre, descripcionP FROM producto WHERE precio < 15;


-- ID y nombre de los clientes, cantidad vendida, y descripción del producto, en las
-- ventas en las cuales se vendieron más de 10 unidades.
SELECT C.ID_CLIENTE , C.nombre, V.CANTIDAD, P.descripcionP FROM CLIENTE C, VENTAS V, PRODUCTO P 
WHERE C.ID_CLIENTE = V.ID_CLIENTE AND P.ID_PRODUCTO = V.ID_PRODUCTO AND CANTIDAD > 10;


-- ID y nombre de los clientes que no aparecen en la tabla de ventas (Clientes que no
-- han comprado productos).
SELECT id_cliente, nombre FROM cliente WHERE id_cliente NOT IN (SELECT id_cliente FROM ventas);


-- ID y nombre de los clientes que han comprado todos los productos de la empresa.
SELECT id_cliente, nombre FROM cliente c 
WHERE (SELECT COUNT(DISTINCT id_producto) 
FROM ventas v WHERE c.id_cliente = v.id_cliente) = (SELECT COUNT(*) FROM producto); 


-- ID y nombre de cada cliente y la suma total (suma de cantidad) de los productos
-- que ha comprado.

SELECT SUM(V.CANTIDAD) AS CANTIDAD_TOT, C.ID_CLIENTE, C.NOMBRE
FROM VENTAS V INNER JOIN CLIENTE C ON V.ID_CLIENTE=C.ID_CLIENTE
GROUP BY C.ID_CLIENTE;

-- ID de los productos que no han sido comprados por clientes de Guadalajara.

SELECT V.ID_PRODUCTO, P.NOMBRE AS NOMP, C.NOMBRE, C.CIUDAD FROM VENTAS V INNER JOIN PRODUCTO P ON
V.ID_PRODUCTO=P.ID_PRODUCTO INNER JOIN CLIENTE C ON V.ID_CLIENTE = C.ID_CLIENTE 
WHERE NOT C.CIUDAD IN ('GUADALAJARA');

--------------------
-- ID de los productos que se han vendido a clientes de Monterrey y que también se
-- han vendido a clientes de Cancún.
SELECT V.ID_PRODUCTO, P.NOMBRE AS NOMP, C.NOMBRE, C.CIUDAD FROM VENTAS V INNER JOIN PRODUCTO P ON
V.ID_PRODUCTO=P.ID_PRODUCTO INNER JOIN CLIENTE C ON V.ID_CLIENTE = C.ID_CLIENTE 
WHERE C.CIUDAD IN ('GUADALAJARA', 'CANCUN');

-- Nombre de las ciudades en las que se han vendido todos los productos.
SELECT ciudad FROM cliente JOIN ventas GROUP BY ciudad 
	HAVING 
		COUNT(DISTINCT id_producto) = (SELECT COUNT(*) FROM producto);