/*==============================================================*/
/* TRIGGER: EVITAR STOCK NEGATIVO EN MOVIMIENTOS DE STOCK       */
/*==============================================================*/
CREATE OR ALTER TRIGGER TRG_VerificarStock
ON STOCK
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS(SELECT 1 FROM inserted WHERE CANTIDAD < 0)
    BEGIN
        RAISERROR('No se puede dejar stock negativo.',16,1);
        ROLLBACK TRANSACTION;
    END
END
GO
