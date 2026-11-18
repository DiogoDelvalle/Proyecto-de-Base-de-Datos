CREATE OR ALTER PROCEDURE BajaOrdenPago
    @ID_ORDEN INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM ORDENES_DE_PAGO WHERE ID_ORDEN = @ID_ORDEN)
    BEGIN
        RAISERROR('La orden de pago con ID %d no existe.', 16, 1, @ID_ORDEN);
        RETURN;
    END

    -- Primero eliminar los detalles y tipos asociados
    DELETE FROM ORDENES_TIPOS_DE_PAGO WHERE ID_ORDEN = @ID_ORDEN;
    DELETE FROM DETALLES_DE_ORDENES_DE_PAGO WHERE ID_ORDEN = @ID_ORDEN;

    -- Luego la orden principal
    DELETE FROM ORDENES_DE_PAGO WHERE ID_ORDEN = @ID_ORDEN;

    PRINT 'Orden de pago y sus detalles eliminados correctamente.';
END;
GO
