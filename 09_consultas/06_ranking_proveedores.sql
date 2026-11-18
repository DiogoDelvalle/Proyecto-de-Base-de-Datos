/* 6. Ranking de proveedores(Proveedores a los que m�s se les compra, por monto de
facturaci�n).*/
SELECT 
    p.Id_proveedores AS codigo_proveedor,
    p.Nombre AS nombre_proveedor,
    SUM(f.Total) AS total_facturado
FROM Proveedores p
JOIN Facturas f ON p.Id_proveedores = f.Id_proveedores
GROUP BY p.Id_proveedores, p.Nombre
ORDER BY total_facturado DESC;
GO
