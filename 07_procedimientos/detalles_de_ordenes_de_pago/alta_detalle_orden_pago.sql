CREATE OR ALTER PROCEDURE AltaDetalleOrdenPago
    @ID_ORDEN INT,
    @ID_FACTURAS INT,
    @TOTAL NUMERIC(11)
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar que la orden exista
    IF NOT EXISTS (SELECT 1 FROM ORDENES_DE_PAGO WHERE ID_ORDEN = @ID_ORDEN)
    BEGIN
        RAISERROR('La orden con ID %d no existe.', 16, 1, @ID_ORDEN);
        RETURN;
    END

    -- Verificar que la factura exista
    IF NOT EXISTS (SELECT 1 FROM FACTURAS WHERE ID_FACTURAS = @ID_FACTURAS)
    BEGIN
        RAISERROR('La factura con ID %d no existe.', 16, 1, @ID_FACTURAS);
        RETURN;
    END

    -- Insertar el detalle
    INSERT INTO DETALLES_DE_ORDENES_DE_PAGO (ID_FACTURAS, ID_ORDEN, TOTAL)
    VALUES (@ID_FACTURAS, @ID_ORDEN, @TOTAL);

    -- Actualizar el total de la orden
    UPDATE ORDENES_DE_PAGO
    SET TOTAL_ORDEN = (
        SELECT COALESCE(SUM(TOTAL), 0)
        FROM DETALLES_DE_ORDENES_DE_PAGO
        WHERE ID_ORDEN = @ID_ORDEN
    )
    WHERE ID_ORDEN = @ID_ORDEN;
END;
GO
