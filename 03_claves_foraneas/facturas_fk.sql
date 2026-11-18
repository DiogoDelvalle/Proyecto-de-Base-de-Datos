alter table FACTURAS
   add constraint FK_FACTURAS_REFERENCE_DEPOSITO foreign key (ID_DEPOSITO)
      references DEPOSITOS (ID_DEPOSITO)
go

alter table FACTURAS
   add constraint FK_FACTURAS_REFERENCE_PROVEEDO foreign key (ID_PROVEEDORES)
      references PROVEEDORES (ID_PROVEEDORES)
GO
