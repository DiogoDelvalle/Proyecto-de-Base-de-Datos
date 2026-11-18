/* 7. Productos que no se compraron por rango de fecha, desplegar los atributos: código y
descripción del producto, precio de compra, ultima fecha de compra. (2) (Resolver
con procedimiento almacenado)*/
CREATE PROCEDURE SP_ProductosNoComprados
   (
   @FechaInicio DATE,
   @FechaFin DATE
    )
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH UltimaCompra AS (
        SELECT 
            dp.ID_PRODUCTO,
            MAX(f.FECHA_COMPRA) AS ULTIMA_FECHA_COMPRA
        FROM DETALLES_DEL_PRODUCTO dp
        INNER JOIN FACTURAS f ON f.ID_FACTURAS = dp.ID_FACTURAS
        GROUP BY dp.ID_PRODUCTO
    )
    SELECT 
        p.ID_PRODUCTO AS Codigo,
        p.DESCRIPCION,
        p.ULTIMO_COSTO AS PrecioCompra,
        uc.ULTIMA_FECHA_COMPRA
    FROM PRODUCTOS p
    LEFT JOIN UltimaCompra uc
        ON p.ID_PRODUCTO = uc.ID_PRODUCTO
    WHERE NOT EXISTS (
        SELECT 1
        FROM DETALLES_DEL_PRODUCTO dp2
        JOIN FACTURAS f2 ON dp2.ID_FACTURAS = f2.ID_FACTURAS
        WHERE dp2.ID_PRODUCTO = p.ID_PRODUCTO
          AND f2.FECHA_COMPRA BETWEEN @FechaInicio AND @FechaFin
    );
END;
GO
