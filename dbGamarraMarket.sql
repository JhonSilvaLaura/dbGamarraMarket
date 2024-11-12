DROP DATABASE IF EXISTS dbGamarraMarket;
CREATE DATABASE dbGamarraMarket DEFAULT CHARACTER SET utf8mb4;
USE dbGamarraMarket;

CREATE TABLE CLIENTE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento CHAR(3) NOT NULL,
    numero_documento CHAR(15) NOT NULL UNIQUE,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(90) NOT NULL,
    email VARCHAR(80),
    celular CHAR(9),
    fecha_nacimiento DATE,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE VENDEDOR (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento CHAR(3) NOT NULL,
    numero_documento CHAR(15) NOT NULL UNIQUE,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(90) NOT NULL,
    salario DECIMAL(8,2) NOT NULL,
    celular CHAR(9),
    email VARCHAR(80),
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE PRENDA (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(90) NOT NULL,
    marca VARCHAR(60) NOT NULL,
    cantidad INT NOT NULL,
    talla VARCHAR(10) NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE VENTA (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE,
    cliente_id INT NOT NULL,
    vendedor_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES CLIENTE(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (vendedor_id) REFERENCES VENDEDOR(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE VENTA_DETALLE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cantidad INT NOT NULL,
    venta_id INT NOT NULL,
    prenda_id INT NOT NULL,
    FOREIGN KEY (venta_id) REFERENCES VENTA(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (prenda_id) REFERENCES PRENDA(id) ON DELETE CASCADE ON UPDATE CASCADE
);


ALTER TABLE VENTA
ADD CONSTRAINT fk_cliente_venta
FOREIGN KEY (cliente_id) REFERENCES CLIENTE(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE VENTA
ADD CONSTRAINT fk_vendedor_venta
FOREIGN KEY (vendedor_id) REFERENCES VENDEDOR(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT fk_venta_venta_detalle
FOREIGN KEY (venta_id) REFERENCES VENTA(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT fk_prenda_venta_detalle
FOREIGN KEY (prenda_id) REFERENCES PRENDA(id) ON DELETE CASCADE ON UPDATE CASCADE;
 
 
 -- insertar la tabla de clientes 
 INSERT INTO CLIENTE (tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo)
VALUES 
('DNI', '77889955', 'Alberto', 'Solano Pariona', 'alberto.pariona@empresa.com', '998456103', STR_TO_DATE('1970-02-10', '%Y-%m-%d'), true),
('DNI', '45781233', 'Alicia', 'Garcia Campos', '', '', STR_TO_DATE('1980-03-20', '%Y-%m-%d'), true),
('CNE', '315487922', 'Juana', 'Avila Chumpitaz', 'juana.avila@gmail.com', '923568741', STR_TO_DATE('1986-06-06', '%Y-%m-%d'), true),
('CNE', '122116633', 'Ana', 'Enriquez Flores', 'ana.enriquez@empresa.com', '983658741', STR_TO_DATE('1965-08-01', '%Y-%m-%d'), true),
('DNI', '088741589', 'Claudia', 'Perales Ortiz', 'claudia.perales@yahoo.com', '979845263', STR_TO_DATE('1981-07-25', '%Y-%m-%d'), true),
('DNI', '41528527', 'Mario', 'Barrios Martinez', 'mario.barrios@outlook.com', '986525871', STR_TO_DATE('1987-01-15', '%Y-%m-%d'), true),
('CNE', '172585864', 'Brunela', 'Tarazona Guerra', 'brunela.tarazona@gmail.com', '995236741', STR_TO_DATE('1995-06-01', '%Y-%m-%d'), true),
('DNI', '213756456', 'Alejandro', 'Jimenez Huapaya', '', '941523656', STR_TO_DATE('1968-06-08', '%Y-%m-%d'), true),
('DNI', '153352585', 'Claudia', 'Marquez Litano', 'claudia.marquez@gmail.com', '985814725', STR_TO_DATE('1991-11-19', '%Y-%m-%d'), true),
('CNE', '465772587', 'Mario', 'Rodriguez Mayo', 'mario.rodriguez@outlook.com', '912665287', STR_TO_DATE('1987-11-10', '%Y-%m-%d'), true),
('DNI', '379525514', 'Luisa', 'Guerra Ibarra', 'luisa.guerra@yahoo.com', '974422135', STR_TO_DATE('1988-12-21', '%Y-%m-%d'), true),
('DNI', '741425858', 'Pedro', 'Candela Valenzuela', 'pedro.candela@gmail.com', '941481525', STR_TO_DATE('1995-06-30', '%Y-%m-%d'), true),
('DNI', '53298147', 'Angel', 'Rojas Avila', 'angel.rojas@outlook.com', '997452301', STR_TO_DATE('1975-03-02', '%Y-%m-%d'), true),
('DNI', '15335265', 'Hilario', 'Avila Huapaya', '', '985143256', STR_TO_DATE('2000-04-25', '%Y-%m-%d'), true),
('CNE', '754721186', 'Octavio', 'Marquez Osorio', 'octavio.marquez@yahoo.es', '966223141', STR_TO_DATE('2000-09-25', '%Y-%m-%d'), true),
('DNI', '558639219', 'Manolo', 'Vasquez Saravia', 'manolo.vasquez@outlook.es', '965325874', STR_TO_DATE('1998-01-01', '%Y-%m-%d'), true),
('DNI', '41552657', 'Genoveva', 'Ortiz Quispe', 'genoveva.ortiz@outlook.es', '925641317', STR_TO_DATE('2003-02-14', '%Y-%m-%d'), true),
('CNE', '49985471', 'Oscar', 'Quiroz Zavala', '', '', STR_TO_DATE('2000-03-17', '%Y-%m-%d'), true),
('DNI', '49942217', 'Veronica', 'Romero Vargas', 'veronica.romero@yahoo.es', '988223145', STR_TO_DATE('2002-08-25', '%Y-%m-%d'), true),
('DNI', '200523641', 'Eliseo', 'Prada Ortiz', 'eliseo.prada@yahoo.com', '', STR_TO_DATE('2004-09-15', '%Y-%m-%d'), true);

INSERT INTO VENDEDOR (tipo_documento,numero_documento,nombres,apellidos,salario,celular,email,activo) VALUES
('DNI', '85471236','Enrique','Perez Manco','1500.00','96521873','enrique.perez@outlook.com',true),
('DNI','47259136','Sofia','Avila Solis','1350.00','','',true),
('DNI','61542280','Marcela','Napaico Cama','1600.00','965874357','marcela.napaico@gamil.com',true),
('CNE','742536140','Carmelo','RodriguezChauca','1550.00','','carmelo.rodriguez@yohoo.com',true);

INSERT INTO PRENDA (descripcion, marca, cantidad, talla, precio, activo)
VALUES 
('Pantalon Jeans', 'Levis', 60, '28', 65.80, 1),
('Camisa manga corta', 'Adams', 75, '16', 55.00, 1),
('Polo sport', 'Australia', 100, '16', 40.00, 1),
('Camisa manga larga', 'Newport', 150, '16', 42.50, 1),
('Pijama para caballero', 'Adams', 180, '28', 79.50, 1),
('Corbata', 'Maxwell', 85, '16', 14.50, 1),
('Pijama para dama', 'Adams', 170, '24', 55.50, 1),
('Pantalon Jeans', 'Australia', 200, '28', 68.50, 1),
('Camisa Sport', 'John Holden', 85, '16', 88.50, 1),
('Shorts Jeans', 'Pepe Jeans', 185, '26', 77.20, 1);

INSERT INTO VENTA(fecha_hora, cliente_id, vendedor_id, activo) 
VALUES
(CURRENT_TIMESTAMP, 4, 1, true),
(CURRENT_TIMESTAMP, 6, 3, true),
(CURRENT_TIMESTAMP, 10, 1, true),
(CURRENT_TIMESTAMP, 18, 4, true);

INSERT INTO VENTA_DETALLE (venta_id,prenda_id,cantidad) VALUES 
(1,6,3),
(1,3,5),
(1,2,7),
(2,2,3),
(3,7,4),
(3,10,6),
(3,2,6),
(3,5,7),
(4,2,4),
(4,5,3);



SELECT 
    kcu.CONSTRAINT_NAME AS 'Nombre de Relación',
    kcu.REFERENCED_TABLE_NAME AS 'Tabla Padre',
    kcu.REFERENCED_COLUMN_NAME AS 'Primary Key',
    kcu.TABLE_NAME AS 'Tabla Hija',
    kcu.COLUMN_NAME AS 'Foreign Key'
FROM 
    information_schema.KEY_COLUMN_USAGE AS kcu
WHERE 
    kcu.TABLE_SCHEMA = 'dbGamarraMarket' 
    AND kcu.REFERENCED_TABLE_NAME IS NOT NULL;
    
SHOW TABLES;