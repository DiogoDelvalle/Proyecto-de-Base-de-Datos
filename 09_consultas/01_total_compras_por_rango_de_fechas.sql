/*1. Monto del importe total de compras realizadas en un rango de fechas (entre dos
fechas), desplegar los atributos: fecha, codigo y nombre de deposito, importe total
de compras para esa fecha y dep�sito. */
SELECT 
    f.Fecha_compra AS fecha,
    d.Id_deposito AS codigo_deposito,
    d.Nombre AS nombre_deposito,
    SUM(f.TOTAL) AS importe_total_compras
FROM Facturas f
JOIN Proveedores p ON f.Id_proveedores = p.Id_proveedores
JOIN Depositos d ON f.ID_DEPOSITO = d.Id_deposito
WHERE f.Fecha_compra BETWEEN '2024-01-01' AND '2025-12-31'
GROUP BY f.Fecha_compra, d.Id_deposito, d.Nombre
ORDER BY f.Fecha_compra, d.Id_deposito;
GO
