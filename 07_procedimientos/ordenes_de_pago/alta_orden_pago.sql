--Para dar alta/baja/modificación de una tabla cabecera-detalle (facturas compras u ordenes de pago)
CREATE OR ALTER PROCEDURE AltaOrdenPago
    @ID_PROVEEDOR INT,
    @FECHA_ORDEN DATE,
    @TOTAL_ORDEN NUMERIC(12,2),
    @DESCRIPCION VARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si existe el proveedor
    IF NOT EXISTS (SELECT 1 FROM PROVEEDORES WHERE ID_PROVEEDORES = @ID_PROVEEDOR)
    BEGIN
        RAISERROR('El proveedor con ID %d no existe.', 16, 1, @ID_PROVEEDOR);
        RETURN;
    END

    -- Insertar la orden de pago
    INSERT INTO ORDENES_DE_PAGO (ID_PROVEEDORES, FECHA_ORDEN, TOTAL_ORDEN, DESCRIPCION)
    VALUES (@ID_PROVEEDOR, @FECHA_ORDEN, @TOTAL_ORDEN, @DESCRIPCION);

    PRINT 'Orden de pago registrada exitosamente.';
END;
GO
