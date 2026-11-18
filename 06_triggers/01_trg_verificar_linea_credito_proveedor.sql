/*==============================================================*/
/* TRIGGER: VERIFICAR LINEA DE CREDITO PROVEEDOR                */
/*==============================================================*/
CREATE OR ALTER TRIGGER TRG_VerificarLineaCreditoProveedor
ON FACTURAS
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN PROVEEDORES p ON i.ID_PROVEEDORES = p.ID_PROVEEDORES
        LEFT JOIN FACTURAS f ON i.ID_PROVEEDORES = f.ID_PROVEEDORES
        GROUP BY i.ID_PROVEEDORES, p.CRED_MAXIMO, i.TOTAL
        HAVING SUM(ISNULL(f.SALDO,0)) + i.TOTAL > p.CRED_MAXIMO
    )
    BEGIN
        RAISERROR('La deuda total del proveedor supera su línea de crédito.',16,1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    INSERT INTO FACTURAS(ID_PROVEEDORES, ID_DEPOSITO, FECHA_COMPRA, FECHA_VENCIMIENTO, FECHA_EMISION, TOTAL, CONDICION_COMPRA, SALDO)
    SELECT ID_PROVEEDORES, ID_DEPOSITO, FECHA_COMPRA, FECHA_VENCIMIENTO, FECHA_EMISION, TOTAL, CONDICION_COMPRA, TOTAL
    FROM inserted;
END
GO
