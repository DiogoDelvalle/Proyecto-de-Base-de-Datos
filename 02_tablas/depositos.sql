/*==============================================================*/
/* Table: DEPOSITOS                                             */
/*==============================================================*/
create table DEPOSITOS (
   ID_DEPOSITO          int                  not null IDENTITY(1,1),
   NOMBRE               varchar(100)         not null,
   UBICACION            varchar(100)         null,
   constraint PK_DEPOSITOS primary key (ID_DEPOSITO)
)
GO
