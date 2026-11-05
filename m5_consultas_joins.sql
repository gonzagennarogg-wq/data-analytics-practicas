USE ventas_tech_db;

--Realizo la primera consulta con la union de las tablas y columnas solicitadas

SELECT 
    v.fecha_venta,
    c.nombre AS cliente,
    c.ciudad,                          -- Agrego una columna descriptiva, en este caso segmenta la zona
    cat.nombre_categoria AS categoria, -- Añado otra columa descriptiva, en este caso del producto, diferenciando por categoria
    p.nombre_producto,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta
FROM ventas AS v                       --Modificamos el nombre de las tablas para facilitar el codigo
INNER JOIN clientes AS c 
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p 
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat 
    ON p.id_categoria = cat.id_categoria;

--Consulta 2 con LEFT JOIN. Aqui solo se mostrará los clientes que no hayan comprado

SELECT 
    c.nombre AS cliente,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v 
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

--Consulta 3 con RIGHT JOIN. Aqui solo se mostrará los productos que todavía no se hayan vendido.

SELECT 
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos AS p
INNER JOIN categorias AS cat 
    ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas AS v 
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;

--Consulta 4. Para esta consulta, se utiliza el periodo
-- Esta decision se toma porque se planteó que hubo una reducción en el último cuatrimestre. 

SELECT 
    periodo, 
    SUM(total) AS total_periodo 
FROM (
    SELECT 
        fecha_venta, 
        (cantidad * precio_unitario) AS total, 
        'Primer Cuatrimestre' AS periodo
    FROM ventas 
    WHERE MONTH(fecha_venta) BETWEEN 1 AND 4

    UNION ALL

    SELECT 
        fecha_venta, 
        (cantidad * precio_unitario) AS total, 
        'Segundo Cuatrimestre' AS periodo 
    FROM ventas 
    WHERE MONTH(fecha_venta) BETWEEN 5 AND 8

    UNION ALL

    SELECT 
        fecha_venta, 
        (cantidad * precio_unitario) AS total, 
        'Tercer cuatrimestre' AS periodo 
    FROM ventas 
    WHERE MONTH(fecha_venta) BETWEEN 9 AND 12
) AS consolidado
GROUP BY periodo; 

