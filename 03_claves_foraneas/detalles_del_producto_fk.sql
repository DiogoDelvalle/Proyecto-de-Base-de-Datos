alter table DETALLES_DEL_PRODUCTO
   add constraint FK_DETALLES_FK_ID_FAC_FACTURAS foreign key (ID_FACTURAS)
      references FACTURAS (ID_FACTURAS)
go

alter table DETALLES_DEL_PRODUCTO
   add constraint FK_DETALLES_FK_ID_PRO_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTOS (ID_PRODUCTO)
go

alter table DETALLES_DEL_PRODUCTO
   add constraint FK_DETALLES_REFERENCE_IVA foreign key (ID_IVA)
      references IVA (ID_IVA)
GO
