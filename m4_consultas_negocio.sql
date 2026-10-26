-- Entregable 4: Extrayendo métricas clave 
-- Autor: Mauro Bianchi
-- Fecha: 25/10

USE Ventas_Tech_DB; -- me aseguro de estar dentro del DB adecuado
SELECT*FROM ventas; -- la llamo para verla y saber lo que estoy calculando

-- Consulta 1 - Resumen Ejecutivo Mensual
------ Total facturado, cantidad de pedidos, ticket promedio, agrupados por mes (TODO JUNTO)

SELECT 
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado,
COUNT(id_venta) AS cantidad_pedidos,
AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY month(fecha_venta);

-- Consulta 2: Ranking de Productos
------ TOP 5 de id_producto por total_facturado, mostrando unidades vendidas y total generado

SELECT TOP 5
id_producto,
SUM(cantidad) AS unidades_vendidas,
SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

-- Consulta 3: Clientes recurrentes
------ id_cliente que hayan realizado más de un pedido, mostrando cantidad_pedidos y total gastado

SELECT 
id_cliente,
COUNT(*) AS cantidad_pedidos,
SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

-- Consulta 4: Meses por encima / por debajo del promedio
------ Total facturado por mes, CASE WHEN si ese mes quedó por encima o debajo del promedio mensual

WITH facturacion_mensual AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
)

SELECT
    mes,
    total_facturado,
    CASE
        WHEN total_facturado > AVG(total_facturado) OVER ()
            THEN 'Por encima'
        WHEN total_facturado < AVG(total_facturado) OVER ()
            THEN 'Por debajo'
        ELSE 'Igual al promedio'
    END AS comparacion_promedio
FROM facturacion_mensual
ORDER BY mes;

-- Bloque de Cierre: Hallazgos del análisis

-- 1. Durante marzo de 2024 se registraron 10 pedidos, con una facturación total de $6.444 y un ticket promedio de $644,40

-- 2. El producto 1 fue el de mayor facturación, generando $3.600, lo que representa el 55,9% de la facturación total

-- 3. Los 5 clientes registrados realizaron 2 pedidos cada uno, por lo que el 100% de los clientes fueron recurrentes.