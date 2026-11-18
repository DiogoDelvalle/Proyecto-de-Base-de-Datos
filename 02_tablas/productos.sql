/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS (
   ID_PRODUCTO          int                  not null IDENTITY(1,1),
   ID_TIPO              int                  not null,
   DESCRIPCION          varchar(100)         not null,
   ULTIMO_COSTO         numeric(9,2)         not null,
   ANO                  varchar(9)           null,
   MARCA                varchar(100)         null,
   constraint PK_PRODUCTOS primary key (ID_PRODUCTO)
)
GO
