alter table DETALLES_DE_ORDENES_DE_PAGO
   add constraint FK_DETALLES_REFERENCE_FACTURAS foreign key (ID_FACTURAS)
      references FACTURAS (ID_FACTURAS)
go

alter table DETALLES_DE_ORDENES_DE_PAGO
   add constraint FK_DETALLES_REFERENCE_ORDENES_ foreign key (ID_ORDEN)
      references ORDENES_DE_PAGO (ID_ORDEN)
GO
