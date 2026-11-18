/*==============================================================*/
/* Table: FACTURAS                                              */
/*==============================================================*/
create table FACTURAS (
   ID_FACTURAS          int                  not null IDENTITY(1,1),
   ID_PROVEEDORES       int                  not null,
   ID_DEPOSITO          int                  not null,
   FECHA_COMPRA         date                 not null,
   FECHA_VENCIMIENTO    date                 not null,
   FECHA_EMISION        date                 not null,
   TOTAL                numeric(9,2)         null,
   CONDICION_COMPRA     varchar(100)         not null,
   SALDO                numeric(9,2)         null,
   constraint PK_FACTURAS primary key (ID_FACTURAS)
)
GO
