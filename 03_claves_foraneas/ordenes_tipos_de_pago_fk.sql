alter table ORDENES_TIPOS_DE_PAGO
   add constraint FK_ORDENES__REFERENCE_ORDENES_ foreign key (ID_ORDEN)
      references ORDENES_DE_PAGO (ID_ORDEN)
GO
