/*==============================================================*/
/* TRIGGER: ACTUALIZAR SALDO DE FACTURA AL PAGAR                */
/*==============================================================*/
CREATE OR ALTER TRIGGER TRG_ActualizarSaldoFactura
ON DETALLES_DE_ORDENES_DE_PAGO
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE f
    SET SALDO = f.TOTAL - ISNULL(d.total_pagado,0)
    FROM FACTURAS f
    JOIN (
        SELECT ID_FACTURAS, SUM(TOTAL) AS total_pagado
        FROM DETALLES_DE_ORDENES_DE_PAGO DOP
        GROUP BY ID_FACTURAS
    ) d ON f.ID_FACTURAS = d.ID_FACTURAS;
END
GO
