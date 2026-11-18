-- Detalles del Producto
INSERT INTO DETALLES_DEL_PRODUCTO (ID_PRODUCTO, ID_IVA, ID_FACTURAS, PRECIO_UNITARIO, CANTIDAD)
VALUES
(1, 2, 1, 355000, 10),  -- Buj�a NGK, IVA 10%, Factura 1 (Autopartes SRL)
(1, 2, 6, 350000, 2),   -- Buj�a NGK, IVA 10%, Factura 2 (Autopartes SRL)
(2, 1, 2, 550000, 5),    -- Filtro de Aceite, IVA 5%, Factura 2 (Repuestos del Sur)
(3, 2, 3, 200000, 8),    -- Pastilla de Freno, IVA 10%, Factura 3 (MotorWorld)
(4, 2, 4, 150000, 4),   -- Amortiguador, IVA 10%, Factura 4 (Mec�nica Pro)
(5, 2, 5, 1200000, 2),  -- Alternador, IVA 10%, Factura 5 (Repuestos Paraguay)
(3, 2, 7, 300000, 3);
GO
