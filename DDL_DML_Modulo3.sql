-- BodegaTech — Script de Inventario
-- Autor: Mauro Bianchi
-- Fecha: 24/10/2026

-- Sección DDL: Definiendo la Estructura

Drop Table if exists inventario; -- al inicio del script una sentencia que elimine la tabla si ya existe

-- Crear la tabla de inventario, defino las columnas y el tipo de datos de cada una

Create Table inventario (
id_producto	INT	identity(1,1) PRIMARY KEY, -- llave primaria, con números enteros y que vaya de 1 en 1
nombre_producto VARCHAR(100) not null,
categoria VARCHAR(50) not null, -- Categoría del producto, como es texto uso varchar
precio_unitario	DECIMAL(10,2) not null, -- precio de cada producto con valores decimales de precio en USD
stock_actual INT not null, -- Unidades disponibles es un número entero 
stock_minimo INT not null, -- Umbral mínimo de reposición es un número entero
fecha_ingreso DATE not null, --	Fecha de ingreso al inventario por eso usamos DATE
activo	bit not null -- 1 = verdadero (disponible), 0 = falso (discontinuado)
);

select*from inventario; -- ejecuto para verificar que quedó bien


-- Sección DML: Trabajando con los datos

--------- INSERT INTO: Insertá los 10 productos en una o varias sentencias INSERT INTO
-- no pongo la columna de id_producto porque lo tengo ya definido como incremental desde 1

INSERT INTO inventario
    (nombre_producto, categoria, precio_unitario, stock_actual,
     stock_minimo, fecha_ingreso, activo)
VALUES
('Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
('Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
('Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
('Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
('Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
('Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
('Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
('Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
('SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
('Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

select*from inventario;-- ejecuto para verificar que haya quedado bien

--------- UPDATE ventas del día

-- Venta de 3 Laptop Pro 15
UPDATE inventario
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;

-- Venta de 12 Mouse Inalámbrico
UPDATE inventario
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;

-- Venta de 5 Auriculares BT Pro
UPDATE inventario
SET stock_actual = stock_actual - 5
WHERE id_producto = 6;

select*from inventario;-- ejecuto para verificar que haya quedado bien

--------- UPDATE producto descontinuado

-- Webcam HD 1080p (id=8) fue descontinuada por el proveedor. Marcala como inactiva actualizando activo = 0.
UPDATE inventario
set activo = 0
where id_producto = 8;

select*from inventario;-- ejecuto para verificar que haya quedado bien


