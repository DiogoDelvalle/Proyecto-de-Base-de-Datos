/*==============================================================*/
/* Table: COMPROBANTE_DE_TRANSFERENCIA                          */
/*==============================================================*/
create table COMPROBANTE_DE_TRANSFERENCIA (
   ID_COMPROBANTE       int                  not null IDENTITY(1,1),
   ID_DEPOSITO_ORIGEN   int                  null,
   ID_DEPOSITO_DESTINO  int                  null,
   ID_PERSONAL_ENCARGADO int                  null,
   ID_PERSONAL_AUTORIZANTE int                  null,
   FECHA                date            not null,
   constraint PK_COMPROBANTE_DE_TRANSFERENCI primary key (ID_COMPROBANTE)
)
GO
