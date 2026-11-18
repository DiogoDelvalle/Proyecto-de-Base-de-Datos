/*==============================================================*/
/* Table: TIPOS_DE_REPUESTOS                                    */
/*==============================================================*/
create table TIPOS_DE_REPUESTOS (
   ID_TIPO              int                  not null IDENTITY(1,1),
   DESCRIPCION          varchar(100)         not null,
   constraint PK_TIPOS_DE_REPUESTOS primary key (ID_TIPO)
)
GO
