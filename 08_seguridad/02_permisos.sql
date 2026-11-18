-- ASIGNAR PERMISOS

-- Usuario1: permisos en algunas tablas
GRANT INSERT, UPDATE, DELETE ON PROVEEDORES TO Usuario1;
GRANT INSERT, UPDATE, DELETE ON PRODUCTOS TO Usuario1;
GRANT INSERT, UPDATE, DELETE ON STOCK TO Usuario1;

-- Usuario1: sin permisos en facturas y pagos
-- NO se otorgan permisos en FACTURAS, DETALLES_DE_ORDENES_DE_PAGO, ORDENES_DE_PAGO

-- Usuario2: permisos en las tablas complementarias
GRANT INSERT, UPDATE, DELETE ON FACTURAS TO Usuario2;
GRANT INSERT, UPDATE, DELETE ON DETALLES_DE_ORDENES_DE_PAGO TO Usuario2;
GRANT INSERT, UPDATE, DELETE ON ORDENES_DE_PAGO TO Usuario2;

-- Usuario2: sin permisos en proveedores/productos/stock
-- NO se otorgan permisos en PROVEEDORES, PRODUCTOS, STOCK
GO
