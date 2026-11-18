alter table PRODUCTOS
   add constraint FK_PRODUCTO_REFERENCE_TIPOS_DE foreign key (ID_TIPO)
      references TIPOS_DE_REPUESTOS (ID_TIPO)
GO
