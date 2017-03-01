/*==============================================================*/
/* Nom de SGBD :  PostgreSQL 8                                  */
/* Date de création :  01/03/2017 20:58:44                      */
/*==============================================================*/


drop index CATEGORIE_PK;

drop table CATEGORIE;

drop index CLIENT_PK;

drop table CLIENT;

drop index ASSOCIATION_1_FK;

drop index COMMANDE_PK;

drop table COMMANDE;

drop index ASSOCIATION_8_FK;

drop index ASSOCIATION_5_FK;

drop index DETAILCOMMANDE_PK;

drop table DETAILCOMMANDE;

drop index JEUX_PK;

drop table JEUX;

drop index ASSOCIATION_7_FK;

drop index ASSOCIATION_6_FK;

drop index JEUXPLATEFORME_PK;

drop table JEUXPLATEFORME;

drop index PLATEFORME_PK;

drop table PLATEFORME;

/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table CATEGORIE (
   IDCATEGORIE          SERIAL               not null,
   NOMCATEGORIE         VARCHAR(20)          null,
   constraint PK_CATEGORIE primary key (IDCATEGORIE)
);

/*==============================================================*/
/* Index : CATEGORIE_PK                                         */
/*==============================================================*/
create unique index CATEGORIE_PK on CATEGORIE (
IDCATEGORIE
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT (
   IDCLIENT             SERIAL               not null,
   NOMCLIENT            VARCHAR(100)         null,
   ADRESSE              VARCHAR(100)         null,
   EMAIL                VARCHAR(50)          null,
   MDP                  VARCHAR(50)          null,
   constraint PK_CLIENT primary key (IDCLIENT)
);

/*==============================================================*/
/* Index : CLIENT_PK                                            */
/*==============================================================*/
create unique index CLIENT_PK on CLIENT (
IDCLIENT
);

/*==============================================================*/
/* Table : COMMANDE                                             */
/*==============================================================*/
create table COMMANDE (
   IDCOMMANDE           SERIAL               not null,
   IDCLIENT             INT4                 not null,
   NOMBREJEUX           INT4                 null,
   DATECOMMANDE         DATE                 null,
   constraint PK_COMMANDE primary key (IDCOMMANDE)
);

/*==============================================================*/
/* Index : COMMANDE_PK                                          */
/*==============================================================*/
create unique index COMMANDE_PK on COMMANDE (
IDCOMMANDE
);

/*==============================================================*/
/* Index : ASSOCIATION_1_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_1_FK on COMMANDE (
IDCLIENT
);

/*==============================================================*/
/* Table : DETAILCOMMANDE                                       */
/*==============================================================*/
create table DETAILCOMMANDE (
   IDDETAIL             SERIAL               not null,
   IDCOMMANDE           INT4                 not null,
   IDJEUXPLATEFORME     INT4                 not null,
   NOMBREJEUX           INT4                 null,
   PRIXTOTAL            DECIMAL              null,
   constraint PK_DETAILCOMMANDE primary key (IDDETAIL)
);

/*==============================================================*/
/* Index : DETAILCOMMANDE_PK                                    */
/*==============================================================*/
create unique index DETAILCOMMANDE_PK on DETAILCOMMANDE (
IDDETAIL
);

/*==============================================================*/
/* Index : ASSOCIATION_5_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_5_FK on DETAILCOMMANDE (
IDCOMMANDE
);

/*==============================================================*/
/* Index : ASSOCIATION_8_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_8_FK on DETAILCOMMANDE (
IDJEUXPLATEFORME
);

/*==============================================================*/
/* Table : JEUX                                                 */
/*==============================================================*/
create table JEUX (
   IDJEUX               SERIAL               not null,
   IDCATEGORIE          INT4                 not null,
   NOMJEUX              VARCHAR(20)          null,
   DETAILJEUX           VARCHAR(255)         null,
   NOMBREJOUEUR         INT4                 null,
   DATESORTIE           DATE                 null,
   constraint PK_JEUX primary key (IDJEUX)
);

/*==============================================================*/
/* Index : JEUX_PK                                              */
/*==============================================================*/
create unique index JEUX_PK on JEUX (
IDJEUX
);

/*==============================================================*/
/* Table : JEUXPLATEFORME                                       */
/*==============================================================*/
create table JEUXPLATEFORME (
   IDJEUXPLATEFORME     SERIAL               not null,
   IDJEUX               INT4                 not null,
   IDPLATEFORME         INT4                 not null,
   NOMBREDVD            INT4                 null,
   PRIXUNITAIRE         DECIMAL              null,
   constraint PK_JEUXPLATEFORME primary key (IDJEUXPLATEFORME)
);

/*==============================================================*/
/* Index : JEUXPLATEFORME_PK                                    */
/*==============================================================*/
create unique index JEUXPLATEFORME_PK on JEUXPLATEFORME (
IDJEUXPLATEFORME
);

/*==============================================================*/
/* Index : ASSOCIATION_6_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_6_FK on JEUXPLATEFORME (
IDJEUX
);

/*==============================================================*/
/* Index : ASSOCIATION_7_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_7_FK on JEUXPLATEFORME (
IDPLATEFORME
);

/*==============================================================*/
/* Table : PLATEFORME                                           */
/*==============================================================*/
create table PLATEFORME (
   IDPLATEFORME         SERIAL               not null,
   NOMPLATEFORME        VARCHAR(20)          null,
   constraint PK_PLATEFORME primary key (IDPLATEFORME)
);

/*==============================================================*/
/* Index : PLATEFORME_PK                                        */
/*==============================================================*/
create unique index PLATEFORME_PK on PLATEFORME (
IDPLATEFORME
);

alter table COMMANDE
   add constraint FK_COMMANDE_ASSOCIATI_CLIENT foreign key (IDCLIENT)
      references CLIENT (IDCLIENT)
      on delete restrict on update restrict;

alter table DETAILCOMMANDE
   add constraint FK_DETAILCO_ASSOCIATI_COMMANDE foreign key (IDCOMMANDE)
      references COMMANDE (IDCOMMANDE)
      on delete restrict on update restrict;

alter table DETAILCOMMANDE
   add constraint FK_DETAILCO_ASSOCIATI_JEUXPLAT foreign key (IDJEUXPLATEFORME)
      references JEUXPLATEFORME (IDJEUXPLATEFORME)
      on delete restrict on update restrict;

alter table JEUX
   add constraint FK_JEUX_ASSOCIATI_CATEGORI foreign key (IDCATEGORIE)
      references CATEGORIE (IDCATEGORIE)
      on delete restrict on update restrict;

alter table JEUXPLATEFORME
   add constraint FK_JEUXPLAT_ASSOCIATI_JEUX foreign key (IDJEUX)
      references JEUX (IDJEUX)
      on delete restrict on update restrict;

alter table JEUXPLATEFORME
   add constraint FK_JEUXPLAT_ASSOCIATI_PLATEFOR foreign key (IDPLATEFORME)
      references PLATEFORME (IDPLATEFORME)
      on delete restrict on update restrict;

