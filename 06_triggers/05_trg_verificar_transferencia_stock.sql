/*==============================================================*/
/* TRIGGER: EVITAR TRANSFERENCIA DE STOCK QUE DEJE NEGATIVO      */
/*==============================================================*/
CREATE OR ALTER TRIGGER TRG_VerificarTransferenciaStock
ON DETALLES_COMPROBANTE_DE_TRANSFERENCIA
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(
        SELECT 1
        FROM inserted i
        JOIN COMPROBANTE_DE_TRANSFERENCIA c ON i.ID_COMPROBANTE = c.ID_COMPROBANTE
        JOIN STOCK s ON s.ID_DEPOSITO = c.ID_DEPOSITO_ORIGEN AND s.ID_PRODUCTO = i.ID_PRODUCTO
        WHERE s.CANTIDAD < i.CANTIDAD
    )
    BEGIN
        RAISERROR('No hay suficiente stock en deposito origen.',16,1);
        RETURN;
    END

    -- Actualizar stock origen
    UPDATE s
    SET s.CANTIDAD = s.CANTIDAD - i.CANTIDAD
    FROM STOCK s
    JOIN inserted i ON s.ID_PRODUCTO = i.ID_PRODUCTO
    JOIN COMPROBANTE_DE_TRANSFERENCIA c ON i.ID_COMPROBANTE = c.ID_COMPROBANTE
    WHERE s.ID_DEPOSITO = c.ID_DEPOSITO_ORIGEN;

    -- Actualizar stock destino
    UPDATE s
    SET s.CANTIDAD = s.CANTIDAD + i.CANTIDAD
    FROM STOCK s
    JOIN inserted i ON s.ID_PRODUCTO = i.ID_PRODUCTO
    JOIN COMPROBANTE_DE_TRANSFERENCIA c ON i.ID_COMPROBANTE = c.ID_COMPROBANTE
    WHERE s.ID_DEPOSITO = c.ID_DEPOSITO_DESTINO;

    -- Insertar los detalles
    INSERT INTO DETALLES_COMPROBANTE_DE_TRANSFERENCIA(ID_COMPROBANTE, ID_PRODUCTO, CANTIDAD)
    SELECT ID_COMPROBANTE, ID_PRODUCTO, CANTIDAD
    FROM inserted;
END
GO
