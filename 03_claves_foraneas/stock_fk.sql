alter table STOCK
   add constraint FK_STOCK_REFERENCE_DEPOSITO foreign key (ID_DEPOSITO)
      references DEPOSITOS (ID_DEPOSITO)
go

alter table STOCK
   add constraint FK_STOCK_REFERENCE_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTOS (ID_PRODUCTO)
GO
