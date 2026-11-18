/* 5. Ranking de productos (Productos m�s comprados, por cantidad de productos). */
SELECT 
    prod.Id_producto AS codigo_producto,
    prod.Descripcion AS descripcion_producto,
    SUM(dp.Cantidad) AS total_cantidad_comprada
FROM Productos prod
JOIN Detalles_del_Producto dp ON prod.Id_producto = dp.Id_producto
JOIN Facturas f ON dp.Id_facturas = f.Id_facturas
GROUP BY prod.Id_producto, prod.Descripcion
ORDER BY total_cantidad_comprada DESC;
GO
