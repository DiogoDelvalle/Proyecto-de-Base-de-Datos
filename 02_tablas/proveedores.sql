/*==============================================================*/
/* Table: PROVEEDORES                                           */
/*==============================================================*/
create table PROVEEDORES (
   ID_PROVEEDORES       int                  not null IDENTITY(1,1),
   NOMBRE               varchar(100)         not null,
   DIRECCION            varchar(100)         null,
   TELEFONO             varchar(100)         null,
   CORREO               varchar(100)         null,
   CRED_MAXIMO          numeric(9,2)         null,
   constraint PK_PROVEEDORES primary key (ID_PROVEEDORES)
)
GO
