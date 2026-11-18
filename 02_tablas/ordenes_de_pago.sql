/*==============================================================*/
/* Table: ORDENES_DE_PAGO                                       */
/*==============================================================*/
create table ORDENES_DE_PAGO (
   ID_ORDEN             int                  not null IDENTITY(1,1),
   ID_PROVEEDORES       int                  not null,
   FECHA_ORDEN          date            not null,
   TOTAL_ORDEN          numeric(12,2)          null,
   DESCRIPCION          varchar(100)         null,
   constraint PK_ORDENES_DE_PAGO primary key (ID_ORDEN)
)
GO
