/*==============================================================*/
/* Table: ORDENES_TIPOS_DE_PAGO                                 */
/*==============================================================*/
create table ORDENES_TIPOS_DE_PAGO (
   ID_TIPO              int                  not null IDENTITY(1,1),
   ID_ORDEN             int                  not null,
   TIPO_DE_PAGO         varchar(100)         not null,
   MONTO_DE_PAGO        numeric(9)           not null,
   constraint PK_ORDENES_TIPOS_DE_PAGO primary key (ID_TIPO)
)
GO
