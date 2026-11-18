/* 2.Productos comprados a proveedores, el criterio de recuperaci�n es por rango de
proveedores y rango de fechas, desplegar los siguientes atributos: C�digo y nombre
del Proveedor, c�digo y descripci�n del producto, �ltima fecha de compra, ultimo
costo unitario.*/

SELECT 
    p.Id_proveedores AS codigo_proveedor,
    p.Nombre AS nombre_proveedor,
    prod.Id_producto AS codigo_producto,
    prod.Descripcion AS descripcion_producto,
    MAX(f.Fecha_compra) AS ultima_fecha_compra,
    /*Subconsulta para que el costo unitario corresponda con la fecha */
    (    
        SELECT TOP 1 dp2.PRECIO_UNITARIO
        FROM 
            DETALLES_DEL_PRODUCTO dp2
            INNER JOIN FACTURAS f2 ON dp2.ID_FACTURAS= f2.ID_FACTURAS
            WHERE f2.ID_PROVEEDORES = p.ID_PROVEEDORES
            AND dp2.ID_PRODUCTO = prod.ID_PRODUCTO
            AND f2.FECHA_COMPRA = (
            /*Otro SELECT*/ 
              SELECT MAX(f3.FECHA_COMPRA)
              FROM FACTURAS f3
              INNER JOIN DETALLES_DEL_PRODUCTO dp3 ON f3.ID_FACTURAS = dp3.ID_FACTURAS
              WHERE f3.ID_PROVEEDORES = p.ID_PROVEEDORES
                AND dp3.ID_PRODUCTO = prod.ID_PRODUCTO
                AND f3.FECHA_COMPRA BETWEEN '2024-01-01' AND '2025-12-31'
          )
    ) AS ultimo_costo_unitario

FROM 
    PROVEEDORES p
INNER JOIN FACTURAS f ON p.ID_PROVEEDORES = f.ID_PROVEEDORES
INNER JOIN DETALLES_DEL_PRODUCTO dp ON f.ID_FACTURAS = dp.ID_FACTURAS
INNER JOIN PRODUCTOS prod ON dp.ID_PRODUCTO = prod.ID_PRODUCTO

WHERE 
    p.ID_PROVEEDORES BETWEEN 1 AND 50 
    AND f.FECHA_COMPRA BETWEEN '2024-01-01' AND '2025-12-31'

GROUP BY 
    p.ID_PROVEEDORES, p.NOMBRE, prod.ID_PRODUCTO, prod.DESCRIPCION

ORDER BY 
    p.ID_PROVEEDORES, prod.ID_PRODUCTO;
GO
