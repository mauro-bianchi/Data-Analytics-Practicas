-- Entregable 5
-- Autor: Mauro Bianchi
-- Fecha: 26/10

USE Ventas_Tech_DB;

-- CONSULTA 1: Vista base del proyecto (INNER JOIN)
---- Propósito: cruzar las ventas con la información de
---- clientes, productos y categorías para analizar
---- la facturación por producto, categoría y ciudad

SELECT
v.id_venta,
v.fecha_venta,
c.id_cliente,
c.nombre AS nombre_cliente,
c.ciudad,
p.nombre_producto,
cat.nombre_categoria AS categoria,
v.cantidad,
v.precio_unitario,
v.cantidad * v.precio_unitario AS total_venta
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos p
    ON v.id_producto = p.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;

-- Hallazgo: Las 10 operaciones de marzo de 2024 generaron una facturación total de $6.444

-- CONSULTA 2: Clientes sin ventas (LEFT JOIN)
---- Propósito: identificar clientes que nunca compraron para que el área de CRM pueda contactarlos

SELECT
c.nombre,
c.email,
c.fecha_registro
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

-- Hallazgo: Ninguno de los 5 clientes registrados está sin compras. CRM no tiene clientes sin ventas para contactar en esta muestra.

-- CONSULTA 3: Productos sin ventas (LEFT JOIN)
---- Propósito: detectar productos sin movimiento comercial para que el área de producto evalúe su situación.

SELECT
p.nombre_producto,
cat.nombre_categoria AS categoria,
p.precio
FROM productos p
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
INNER JOIN categorias cat
    ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL;

-- Hallazgo: Los 6 productos del catálogo registraron al menos una venta. No se detectan artículos sin movimiento en esta muestra.

-- CONSULTA 4: Consolidado por canal (UNION ALL)
---- Propósito: comparar la facturación de dos períodos utilizando etiquetas creadas en la consulta.

SELECT
canal,
SUM(total) AS total_canal
FROM (
    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Periodo 1' AS canal
    FROM ventas
    WHERE fecha_venta BETWEEN '2024-03-05' AND '2024-03-10'

    UNION ALL

    SELECT
        fecha_venta,
        cantidad * precio_unitario AS total,
        'Periodo 2' AS canal
    FROM ventas
    WHERE fecha_venta BETWEEN '2024-03-11' AND '2024-03-15'
) AS consolidado
GROUP BY canal;

-- Hallazgo: El Periodo 1 generó $3.620 frente a $2.824 del Periodo 2, concentrando el 56,2% de la facturación total analizada.