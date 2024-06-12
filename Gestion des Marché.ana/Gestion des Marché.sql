-- Script g�n�r� par WINDEV le 23/04/2022 23:40:35
-- Tables de l'analyse Gestion des March�.wda
-- pour PostgreSQL

-- Suppression de la table AffectationPersonnel
DROP TABLE "AffectationPersonnel" ;
-- Cr�ation de la table AffectationPersonnel
-- Le type "Combinaison" de la rubrique "TypePoste" n'est pas support�.

-- Suppression de la table archivedocs
DROP TABLE "archivedocs" ;
-- Cr�ation de la table archivedocs
CREATE TABLE "archivedocs" (
    "idArchiveDocs" SERIAL8  PRIMARY KEY ,
    "Nom" VARCHAR(100)  UNIQUE ,
    "Taille" VARCHAR(45) ,
    "Document" BYTEA ,
    "IDtypeDoc" BIGINT ,
    "IDOuvrages" BIGINT ,
    "DateDocument" DATE ,
    "IDCreatedBy" INTEGER ,
    "Acc�sPublic" BOOL DEFAULT false,
    "R�f" VARCHAR(20) ,
    "IDProjet" INTEGER ,
    "IDAuteur" BIGINT DEFAULT 0);
CREATE INDEX "WDIDX_archivedocs_IDtypeDoc" ON "archivedocs" ("IDtypeDoc");
CREATE INDEX "WDIDX_archivedocs_IDOuvrages" ON "archivedocs" ("IDOuvrages");
CREATE INDEX "WDIDX_archivedocs_IDCreatedBy" ON "archivedocs" ("IDCreatedBy");
CREATE INDEX "WDIDX_archivedocs_IDProjet" ON "archivedocs" ("IDProjet");
CREATE INDEX "WDIDX_archivedocs_IDAuteur" ON "archivedocs" ("IDAuteur");

-- Suppression de la table BPDE
DROP TABLE "BPDE" ;
-- Cr�ation de la table BPDE
CREATE TABLE "BPDE" (
    "IDBPDE" SERIAL8  PRIMARY KEY ,
    "Indice" INTEGER DEFAULT 0,
    "NumPrix" NUMERIC(10,0) ,
    "Unit�" VARCHAR(8) ,
    "D�signation" VARCHAR(200) ,
    "quantit�" NUMERIC(8,2) DEFAULT 0,
    "PU_HT" NUMERIC(12,2) DEFAULT 0,
    "IDProjet" INTEGER ,
    "ModifQt�" NUMERIC(8,2) DEFAULT 0,
    "IDBPDEParent" BIGINT DEFAULT 0,
    "Reserves" TEXT ,
    "Commentaires" TEXT ,
    "IDTabD�lais" BIGINT ,
    "IDRecepCloture" BIGINT );
CREATE INDEX "WDIDX_BPDE_IDProjet" ON "BPDE" ("IDProjet");
CREATE INDEX "WDIDX_BPDE_IDBPDEParent" ON "BPDE" ("IDBPDEParent");
CREATE INDEX "WDIDX_BPDE_IDTabD�lais" ON "BPDE" ("IDTabD�lais");
CREATE INDEX "WDIDX_BPDE_IDRecepCloture" ON "BPDE" ("IDRecepCloture");

-- Suppression de la table Caract�rePrix
DROP TABLE "Caract�re Prix" ;
-- Cr�ation de la table Caract�rePrix
CREATE TABLE "Caract�re Prix" (
    "Caract�re_Prix" VARCHAR(50)  UNIQUE ,
    "IDCaract�re_Prix" SERIAL4  PRIMARY KEY );

-- Suppression de la table ConfigurationDroitsAcc�s
DROP TABLE "ConfigurationDroitsAcc�s" ;
-- Cr�ation de la table ConfigurationDroitsAcc�s
-- Le type "Combinaison" de la rubrique "Droits" n'est pas support�.
-- Le type "Combinaison" de la rubrique "Filtres" n'est pas support�.

-- Suppression de la table ControlesdesPrix
DROP TABLE "ControlesdesPrix" ;
-- Cr�ation de la table ControlesdesPrix
CREATE TABLE "ControlesdesPrix" (
    "IDControle" BIGINT  NOT NULL  DEFAULT 0,
    "IDBPDE" BIGINT );
CREATE INDEX "WDIDX_ControlesdesPrix_IDControle" ON "ControlesdesPrix" ("IDControle");
CREATE INDEX "WDIDX_ControlesdesPrix_IDBPDE" ON "ControlesdesPrix" ("IDBPDE");
CREATE INDEX "WDIDX_ControlesdesPrix_IDPrix_IDControle" ON "ControlesdesPrix" ("IDBPDE","IDControle");

-- Suppression de la table ControlesdesPrix_Rapports
DROP TABLE "ControlesdesPrix_Rapports" ;
-- Cr�ation de la table ControlesdesPrix_Rapports
CREATE TABLE "ControlesdesPrix_Rapports" (
    "IDPrix_IDControle" BYTEA ,
    "IDRapportControle" BIGINT );
CREATE INDEX "WDIDX_ControlesdesPrix_Rapports_IDPrix_IDControle" ON "ControlesdesPrix_Rapports" ("IDPrix_IDControle");
CREATE INDEX "WDIDX_ControlesdesPrix_Rapports_IDRapportControle" ON "ControlesdesPrix_Rapports" ("IDRapportControle");
CREATE INDEX "WDIDX_ControlesdesPrix_Rapports_IDPrix_IDCont_IdRappCont" ON "ControlesdesPrix_Rapports" ("IDPrix_IDControle","IDRapportControle");

-- Suppression de la table ControlesTechniques
DROP TABLE "ControlesTechniques" ;
-- Cr�ation de la table ControlesTechniques
CREATE TABLE "ControlesTechniques" (
    "IDControle" SERIAL8  PRIMARY KEY ,
    "D�signation" VARCHAR(50) ,
    "IdArchiveDocs" BIGINT DEFAULT 0,
    "IDControleParent" BIGINT DEFAULT 0,
    "Indice" INTEGER DEFAULT 0);
CREATE INDEX "WDIDX_ControlesTechniques_IdArchiveDocs" ON "ControlesTechniques" ("IdArchiveDocs");
CREATE INDEX "WDIDX_ControlesTechniques_IDControleParent" ON "ControlesTechniques" ("IDControleParent");

-- Suppression de la table Courriers
DROP TABLE "Courriers" ;
-- Cr�ation de la table Courriers
CREATE TABLE "Courriers" (
    "IDPriorit�" BIGINT DEFAULT 0,
    "IDCourriers" SERIAL8  PRIMARY KEY ,
    "IDtypeCourrier" BIGINT DEFAULT 0,
    "ObjetCourrier" VARCHAR(200) ,
    "dateR�ception" DATE ,
    "Datecourrier" DATE ,
    "IDEtatCourrier" BIGINT ,
    "IDCreatedBy" INTEGER DEFAULT 0,
    "IDCourriersParent" BIGINT DEFAULT 0,
    "IDProjet" INTEGER ,
    "IDArchiveDocs" BIGINT ,
    "R�f�rence" VARCHAR(20) ,
    "DateEcheance" DATE ,
    "IDtypeDoc" BIGINT ,
    "IDEntit�sAdmin" BIGINT DEFAULT 0,
    "IDCharg�Aff" INTEGER );
CREATE INDEX "WDIDX_Courriers_IDPriorit�" ON "Courriers" ("IDPriorit�");
CREATE INDEX "WDIDX_Courriers_IDtypeCourrier" ON "Courriers" ("IDtypeCourrier");
CREATE INDEX "WDIDX_Courriers_IDEtatCourrier" ON "Courriers" ("IDEtatCourrier");
CREATE INDEX "WDIDX_Courriers_IDCreatedBy" ON "Courriers" ("IDCreatedBy");
CREATE INDEX "WDIDX_Courriers_IDCourriersParent" ON "Courriers" ("IDCourriersParent");
CREATE INDEX "WDIDX_Courriers_IDProjet" ON "Courriers" ("IDProjet");
CREATE INDEX "WDIDX_Courriers_IDArchiveDocs" ON "Courriers" ("IDArchiveDocs");
CREATE INDEX "WDIDX_Courriers_R�f�rence" ON "Courriers" ("R�f�rence");
CREATE INDEX "WDIDX_Courriers_IDtypeDoc" ON "Courriers" ("IDtypeDoc");
CREATE INDEX "WDIDX_Courriers_IDEntit�sAdmin" ON "Courriers" ("IDEntit�sAdmin");
CREATE INDEX "WDIDX_Courriers_IDCharg�Aff" ON "Courriers" ("IDCharg�Aff");

-- Suppression de la table Destinataire_Expediteur
DROP TABLE "Destinataire_Expediteur" ;
-- Cr�ation de la table Destinataire_Expediteur
CREATE TABLE "Destinataire_Expediteur" (
    "IDCourriers" BIGINT ,
    "IDEntit�ExpDest" BIGINT  NOT NULL  DEFAULT 0);
CREATE INDEX "WDIDX_Destinataire_Expediteur_IDCourriers" ON "Destinataire_Expediteur" ("IDCourriers");
CREATE INDEX "WDIDX_Destinataire_Expediteur_IDEntit�ExpDest" ON "Destinataire_Expediteur" ("IDEntit�ExpDest");
CREATE INDEX "WDIDX_Destinataire_Expediteur_IDEntit�ExpDest_IDCourriers" ON "Destinataire_Expediteur" ("IDEntit�ExpDest","IDCourriers");

-- Suppression de la table DestinatairesProjetR�ponse
DROP TABLE "DestinatairesProjetR�ponse" ;
-- Cr�ation de la table DestinatairesProjetR�ponse
CREATE TABLE "DestinatairesProjetR�ponse" (
    "IDProjetR�p" BIGINT ,
    "IDEntit�ExpDest" BIGINT  NOT NULL  DEFAULT 0);
CREATE INDEX "WDIDX_DestinatairesProjetR�ponse_IDProjetR�p" ON "DestinatairesProjetR�ponse" ("IDProjetR�p");
CREATE INDEX "WDIDX_DestinatairesProjetR�ponse_IDEntit�ExpDest" ON "DestinatairesProjetR�ponse" ("IDEntit�ExpDest");
CREATE INDEX "WDIDX_DestinatairesProjetR�ponse_IDEntit�ExpDest_IDProjetR�p" ON "DestinatairesProjetR�ponse" ("IDEntit�ExpDest","IDProjetR�p");

-- Suppression de la table D�tailAttachements
DROP TABLE "D�tailAttachements" ;
-- Cr�ation de la table D�tailAttachements
CREATE TABLE "D�tailAttachements" (
    "IDReception" BIGINT ,
    "IDBPDE" BIGINT ,
    "quantit�" NUMERIC(8,2)  NOT NULL  DEFAULT 0);
CREATE INDEX "WDIDX_D�tailAttachements_IDReception" ON "D�tailAttachements" ("IDReception");
CREATE INDEX "WDIDX_D�tailAttachements_IDBPDE" ON "D�tailAttachements" ("IDBPDE");
CREATE INDEX "WDIDX_D�tailAttachements_IDBPDE_IDReception" ON "D�tailAttachements" ("IDBPDE","IDReception");

-- Suppression de la table D�tailPvR�ception
DROP TABLE "D�tailPvR�ception" ;
-- Cr�ation de la table D�tailPvR�ception
CREATE TABLE "D�tailPvR�ception" (
    "IDTabD�lais" BIGINT ,
    "IDReception" BIGINT ,
    "Retard" INTEGER  NOT NULL  DEFAULT 0);
CREATE INDEX "WDIDX_D�tailPvR�ception_IDTabD�lais" ON "D�tailPvR�ception" ("IDTabD�lais");
CREATE INDEX "WDIDX_D�tailPvR�ception_IDReception" ON "D�tailPvR�ception" ("IDReception");
CREATE INDEX "WDIDX_D�tailPvR�ception_IDD�laisIDReception" ON "D�tailPvR�ception" ("IDTabD�lais","IDReception");

-- Suppression de la table Documents
DROP TABLE "Documents" ;
-- Cr�ation de la table Documents
CREATE TABLE "Documents" (
    "IDDocument" SERIAL8  PRIMARY KEY ,
    "Document" BYTEA ,
    "IdArchiveDocs" BIGINT );
CREATE INDEX "WDIDX_Documents_IdArchiveDocs" ON "Documents" ("IdArchiveDocs");

-- Suppression de la table ElementPrix
DROP TABLE "ElementPrix" ;
-- Cr�ation de la table ElementPrix
CREATE TABLE "ElementPrix" (
    "IDElementPrix" SERIAL8  PRIMARY KEY ,
    "Element" VARCHAR(10) ,
    "Qt�" NUMERIC(8,2) DEFAULT 0,
    "IDBPDE" BIGINT );
CREATE INDEX "WDIDX_ElementPrix_Element" ON "ElementPrix" ("Element");
CREATE INDEX "WDIDX_ElementPrix_IDBPDE" ON "ElementPrix" ("IDBPDE");
CREATE INDEX "WDIDX_ElementPrix_IDPrixIDElement" ON "ElementPrix" ("IDBPDE","Element");

-- Suppression de la table ElemPrixVald�s
DROP TABLE "ElementsdePrixValid�s" ;
-- Cr�ation de la table ElemPrixVald�s
CREATE TABLE "ElementsdePrixValid�s" (
    "IDPrix_IDCont_IdRappCont" BYTEA  NOT NULL ,
    "IDElementPrix" BIGINT );
CREATE INDEX "WDIDX_ElemPrixVald�s_IDPrix_IDCont_IdRappCont" ON "ElementsdePrixValid�s" ("IDPrix_IDCont_IdRappCont");
CREATE INDEX "WDIDX_ElemPrixVald�s_IDElementPrix" ON "ElementsdePrixValid�s" ("IDElementPrix");
CREATE INDEX "WDIDX_ElemPrixVald�s_IDPrix_IDContr_IdRappCont_IDElemPrix" ON "ElementsdePrixValid�s" ("IDPrix_IDCont_IdRappCont","IDElementPrix");

-- Suppression de la table Entit�sOrg
DROP TABLE "Entit�sOrg" ;
-- Cr�ation de la table Entit�sOrg
CREATE TABLE "Entit�sOrg" (
    "IDEntit�sOrg" BIGINT  NOT NULL  UNIQUE  DEFAULT 0,
    "Intitul�" VARCHAR(100) ,
    "Adresse" TEXT ,
    "Ville" VARCHAR(70) ,
    "Pays" VARCHAR(200) ,
    "T�l�phone" VARCHAR(20) ,
    "Fax" VARCHAR(20) ,
    "EntetePage" BYTEA ,
    "PiedPage" BYTEA ,
    "Abr�viation" VARCHAR(50) ,
    "IDEntit�sOrgParent" BIGINT DEFAULT 0,
    "IDVersionsOrg" BIGINT DEFAULT 0);
CREATE INDEX "WDIDX_Entit�sOrg_Intitul�" ON "Entit�sOrg" ("Intitul�");
CREATE INDEX "WDIDX_Entit�sOrg_IDEntit�sOrgParent" ON "Entit�sOrg" ("IDEntit�sOrgParent");
CREATE INDEX "WDIDX_Entit�sOrg_IDVersionsOrg" ON "Entit�sOrg" ("IDVersionsOrg");

-- Suppression de la table EtatCourrier
DROP TABLE "EtatCourrier" ;
-- Cr�ation de la table EtatCourrier
CREATE TABLE "EtatCourrier" (
    "IDEtatCourrier" SERIAL8  PRIMARY KEY ,
    "EtatCourrier" VARCHAR(50)  UNIQUE );

-- Suppression de la table EtatProjet
DROP TABLE "EtatProjet" ;
-- Cr�ation de la table EtatProjet
CREATE TABLE "EtatProjet" (
    "Etat" VARCHAR(50)  NOT NULL  UNIQUE ,
    "IDEtat" SERIAL4  PRIMARY KEY );

-- Suppression de la table EtatTask
DROP TABLE "EtatTask" ;
-- Cr�ation de la table EtatTask
CREATE TABLE "EtatTask" (
    "IDEtatTask" SERIAL8  PRIMARY KEY ,
    "Etat" VARCHAR(50)  UNIQUE );

-- Suppression de la table FormeMarch�
DROP TABLE "Forme March�" ;
-- Cr�ation de la table FormeMarch�
CREATE TABLE "Forme March�" (
    "Forme" VARCHAR(50)  UNIQUE ,
    "IDForme" SERIAL4  PRIMARY KEY );

-- Suppression de la table GPU_Groupe
DROP TABLE "GPU_Groupe" ;
-- Cr�ation de la table GPU_Groupe
CREATE TABLE "GPU_Groupe" (
    "IDGroupe" SERIAL4  PRIMARY KEY ,
    "Nom" VARCHAR(255) ,
    "IDGroupeParent" INTEGER );
CREATE INDEX "WDIDX_GPU_Groupe_Nom" ON "GPU_Groupe" ("Nom");
CREATE INDEX "WDIDX_GPU_Groupe_IDGroupeParent" ON "GPU_Groupe" ("IDGroupeParent");

-- Suppression de la table GPU_Utilisateur
DROP TABLE "GPU_Utilisateur" ;
-- Cr�ation de la table GPU_Utilisateur
CREATE TABLE "GPU_Utilisateur" (
    "Login" VARCHAR(255)  NOT NULL  UNIQUE ,
    "Nom" VARCHAR(255)  NOT NULL ,
    "Prenom" VARCHAR(255)  NOT NULL ,
    "MotPasse" VARCHAR(50)  NOT NULL ,
    "Superviseur" BOOL  NOT NULL  DEFAULT false,
    "MotPasseASaisir" BOOL  NOT NULL  DEFAULT true,
    "IDUtilisateur" SERIAL4  PRIMARY KEY ,
    "Photo" BYTEA  NOT NULL ,
    "T�l�phone" VARCHAR(50)  NOT NULL ,
    "Civilit�" VARCHAR(15)  NOT NULL ,
    "DateNaissance" DATE  NOT NULL ,
    "Email" VARCHAR(50)  NOT NULL ,
    "Adresse" TEXT  NOT NULL ,
    "CompteActif" BOOL  NOT NULL  DEFAULT false,
    "DateRecrutement" DATE  NOT NULL );

-- Suppression de la table GPU_Utilisateur_Groupe
DROP TABLE "GPU_Utilisateur_Groupe" ;
-- Cr�ation de la table GPU_Utilisateur_Groupe
CREATE TABLE "GPU_Utilisateur_Groupe" (
    "IDGroupe" INTEGER  NOT NULL ,
    "IDUtilisateur" INTEGER  NOT NULL );
CREATE INDEX "WDIDX_GPU_Utilisateur_Groupe_IDGroupe" ON "GPU_Utilisateur_Groupe" ("IDGroupe");
CREATE INDEX "WDIDX_GPU_Utilisateur_Groupe_IDUtilisateur" ON "GPU_Utilisateur_Groupe" ("IDUtilisateur");
CREATE INDEX "WDIDX_GPU_Utilisateur_Groupe_IDUtilisateurGroupe" ON "GPU_Utilisateur_Groupe" ("IDUtilisateur","IDGroupe");

-- Suppression de la table GroupeProjets
DROP TABLE "GroupeProjets" ;
-- Cr�ation de la table GroupeProjets
CREATE TABLE "GroupeProjets" (
    "IDGroupeProjets" SERIAL8  PRIMARY KEY ,
    "NomGroupe" VARCHAR(50) );

-- Suppression de la table MaitresOuvrages
DROP TABLE "MaitresOuvrages" ;
-- Cr�ation de la table MaitresOuvrages
CREATE TABLE "MaitresOuvrages" (
    "IDEntit�sOrg" BIGINT  UNIQUE  DEFAULT 0,
    "IDProjet" INTEGER );
CREATE INDEX "WDIDX_MaitresOuvrages_IDProjet" ON "MaitresOuvrages" ("IDProjet");
CREATE INDEX "WDIDX_MaitresOuvrages_IDProjet_IDEntit�sOrg" ON "MaitresOuvrages" ("IDProjet","IDEntit�sOrg");

-- Suppression de la table ModePassation
DROP TABLE "ModePassation" ;
-- Cr�ation de la table ModePassation
CREATE TABLE "ModePassation" (
    "ModePassation" VARCHAR(50)  UNIQUE ,
    "IDModePassation" SERIAL4  PRIMARY KEY );

-- Suppression de la table Modules
DROP TABLE "Modules" ;
-- Cr�ation de la table Modules
CREATE TABLE "Modules" (
    "IDModules" SERIAL8  PRIMARY KEY ,
    "Nom" VARCHAR(50)  UNIQUE ,
    "IDModulesParent" BIGINT DEFAULT 0);
CREATE INDEX "WDIDX_Modules_IDModulesParent" ON "Modules" ("IDModulesParent");

-- Suppression de la table Organismes
DROP TABLE "Organismes" ;
-- Cr�ation de la table Organismes
CREATE TABLE "Organismes" (
    "IDOrganismes" SERIAL8  PRIMARY KEY ,
    "Pseudo" VARCHAR(50) ,
    "IDTypeOrg" BIGINT DEFAULT 0);
CREATE INDEX "WDIDX_Organismes_IDTypeOrg" ON "Organismes" ("IDTypeOrg");

-- Suppression de la table OS
DROP TABLE "OS" ;
-- Cr�ation de la table OS
CREATE TABLE "OS" (
    "IDOS" SERIAL8  PRIMARY KEY ,
    "NumOS" INTEGER DEFAULT 0,
    "RefRegistre" VARCHAR(25) ,
    "IDProjet" INTEGER ,
    "DateEffet" DATE ,
    "DateNotification" DATE ,
    "IDTypeOS" BIGINT DEFAULT 0,
    "MotifArret" VARCHAR(500) ,
    "D�cisions_Infos" TEXT ,
    "IdArchiveDocs" BIGINT );
CREATE INDEX "WDIDX_OS_IDProjet" ON "OS" ("IDProjet");
CREATE INDEX "WDIDX_OS_IDTypeOS" ON "OS" ("IDTypeOS");
CREATE INDEX "WDIDX_OS_IdArchiveDocs" ON "OS" ("IdArchiveDocs");

-- Suppression de la table OS_TabD�lais
DROP TABLE "OS_TabD�lais" ;
-- Cr�ation de la table OS_TabD�lais
CREATE TABLE "OS_TabD�lais" (
    "IDTabD�lais" BIGINT ,
    "IDOS" BIGINT ,
    "ID_D�lai_OS" SERIAL8  PRIMARY KEY ,
    "IDArchiveDocsOS" VARCHAR(50) );
CREATE INDEX "WDIDX_OS_TabD�lais_IDTabD�lais" ON "OS_TabD�lais" ("IDTabD�lais");
CREATE INDEX "WDIDX_OS_TabD�lais_IDOS" ON "OS_TabD�lais" ("IDOS");
CREATE INDEX "WDIDX_OS_TabD�lais_IDOSIDTabD�lais" ON "OS_TabD�lais" ("IDOS","IDTabD�lais");

-- Suppression de la table Ouvrages
DROP TABLE "Ouvrages" ;
-- Cr�ation de la table Ouvrages
CREATE TABLE "Ouvrages" (
    "IDOuvrages" SERIAL8  PRIMARY KEY ,
    "Nom" VARCHAR(50)  UNIQUE ,
    "ExNom" VARCHAR(50) ,
    "Emplacement" VARCHAR(50) ,
    "Coordonn�es" VARCHAR(50) );

-- Suppression de la table Priorit�
DROP TABLE "Priorit�" ;
-- Cr�ation de la table Priorit�
CREATE TABLE "Priorit�" (
    "IDPriorit�" SERIAL8  PRIMARY KEY ,
    "Priorit�" SMALLINT  UNIQUE  DEFAULT 0,
    "Image" BYTEA );

-- Suppression de la table Projet
DROP TABLE "Projet" ;
-- Cr�ation de la table Projet
CREATE TABLE "Projet" (
    "IDProjet" SERIAL4  PRIMARY KEY ,
    "numero" VARCHAR(30) ,
    "DateModification" DATE ,
    "ObjetP" VARCHAR(150)  UNIQUE ,
    "MontantEstMO" NUMERIC(14,2) DEFAULT 0,
    "IDTitulaireEntit�" BIGINT DEFAULT 0,
    "MontantDetailEst" NUMERIC(14,2) DEFAULT 0,
    "IDCreatedBy" INTEGER DEFAULT 0,
    "IDProjetdeControle" INTEGER DEFAULT 0,
    "D�laisExecution" INTEGER DEFAULT 0,
    "DateCreation" DATE ,
    "IDCharg�Aff" INTEGER DEFAULT 0,
    "IDEtat" INTEGER ,
    "IDOuvrages" BIGINT ,
    "IDType" INTEGER DEFAULT 0,
    "IDProjetParent" INTEGER ,
    "SAV_InteretsMoratoire" NUMERIC(13,2) DEFAULT 0,
    "SAV_RevisionPrix" NUMERIC(13,2) DEFAULT 0,
    "IDForme" INTEGER ,
    "IDCaract�re_Prix" INTEGER ,
    "IDModePassation" INTEGER ,
    "estMarch�" BOOL DEFAULT false,
    "ObjetMarch�" VARCHAR(250) ,
    "NumArtD�lais" VARCHAR(12) ,
    "IDGroupeProjets" BIGINT ,
    "IDEntit�sAdmin" BIGINT );
CREATE INDEX "WDIDX_Projet_numero" ON "Projet" ("numero");
CREATE INDEX "WDIDX_Projet_IDTitulaireEntit�" ON "Projet" ("IDTitulaireEntit�");
CREATE INDEX "WDIDX_Projet_IDCreatedBy" ON "Projet" ("IDCreatedBy");
CREATE INDEX "WDIDX_Projet_IDProjetdeControle" ON "Projet" ("IDProjetdeControle");
CREATE INDEX "WDIDX_Projet_IDCharg�Aff" ON "Projet" ("IDCharg�Aff");
CREATE INDEX "WDIDX_Projet_IDEtat" ON "Projet" ("IDEtat");
CREATE INDEX "WDIDX_Projet_IDOuvrages" ON "Projet" ("IDOuvrages");
CREATE INDEX "WDIDX_Projet_IDType" ON "Projet" ("IDType");
CREATE INDEX "WDIDX_Projet_IDProjetParent" ON "Projet" ("IDProjetParent");
CREATE INDEX "WDIDX_Projet_IDForme" ON "Projet" ("IDForme");
CREATE INDEX "WDIDX_Projet_IDCaract�re_Prix" ON "Projet" ("IDCaract�re_Prix");
CREATE INDEX "WDIDX_Projet_IDModePassation" ON "Projet" ("IDModePassation");
CREATE INDEX "WDIDX_Projet_IDGroupeProjets" ON "Projet" ("IDGroupeProjets");
CREATE INDEX "WDIDX_Projet_IDEntit�sAdmin" ON "Projet" ("IDEntit�sAdmin");

-- Suppression de la table ProjetR�ponse
DROP TABLE "ProjetR�ponse" ;
-- Cr�ation de la table ProjetR�ponse
CREATE TABLE "ProjetR�ponse" (
    "IDProjetR�p" SERIAL8  PRIMARY KEY ,
    "Document" BYTEA ,
    "IDCourriers" BIGINT );
CREATE INDEX "WDIDX_ProjetR�ponse_IDCourriers" ON "ProjetR�ponse" ("IDCourriers");

-- Suppression de la table RapportControle
DROP TABLE "RapportControle" ;
-- Cr�ation de la table RapportControle
CREATE TABLE "RapportControle" (
    "IDRapportControle" SERIAL8  PRIMARY KEY ,
    "DateMission" DATE ,
    "R�f" VARCHAR(20) ,
    "DateEdition" DATE ,
    "IdArchiveDocs" BIGINT DEFAULT 0,
    "IDProjetControl�" INTEGER DEFAULT 0,
    "IDProjetdeControle" INTEGER DEFAULT 0);
CREATE INDEX "WDIDX_RapportControle_IdArchiveDocs" ON "RapportControle" ("IdArchiveDocs");
CREATE INDEX "WDIDX_RapportControle_IDProjetControl�" ON "RapportControle" ("IDProjetControl�");
CREATE INDEX "WDIDX_RapportControle_IDProjetdeControle" ON "RapportControle" ("IDProjetdeControle");

-- Suppression de la table RapportsdesCourrier
DROP TABLE "RapportsdesCourrier" ;
-- Cr�ation de la table RapportsdesCourrier
CREATE TABLE "RapportsdesCourrier" (
    "IDRapport" SERIAL8  PRIMARY KEY ,
    "IDCourriers" BIGINT ,
    "IDArchiveDocs" BIGINT  UNIQUE ,
    "IDProjet" INTEGER );
CREATE INDEX "WDIDX_RapportsdesCourrier_IDCourriers" ON "RapportsdesCourrier" ("IDCourriers");
CREATE INDEX "WDIDX_RapportsdesCourrier_IDProjet" ON "RapportsdesCourrier" ("IDProjet");

-- Suppression de la table R�ception
DROP TABLE "R�ception" ;
-- Cr�ation de la table R�ception
CREATE TABLE "R�ception" (
    "IDReception" SERIAL8  PRIMARY KEY ,
    "NumAttach" INTEGER DEFAULT 0,
    "IDProjet" INTEGER DEFAULT 0,
    "MontantTravauxHT" NUMERIC(14,2) DEFAULT 0,
    "NumPV" INTEGER DEFAULT 0,
    "DatePV" DATE ,
    "DateSignatAttachement" DATE ,
    "MontantP�nalit�sHT" NUMERIC(14,2) DEFAULT 0,
    "IdArchiveDocs" BIGINT );
CREATE INDEX "WDIDX_R�ception_IDProjet" ON "R�ception" ("IDProjet");
CREATE INDEX "WDIDX_R�ception_IdArchiveDocs" ON "R�ception" ("IdArchiveDocs");

-- Suppression de la table TabD�lais
DROP TABLE "TabD�lais" ;
-- Cr�ation de la table TabD�lais
CREATE TABLE "TabD�lais" (
    "IDTabD�lais" SERIAL8  PRIMARY KEY ,
    "Indice" INTEGER DEFAULT 0,
    "D�signation" VARCHAR(200) ,
    "D�lai" INTEGER DEFAULT 0,
    "Unit�" VARCHAR(8) ,
    "IDProjet" INTEGER ,
    "NumD�lais" VARCHAR(50) ,
    "IDTabD�laisParent" BIGINT DEFAULT 0,
    "IDRecepCloture" BIGINT DEFAULT 0);
CREATE INDEX "WDIDX_TabD�lais_IDProjet" ON "TabD�lais" ("IDProjet");
CREATE INDEX "WDIDX_TabD�lais_IDTabD�laisParent" ON "TabD�lais" ("IDTabD�laisParent");
CREATE INDEX "WDIDX_TabD�lais_IDRecepCloture" ON "TabD�lais" ("IDRecepCloture");

-- Suppression de la table Tasks
DROP TABLE "Tasks" ;
-- Cr�ation de la table Tasks
CREATE TABLE "Tasks" (
    "IDTasks" SERIAL8  PRIMARY KEY ,
    "Task" VARCHAR(200) ,
    "DueDate" DATE ,
    "IDPriorit�" BIGINT ,
    "IDEtatTask" BIGINT ,
    "IDCourriers" BIGINT ,
    "IDLogin" INTEGER ,
    "IDProjet" INTEGER ,
    "Termin�e" BOOL DEFAULT false,
    "D�tail" VARCHAR(500) );
CREATE INDEX "WDIDX_Tasks_IDPriorit�" ON "Tasks" ("IDPriorit�");
CREATE INDEX "WDIDX_Tasks_IDEtatTask" ON "Tasks" ("IDEtatTask");
CREATE INDEX "WDIDX_Tasks_IDCourriers" ON "Tasks" ("IDCourriers");
CREATE INDEX "WDIDX_Tasks_IDLogin" ON "Tasks" ("IDLogin");
CREATE INDEX "WDIDX_Tasks_IDProjet" ON "Tasks" ("IDProjet");

-- Suppression de la table Titulaires
DROP TABLE "Titulaires" ;
-- Cr�ation de la table Titulaires
CREATE TABLE "Titulaires" (
    "IDProjet" INTEGER ,
    "IDEntit�sOrg" BIGINT );
CREATE INDEX "WDIDX_Titulaires_IDProjet" ON "Titulaires" ("IDProjet");
CREATE INDEX "WDIDX_Titulaires_IDEntit�sOrg" ON "Titulaires" ("IDEntit�sOrg");
CREATE INDEX "WDIDX_Titulaires_IDEntit�sDeVersionsOrganismes_IDProjet" ON "Titulaires" ("IDEntit�sOrg","IDProjet");

-- Suppression de la table TypeCourrier
DROP TABLE "TypeCourrier" ;
-- Cr�ation de la table TypeCourrier
CREATE TABLE "TypeCourrier" (
    "IDTypeCourrier" SERIAL8  PRIMARY KEY ,
    "Type" VARCHAR(50)  UNIQUE );

-- Suppression de la table typeDocArchive
DROP TABLE "typeDocArchive" ;
-- Cr�ation de la table typeDocArchive
CREATE TABLE "typeDocArchive" (
    "IDtypeDoc" SERIAL8  PRIMARY KEY ,
    "Type" VARCHAR(50) );
CREATE INDEX "WDIDX_typeDocArchive_Type" ON "typeDocArchive" ("Type");

-- Suppression de la table TypeOrganisme
DROP TABLE "TypeOrganisme" ;
-- Cr�ation de la table TypeOrganisme
CREATE TABLE "TypeOrganisme" (
    "IDTypeOrg" SERIAL8  PRIMARY KEY ,
    "Type" VARCHAR(50)  UNIQUE );

-- Suppression de la table TypeOS
DROP TABLE "TypeOS" ;
-- Cr�ation de la table TypeOS
CREATE TABLE "TypeOS" (
    "IDTypeOS" SERIAL8  PRIMARY KEY ,
    "Type" VARCHAR(50)  UNIQUE );

-- Suppression de la table TypeProjet
DROP TABLE "TypeProjet" ;
-- Cr�ation de la table TypeProjet
CREATE TABLE "TypeProjet" (
    "Type" VARCHAR(50)  NOT NULL  UNIQUE ,
    "IDType" SERIAL4  PRIMARY KEY );

-- Suppression de la table VersionsOrganismes
DROP TABLE "VersionsOrganismes" ;
-- Cr�ation de la table VersionsOrganismes
CREATE TABLE "VersionsOrganismes" (
    "IDVersionsOrg" SERIAL8  PRIMARY KEY ,
    "DateD�butVersion" DATE ,
    "IDOrganismes" BIGINT ,
    "DatefinVersion" DATE );
CREATE INDEX "WDIDX_VersionsOrganismes_DateD�butVersion" ON "VersionsOrganismes" ("DateD�butVersion");
CREATE INDEX "WDIDX_VersionsOrganismes_IDOrganismes" ON "VersionsOrganismes" ("IDOrganismes");
CREATE INDEX "WDIDX_VersionsOrganismes_DatefinVersion" ON "VersionsOrganismes" ("DatefinVersion");
-- Contraintes d'int�grit�
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDEtat") REFERENCES "EtatProjet" ("IDEtat");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDType") REFERENCES "TypeProjet" ("IDType");
ALTER TABLE "TabD�lais" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "BPDE" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "OS_TabD�lais" ADD FOREIGN KEY ("IDTabD�lais") REFERENCES "TabD�lais" ("IDTabD�lais");
ALTER TABLE "OS_TabD�lais" ADD FOREIGN KEY ("IDOS") REFERENCES "OS" ("IDOS");
ALTER TABLE "TabD�lais" ADD FOREIGN KEY ("IDTabD�laisParent") REFERENCES "TabD�lais" ("IDTabD�lais");
ALTER TABLE "OS" ADD FOREIGN KEY ("IDTypeOS") REFERENCES "TypeOS" ("IDTypeOS");
ALTER TABLE "ControlesdesPrix" ADD FOREIGN KEY ("IDBPDE") REFERENCES "BPDE" ("IDBPDE");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDtypeCourrier") REFERENCES "TypeCourrier" ("IDTypeCourrier");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDEtatCourrier") REFERENCES "EtatCourrier" ("IDEtatCourrier");
ALTER TABLE "RapportsdesCourrier" ADD FOREIGN KEY ("IDCourriers") REFERENCES "Courriers" ("IDCourriers");
ALTER TABLE "ControlesTechniques" ADD FOREIGN KEY ("IdArchiveDocs") REFERENCES "archivedocs" ("idArchiveDocs");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDCourriersParent") REFERENCES "Courriers" ("IDCourriers");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "RapportsdesCourrier" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "archivedocs" ADD FOREIGN KEY ("IDtypeDoc") REFERENCES "typeDocArchive" ("IDtypeDoc");
ALTER TABLE "RapportsdesCourrier" ADD FOREIGN KEY ("IDArchiveDocs") REFERENCES "archivedocs" ("idArchiveDocs");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDArchiveDocs") REFERENCES "archivedocs" ("idArchiveDocs");
ALTER TABLE "archivedocs" ADD FOREIGN KEY ("IDOuvrages") REFERENCES "Ouvrages" ("IDOuvrages");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDOuvrages") REFERENCES "Ouvrages" ("IDOuvrages");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDPriorit�") REFERENCES "Priorit�" ("IDPriorit�");
ALTER TABLE "DestinatairesProjetR�ponse" ADD FOREIGN KEY ("IDProjetR�p") REFERENCES "ProjetR�ponse" ("IDProjetR�p");
ALTER TABLE "DestinatairesProjetR�ponse" ADD FOREIGN KEY ("IDEntit�ExpDest") REFERENCES "Entit�sOrg" ("IDEntit�sOrg");
ALTER TABLE "D�tailAttachements" ADD FOREIGN KEY ("IDBPDE") REFERENCES "BPDE" ("IDBPDE");
ALTER TABLE "D�tailAttachements" ADD FOREIGN KEY ("IDReception") REFERENCES "R�ception" ("IDReception");
ALTER TABLE "BPDE" ADD FOREIGN KEY ("IDBPDEParent") REFERENCES "BPDE" ("IDBPDE");
ALTER TABLE "ControlesdesPrix" ADD FOREIGN KEY ("IDControle") REFERENCES "ControlesTechniques" ("IDControle");
ALTER TABLE "ControlesTechniques" ADD FOREIGN KEY ("IDControleParent") REFERENCES "ControlesTechniques" ("IDControle");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDProjetParent") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "BPDE" ADD FOREIGN KEY ("IDTabD�lais") REFERENCES "TabD�lais" ("IDTabD�lais");
ALTER TABLE "archivedocs" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "ControlesdesPrix_Rapports" ADD FOREIGN KEY ("IDPrix_IDControle") REFERENCES "ControlesdesPrix" ("IDBPDE","IDControle");
ALTER TABLE "ElementsdePrixValid�s" ADD FOREIGN KEY ("IDPrix_IDCont_IdRappCont") REFERENCES "ControlesdesPrix_Rapports" ("IDPrix_IDControle","IDRapportControle");
ALTER TABLE "MaitresOuvrages" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "ElementPrix" ADD FOREIGN KEY ("IDBPDE") REFERENCES "BPDE" ("IDBPDE");
ALTER TABLE "ElementsdePrixValid�s" ADD FOREIGN KEY ("IDElementPrix") REFERENCES "ElementPrix" ("IDElementPrix");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDCreatedBy") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDCharg�Aff") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "Tasks" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "Tasks" ADD FOREIGN KEY ("IDLogin") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "ControlesdesPrix_Rapports" ADD FOREIGN KEY ("IDRapportControle") REFERENCES "RapportControle" ("IDRapportControle");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDForme") REFERENCES "Forme March�" ("IDForme");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDModePassation") REFERENCES "ModePassation" ("IDModePassation");
ALTER TABLE "RapportControle" ADD FOREIGN KEY ("IdArchiveDocs") REFERENCES "archivedocs" ("idArchiveDocs");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDProjetdeControle") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "D�tailPvR�ception" ADD FOREIGN KEY ("IDReception") REFERENCES "R�ception" ("IDReception");
ALTER TABLE "D�tailPvR�ception" ADD FOREIGN KEY ("IDTabD�lais") REFERENCES "TabD�lais" ("IDTabD�lais");
ALTER TABLE "OS" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "R�ception" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "RapportControle" ADD FOREIGN KEY ("IDProjetControl�") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "RapportControle" ADD FOREIGN KEY ("IDProjetdeControle") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "archivedocs" ADD FOREIGN KEY ("IDAuteur") REFERENCES "Entit�sOrg" ("IDEntit�sOrg");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDCaract�re_Prix") REFERENCES "Caract�re Prix" ("IDCaract�re_Prix");
ALTER TABLE "TabD�lais" ADD FOREIGN KEY ("IDRecepCloture") REFERENCES "R�ception" ("IDReception");
ALTER TABLE "BPDE" ADD FOREIGN KEY ("IDRecepCloture") REFERENCES "R�ception" ("IDReception");
ALTER TABLE "OS" ADD FOREIGN KEY ("IdArchiveDocs") REFERENCES "archivedocs" ("idArchiveDocs");
ALTER TABLE "R�ception" ADD FOREIGN KEY ("IdArchiveDocs") REFERENCES "archivedocs" ("idArchiveDocs");
ALTER TABLE "ProjetR�ponse" ADD FOREIGN KEY ("IDCourriers") REFERENCES "Courriers" ("IDCourriers");
ALTER TABLE "Tasks" ADD FOREIGN KEY ("IDPriorit�") REFERENCES "Priorit�" ("IDPriorit�");
ALTER TABLE "Tasks" ADD FOREIGN KEY ("IDEtatTask") REFERENCES "EtatTask" ("IDEtatTask");
ALTER TABLE "Tasks" ADD FOREIGN KEY ("IDCourriers") REFERENCES "Courriers" ("IDCourriers");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDCharg�Aff") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDtypeDoc") REFERENCES "typeDocArchive" ("IDtypeDoc");
ALTER TABLE "Documents" ADD FOREIGN KEY ("IdArchiveDocs") REFERENCES "archivedocs" ("idArchiveDocs");
ALTER TABLE "Destinataire_Expediteur" ADD FOREIGN KEY ("IDCourriers") REFERENCES "Courriers" ("IDCourriers");
ALTER TABLE "AffectationPersonnel" ADD FOREIGN KEY ("IDEmploy�") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "Organismes" ADD FOREIGN KEY ("IDTypeOrg") REFERENCES "TypeOrganisme" ("IDTypeOrg");
ALTER TABLE "VersionsOrganismes" ADD FOREIGN KEY ("IDOrganismes") REFERENCES "Organismes" ("IDOrganismes");
ALTER TABLE "Entit�sOrg" ADD FOREIGN KEY ("IDEntit�sOrgParent") REFERENCES "Entit�sOrg" ("IDEntit�sOrg");
ALTER TABLE "Entit�sOrg" ADD FOREIGN KEY ("IDVersionsOrg") REFERENCES "VersionsOrganismes" ("IDVersionsOrg");
ALTER TABLE "EtatTask" ADD FOREIGN KEY ("Etat") REFERENCES "EtatProjet" ("Etat");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDGroupeProjets") REFERENCES "GroupeProjets" ("IDGroupeProjets");
ALTER TABLE "MaitresOuvrages" ADD FOREIGN KEY ("IDEntit�sOrg") REFERENCES "Entit�sOrg" ("IDEntit�sOrg");
ALTER TABLE "Titulaires" ADD FOREIGN KEY ("IDEntit�sOrg") REFERENCES "Entit�sOrg" ("IDEntit�sOrg");
ALTER TABLE "Titulaires" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDEntit�sAdmin") REFERENCES "Entit�sOrg" ("IDEntit�sOrg");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDCreatedBy") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "Destinataire_Expediteur" ADD FOREIGN KEY ("IDEntit�ExpDest") REFERENCES "Entit�sOrg" ("IDEntit�sOrg");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDEntit�sAdmin") REFERENCES "Entit�sOrg" ("IDEntit�sOrg");
ALTER TABLE "archivedocs" ADD FOREIGN KEY ("IDCreatedBy") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "TypeOS" ADD FOREIGN KEY ("Type") REFERENCES "TypeProjet" ("Type");
ALTER TABLE "TypeCourrier" ADD FOREIGN KEY ("Type") REFERENCES "TypeProjet" ("Type");
ALTER TABLE "typeDocArchive" ADD FOREIGN KEY ("Type") REFERENCES "TypeProjet" ("Type");
ALTER TABLE "TypeOrganisme" ADD FOREIGN KEY ("Type") REFERENCES "TypeProjet" ("Type");
ALTER TABLE "AffectationPersonnel" ADD FOREIGN KEY ("IDEntit�sOrg") REFERENCES "Entit�sOrg" ("IDEntit�sOrg");
ALTER TABLE "Modules" ADD FOREIGN KEY ("IDModulesParent") REFERENCES "Modules" ("IDModules");
ALTER TABLE "GPU_Utilisateur_Groupe" ADD FOREIGN KEY ("IDUtilisateur") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "GPU_Utilisateur_Groupe" ADD FOREIGN KEY ("IDGroupe") REFERENCES "GPU_Groupe" ("IDGroupe");
ALTER TABLE "GPU_Groupe" ADD FOREIGN KEY ("IDGroupeParent") REFERENCES "GPU_Groupe" ("IDGroupe");
ALTER TABLE "ConfigurationDroitsAcc�s" ADD FOREIGN KEY ("IDModules") REFERENCES "Modules" ("IDModules");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDTitulaireEntit�") REFERENCES "Entit�sOrg" ("IDEntit�sOrg");
