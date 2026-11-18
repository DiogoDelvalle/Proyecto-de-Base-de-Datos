/*==============================================================*/
/* Table: DETALLES_DE_ORDENES_DE_PAGO                           */
/*==============================================================*/
create table DETALLES_DE_ORDENES_DE_PAGO (
   ID_DETALLE_ORDEN     int                  not null IDENTITY(1,1),
   ID_FACTURAS          int                  not null,
   ID_ORDEN             int                  not null,
   TOTAL                numeric(11)          not null,
   constraint PK_DETALLES_DE_ORDENES_DE_PAGO primary key (ID_DETALLE_ORDEN)
)
GO
