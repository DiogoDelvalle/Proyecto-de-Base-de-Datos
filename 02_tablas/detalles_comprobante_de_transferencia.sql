/*==============================================================*/
/* Table: DETALLES_COMPROBANTE_DE_TRANSFERENCIA                 */
/*==============================================================*/
create table DETALLES_COMPROBANTE_DE_TRANSFERENCIA (
   ID_DETALLES_COMPROBANTE int               not null IDENTITY(1,1),
   ID_PRODUCTO          int                  not null,
   ID_COMPROBANTE       int                  not null,
   CANTIDAD             numeric(4)           not null,
   constraint PK_DETALLES_COMPROBANTE_DE_TRA primary key (ID_DETALLES_COMPROBANTE)
)
GO
