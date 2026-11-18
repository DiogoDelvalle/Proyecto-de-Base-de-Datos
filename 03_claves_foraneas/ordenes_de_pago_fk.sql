alter table ORDENES_DE_PAGO
   add constraint FK_ORDENES__REFERENCE_PROVEEDO foreign key (ID_PROVEEDORES)
      references PROVEEDORES (ID_PROVEEDORES)
GO
