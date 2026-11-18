--- Para dar alta/baja/modificación de una tabla simple (proveedores, productos, etc)
CREATE PROCEDURE AdministrarProveedores
	@ENTRADA VARCHAR(10), --Recibe 'ALTA', 'BAJA', 'MODIFICAR'
	@ID_PROVEEDOR INT,	--Id del proveedor
	@NOMBRE VARCHAR(100),	--Nombre del proveedor, no puede ser null
    @DIRECCION VARCHAR(100) = NULL, -- Direccion del proveedor, por defecto null
    @TELEFONO VARCHAR(100) = NULL,    -- Telefono del proveedor, por defecto null
	@CORREO VARCHAR(100) = NULL, --Correo del proveedor, por defecto null
	@CRED_MAXIMO NUMERIC(9,2) = NULL --Credito maximo asignado al proveedor, puede ser null
AS
BEGIN
	SET NOCOUNT ON

	IF @ENTRADA = 'ALTA'
	BEGIN
		INSERT INTO PROVEEDORES(NOMBRE, DIRECCION, TELEFONO, CORREO, CRED_MAXIMO)
		VALUES(@NOMBRE, @DIRECCION, @TELEFONO, @CORREO, @CRED_MAXIMO);
		PRINT 'Proveedor insertado correctamente';
	END
	ELSE IF @ENTRADA = 'BAJA'
    BEGIN
        IF @ID_PROVEEDOR IS NULL
        BEGIN
            RAISERROR ('Inserte el ID del proveedor que quiere dar de BAJA.', 16, 1);
            RETURN;
        END

        DELETE FROM PROVEEDORES
        WHERE ID_PROVEEDORES = @ID_PROVEEDOR;

        PRINT 'Proveedor dado de BAJA correctamente.';
    END
    ELSE IF @ENTRADA = 'MODIFICAR'
    BEGIN
        IF @ID_PROVEEDOR IS NULL
        BEGIN
            RAISERROR ('Inserte el ID del proveedor que quiere MODIFICAR.', 16, 1);
            RETURN;
        END

        UPDATE PROVEEDORES
        SET 
            NOMBRE = COALESCE(@NOMBRE, NOMBRE),
            DIRECCION = COALESCE(@DIRECCION, DIRECCION),
            TELEFONO = COALESCE(@TELEFONO, TELEFONO),
            CORREO = COALESCE(@CORREO, CORREO),
            CRED_MAXIMO = COALESCE(@CRED_MAXIMO, CRED_MAXIMO)
        WHERE ID_PROVEEDORES = @ID_PROVEEDOR;

        PRINT 'Proveedor modificado exitosamente.';
    END
    ELSE
    BEGIN
        RAISERROR ('Accion no valida. Use ALTA, BAJA o MODIFICAR.', 16, 1);
    END
END;
GO
