/*==============================================================*/
/* Table: PERSONAL                                              */
/*==============================================================*/
create table PERSONAL (
   ID_PERSONAL          int                  not null IDENTITY(1,1),
   NOMBRE               varchar(100)         not null,
   ROL                  varchar(50)          not null,
   constraint PK_PERSONAL primary key (ID_PERSONAL)
)
GO
