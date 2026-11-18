/*==============================================================*/
/* TRIGGER: CONTROLAR TRANSFERENCIAS ENTRE DEPOSITOS            */
/*==============================================================*/
CREATE OR ALTER TRIGGER TRG_ControlarTransferencia
ON COMPROBANTE_DE_TRANSFERENCIA
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(
        SELECT 1
        FROM inserted
        WHERE ID_DEPOSITO_ORIGEN = ID_DEPOSITO_DESTINO
        OR ID_PERSONAL_ENCARGADO = ID_PERSONAL_AUTORIZANTE
    )
    BEGIN
        RAISERROR('Deposito origen distinto de destino y encargado distinto de autorizante.',16,1);
        RETURN;
    END

    INSERT INTO COMPROBANTE_DE_TRANSFERENCIA(ID_DEPOSITO_ORIGEN, ID_DEPOSITO_DESTINO, ID_PERSONAL_ENCARGADO, ID_PERSONAL_AUTORIZANTE, FECHA)
    SELECT ID_DEPOSITO_ORIGEN, ID_DEPOSITO_DESTINO, ID_PERSONAL_ENCARGADO, ID_PERSONAL_AUTORIZANTE, FECHA
    FROM inserted;
END
GO
