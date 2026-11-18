/*==============================================================*/
/* Table: IVA                                                   */
/*==============================================================*/
create table IVA (
   ID_IVA               int                  not null IDENTITY(1,1),
   NOMBRE               varchar(100)         not null,
   PORCENTAJE           numeric(2)           not null,
   constraint PK_IVA primary key (ID_IVA)
)
GO
