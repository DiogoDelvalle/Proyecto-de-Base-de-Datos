/*==============================================================*/
/* Table: STOCK                                                 */
/*==============================================================*/
create table STOCK (
   ID_STOCK             int                  not null IDENTITY(1,1),
   ID_DEPOSITO          int                  not null,
   ID_PRODUCTO          int                  not null,
   CANTIDAD             numeric(4)           not null
      constraint CKC_CANTIDAD_STOCK check (CANTIDAD >= 0),
   constraint PK_STOCK primary key (ID_STOCK)
)
GO
