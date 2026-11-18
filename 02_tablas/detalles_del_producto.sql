/*==============================================================*/
/* Table: DETALLES_DEL_PRODUCTO                                 */
/*==============================================================*/
create table DETALLES_DEL_PRODUCTO (
   ID_DETALLE_PRODUCTO  int                  not null IDENTITY(1,1),
   ID_PRODUCTO          int                  not null,
   ID_IVA               int                  not null,
   ID_FACTURAS          int                  not null,
   PRECIO_UNITARIO      numeric(10)          not null,
   CANTIDAD             numeric(4)           not null,
   constraint PK_DETALLES_DEL_PRODUCTO primary key (ID_DETALLE_PRODUCTO)
)
GO
