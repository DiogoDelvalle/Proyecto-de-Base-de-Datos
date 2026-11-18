-- Comprobante de Transferencia
INSERT INTO COMPROBANTE_DE_TRANSFERENCIA (ID_DEPOSITO_ORIGEN, ID_DEPOSITO_DESTINO, ID_PERSONAL_ENCARGADO, ID_PERSONAL_AUTORIZANTE, FECHA)
VALUES
(1, 2, 1, 2, '2025-01-20'), -- Transferencia de Dep�sito General a Sal�n, Encargado Juan, Autoriza Mar�a
(2, 1, 1, 2, '2025-02-15'), -- De Sal�n a General, Encargado Juan, Autoriza Maria
(1, 2, 1, 2, '2025-03-10'), -- General ? Sal�n, Encargado Juan, Autoriza Maria
(2, 1, 1, 2, '2025-04-25'), -- Sal�n ? General, Encargado Juan, Autoriza Mar�a
(1, 2, 1, 2, '2025-05-30'); -- General ? Sal�n, Encargado Juan, Autoriza Mar�a
GO
