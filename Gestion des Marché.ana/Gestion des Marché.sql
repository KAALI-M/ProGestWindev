-- Script généré par WINDEV le 23/04/2022 23:40:35
-- Tables de l'analyse Gestion des Marché.wda
-- pour PostgreSQL

-- Suppression de la table AffectationPersonnel
DROP TABLE "AffectationPersonnel" ;
-- Création de la table AffectationPersonnel
-- Le type "Combinaison" de la rubrique "TypePoste" n'est pas supporté.

-- Suppression de la table archivedocs
DROP TABLE "archivedocs" ;
-- Création de la table archivedocs
CREATE TABLE "archivedocs" (
    "idArchiveDocs" SERIAL8  PRIMARY KEY ,
    "Nom" VARCHAR(100)  UNIQUE ,
    "Taille" VARCHAR(45) ,
    "Document" BYTEA ,
    "IDtypeDoc" BIGINT ,
    "IDOuvrages" BIGINT ,
    "DateDocument" DATE ,
    "IDCreatedBy" INTEGER ,
    "AccésPublic" BOOL DEFAULT false,
    "Réf" VARCHAR(20) ,
    "IDProjet" INTEGER ,
    "IDAuteur" BIGINT DEFAULT 0);
CREATE INDEX "WDIDX_archivedocs_IDtypeDoc" ON "archivedocs" ("IDtypeDoc");
CREATE INDEX "WDIDX_archivedocs_IDOuvrages" ON "archivedocs" ("IDOuvrages");
CREATE INDEX "WDIDX_archivedocs_IDCreatedBy" ON "archivedocs" ("IDCreatedBy");
CREATE INDEX "WDIDX_archivedocs_IDProjet" ON "archivedocs" ("IDProjet");
CREATE INDEX "WDIDX_archivedocs_IDAuteur" ON "archivedocs" ("IDAuteur");

-- Suppression de la table BPDE
DROP TABLE "BPDE" ;
-- Création de la table BPDE
CREATE TABLE "BPDE" (
    "IDBPDE" SERIAL8  PRIMARY KEY ,
    "Indice" INTEGER DEFAULT 0,
    "NumPrix" NUMERIC(10,0) ,
    "Unité" VARCHAR(8) ,
    "Désignation" VARCHAR(200) ,
    "quantité" NUMERIC(8,2) DEFAULT 0,
    "PU_HT" NUMERIC(12,2) DEFAULT 0,
    "IDProjet" INTEGER ,
    "ModifQté" NUMERIC(8,2) DEFAULT 0,
    "IDBPDEParent" BIGINT DEFAULT 0,
    "Reserves" TEXT ,
    "Commentaires" TEXT ,
    "IDTabDélais" BIGINT ,
    "IDRecepCloture" BIGINT );
CREATE INDEX "WDIDX_BPDE_IDProjet" ON "BPDE" ("IDProjet");
CREATE INDEX "WDIDX_BPDE_IDBPDEParent" ON "BPDE" ("IDBPDEParent");
CREATE INDEX "WDIDX_BPDE_IDTabDélais" ON "BPDE" ("IDTabDélais");
CREATE INDEX "WDIDX_BPDE_IDRecepCloture" ON "BPDE" ("IDRecepCloture");

-- Suppression de la table CaractèrePrix
DROP TABLE "Caractère Prix" ;
-- Création de la table CaractèrePrix
CREATE TABLE "Caractère Prix" (
    "Caractère_Prix" VARCHAR(50)  UNIQUE ,
    "IDCaractère_Prix" SERIAL4  PRIMARY KEY );

-- Suppression de la table ConfigurationDroitsAccès
DROP TABLE "ConfigurationDroitsAccès" ;
-- Création de la table ConfigurationDroitsAccès
-- Le type "Combinaison" de la rubrique "Droits" n'est pas supporté.
-- Le type "Combinaison" de la rubrique "Filtres" n'est pas supporté.

-- Suppression de la table ControlesdesPrix
DROP TABLE "ControlesdesPrix" ;
-- Création de la table ControlesdesPrix
CREATE TABLE "ControlesdesPrix" (
    "IDControle" BIGINT  NOT NULL  DEFAULT 0,
    "IDBPDE" BIGINT );
CREATE INDEX "WDIDX_ControlesdesPrix_IDControle" ON "ControlesdesPrix" ("IDControle");
CREATE INDEX "WDIDX_ControlesdesPrix_IDBPDE" ON "ControlesdesPrix" ("IDBPDE");
CREATE INDEX "WDIDX_ControlesdesPrix_IDPrix_IDControle" ON "ControlesdesPrix" ("IDBPDE","IDControle");

-- Suppression de la table ControlesdesPrix_Rapports
DROP TABLE "ControlesdesPrix_Rapports" ;
-- Création de la table ControlesdesPrix_Rapports
CREATE TABLE "ControlesdesPrix_Rapports" (
    "IDPrix_IDControle" BYTEA ,
    "IDRapportControle" BIGINT );
CREATE INDEX "WDIDX_ControlesdesPrix_Rapports_IDPrix_IDControle" ON "ControlesdesPrix_Rapports" ("IDPrix_IDControle");
CREATE INDEX "WDIDX_ControlesdesPrix_Rapports_IDRapportControle" ON "ControlesdesPrix_Rapports" ("IDRapportControle");
CREATE INDEX "WDIDX_ControlesdesPrix_Rapports_IDPrix_IDCont_IdRappCont" ON "ControlesdesPrix_Rapports" ("IDPrix_IDControle","IDRapportControle");

-- Suppression de la table ControlesTechniques
DROP TABLE "ControlesTechniques" ;
-- Création de la table ControlesTechniques
CREATE TABLE "ControlesTechniques" (
    "IDControle" SERIAL8  PRIMARY KEY ,
    "Désignation" VARCHAR(50) ,
    "IdArchiveDocs" BIGINT DEFAULT 0,
    "IDControleParent" BIGINT DEFAULT 0,
    "Indice" INTEGER DEFAULT 0);
CREATE INDEX "WDIDX_ControlesTechniques_IdArchiveDocs" ON "ControlesTechniques" ("IdArchiveDocs");
CREATE INDEX "WDIDX_ControlesTechniques_IDControleParent" ON "ControlesTechniques" ("IDControleParent");

-- Suppression de la table Courriers
DROP TABLE "Courriers" ;
-- Création de la table Courriers
CREATE TABLE "Courriers" (
    "IDPriorité" BIGINT DEFAULT 0,
    "IDCourriers" SERIAL8  PRIMARY KEY ,
    "IDtypeCourrier" BIGINT DEFAULT 0,
    "ObjetCourrier" VARCHAR(200) ,
    "dateRéception" DATE ,
    "Datecourrier" DATE ,
    "IDEtatCourrier" BIGINT ,
    "IDCreatedBy" INTEGER DEFAULT 0,
    "IDCourriersParent" BIGINT DEFAULT 0,
    "IDProjet" INTEGER ,
    "IDArchiveDocs" BIGINT ,
    "Référence" VARCHAR(20) ,
    "DateEcheance" DATE ,
    "IDtypeDoc" BIGINT ,
    "IDEntitésAdmin" BIGINT DEFAULT 0,
    "IDChargéAff" INTEGER );
CREATE INDEX "WDIDX_Courriers_IDPriorité" ON "Courriers" ("IDPriorité");
CREATE INDEX "WDIDX_Courriers_IDtypeCourrier" ON "Courriers" ("IDtypeCourrier");
CREATE INDEX "WDIDX_Courriers_IDEtatCourrier" ON "Courriers" ("IDEtatCourrier");
CREATE INDEX "WDIDX_Courriers_IDCreatedBy" ON "Courriers" ("IDCreatedBy");
CREATE INDEX "WDIDX_Courriers_IDCourriersParent" ON "Courriers" ("IDCourriersParent");
CREATE INDEX "WDIDX_Courriers_IDProjet" ON "Courriers" ("IDProjet");
CREATE INDEX "WDIDX_Courriers_IDArchiveDocs" ON "Courriers" ("IDArchiveDocs");
CREATE INDEX "WDIDX_Courriers_Référence" ON "Courriers" ("Référence");
CREATE INDEX "WDIDX_Courriers_IDtypeDoc" ON "Courriers" ("IDtypeDoc");
CREATE INDEX "WDIDX_Courriers_IDEntitésAdmin" ON "Courriers" ("IDEntitésAdmin");
CREATE INDEX "WDIDX_Courriers_IDChargéAff" ON "Courriers" ("IDChargéAff");

-- Suppression de la table Destinataire_Expediteur
DROP TABLE "Destinataire_Expediteur" ;
-- Création de la table Destinataire_Expediteur
CREATE TABLE "Destinataire_Expediteur" (
    "IDCourriers" BIGINT ,
    "IDEntitéExpDest" BIGINT  NOT NULL  DEFAULT 0);
CREATE INDEX "WDIDX_Destinataire_Expediteur_IDCourriers" ON "Destinataire_Expediteur" ("IDCourriers");
CREATE INDEX "WDIDX_Destinataire_Expediteur_IDEntitéExpDest" ON "Destinataire_Expediteur" ("IDEntitéExpDest");
CREATE INDEX "WDIDX_Destinataire_Expediteur_IDEntitéExpDest_IDCourriers" ON "Destinataire_Expediteur" ("IDEntitéExpDest","IDCourriers");

-- Suppression de la table DestinatairesProjetRéponse
DROP TABLE "DestinatairesProjetRéponse" ;
-- Création de la table DestinatairesProjetRéponse
CREATE TABLE "DestinatairesProjetRéponse" (
    "IDProjetRép" BIGINT ,
    "IDEntitéExpDest" BIGINT  NOT NULL  DEFAULT 0);
CREATE INDEX "WDIDX_DestinatairesProjetRéponse_IDProjetRép" ON "DestinatairesProjetRéponse" ("IDProjetRép");
CREATE INDEX "WDIDX_DestinatairesProjetRéponse_IDEntitéExpDest" ON "DestinatairesProjetRéponse" ("IDEntitéExpDest");
CREATE INDEX "WDIDX_DestinatairesProjetRéponse_IDEntitéExpDest_IDProjetRép" ON "DestinatairesProjetRéponse" ("IDEntitéExpDest","IDProjetRép");

-- Suppression de la table DétailAttachements
DROP TABLE "DétailAttachements" ;
-- Création de la table DétailAttachements
CREATE TABLE "DétailAttachements" (
    "IDReception" BIGINT ,
    "IDBPDE" BIGINT ,
    "quantité" NUMERIC(8,2)  NOT NULL  DEFAULT 0);
CREATE INDEX "WDIDX_DétailAttachements_IDReception" ON "DétailAttachements" ("IDReception");
CREATE INDEX "WDIDX_DétailAttachements_IDBPDE" ON "DétailAttachements" ("IDBPDE");
CREATE INDEX "WDIDX_DétailAttachements_IDBPDE_IDReception" ON "DétailAttachements" ("IDBPDE","IDReception");

-- Suppression de la table DétailPvRéception
DROP TABLE "DétailPvRéception" ;
-- Création de la table DétailPvRéception
CREATE TABLE "DétailPvRéception" (
    "IDTabDélais" BIGINT ,
    "IDReception" BIGINT ,
    "Retard" INTEGER  NOT NULL  DEFAULT 0);
CREATE INDEX "WDIDX_DétailPvRéception_IDTabDélais" ON "DétailPvRéception" ("IDTabDélais");
CREATE INDEX "WDIDX_DétailPvRéception_IDReception" ON "DétailPvRéception" ("IDReception");
CREATE INDEX "WDIDX_DétailPvRéception_IDDélaisIDReception" ON "DétailPvRéception" ("IDTabDélais","IDReception");

-- Suppression de la table Documents
DROP TABLE "Documents" ;
-- Création de la table Documents
CREATE TABLE "Documents" (
    "IDDocument" SERIAL8  PRIMARY KEY ,
    "Document" BYTEA ,
    "IdArchiveDocs" BIGINT );
CREATE INDEX "WDIDX_Documents_IdArchiveDocs" ON "Documents" ("IdArchiveDocs");

-- Suppression de la table ElementPrix
DROP TABLE "ElementPrix" ;
-- Création de la table ElementPrix
CREATE TABLE "ElementPrix" (
    "IDElementPrix" SERIAL8  PRIMARY KEY ,
    "Element" VARCHAR(10) ,
    "Qté" NUMERIC(8,2) DEFAULT 0,
    "IDBPDE" BIGINT );
CREATE INDEX "WDIDX_ElementPrix_Element" ON "ElementPrix" ("Element");
CREATE INDEX "WDIDX_ElementPrix_IDBPDE" ON "ElementPrix" ("IDBPDE");
CREATE INDEX "WDIDX_ElementPrix_IDPrixIDElement" ON "ElementPrix" ("IDBPDE","Element");

-- Suppression de la table ElemPrixValdés
DROP TABLE "ElementsdePrixValidés" ;
-- Création de la table ElemPrixValdés
CREATE TABLE "ElementsdePrixValidés" (
    "IDPrix_IDCont_IdRappCont" BYTEA  NOT NULL ,
    "IDElementPrix" BIGINT );
CREATE INDEX "WDIDX_ElemPrixValdés_IDPrix_IDCont_IdRappCont" ON "ElementsdePrixValidés" ("IDPrix_IDCont_IdRappCont");
CREATE INDEX "WDIDX_ElemPrixValdés_IDElementPrix" ON "ElementsdePrixValidés" ("IDElementPrix");
CREATE INDEX "WDIDX_ElemPrixValdés_IDPrix_IDContr_IdRappCont_IDElemPrix" ON "ElementsdePrixValidés" ("IDPrix_IDCont_IdRappCont","IDElementPrix");

-- Suppression de la table EntitésOrg
DROP TABLE "EntitésOrg" ;
-- Création de la table EntitésOrg
CREATE TABLE "EntitésOrg" (
    "IDEntitésOrg" BIGINT  NOT NULL  UNIQUE  DEFAULT 0,
    "Intitulé" VARCHAR(100) ,
    "Adresse" TEXT ,
    "Ville" VARCHAR(70) ,
    "Pays" VARCHAR(200) ,
    "Téléphone" VARCHAR(20) ,
    "Fax" VARCHAR(20) ,
    "EntetePage" BYTEA ,
    "PiedPage" BYTEA ,
    "Abréviation" VARCHAR(50) ,
    "IDEntitésOrgParent" BIGINT DEFAULT 0,
    "IDVersionsOrg" BIGINT DEFAULT 0);
CREATE INDEX "WDIDX_EntitésOrg_Intitulé" ON "EntitésOrg" ("Intitulé");
CREATE INDEX "WDIDX_EntitésOrg_IDEntitésOrgParent" ON "EntitésOrg" ("IDEntitésOrgParent");
CREATE INDEX "WDIDX_EntitésOrg_IDVersionsOrg" ON "EntitésOrg" ("IDVersionsOrg");

-- Suppression de la table EtatCourrier
DROP TABLE "EtatCourrier" ;
-- Création de la table EtatCourrier
CREATE TABLE "EtatCourrier" (
    "IDEtatCourrier" SERIAL8  PRIMARY KEY ,
    "EtatCourrier" VARCHAR(50)  UNIQUE );

-- Suppression de la table EtatProjet
DROP TABLE "EtatProjet" ;
-- Création de la table EtatProjet
CREATE TABLE "EtatProjet" (
    "Etat" VARCHAR(50)  NOT NULL  UNIQUE ,
    "IDEtat" SERIAL4  PRIMARY KEY );

-- Suppression de la table EtatTask
DROP TABLE "EtatTask" ;
-- Création de la table EtatTask
CREATE TABLE "EtatTask" (
    "IDEtatTask" SERIAL8  PRIMARY KEY ,
    "Etat" VARCHAR(50)  UNIQUE );

-- Suppression de la table FormeMarché
DROP TABLE "Forme Marché" ;
-- Création de la table FormeMarché
CREATE TABLE "Forme Marché" (
    "Forme" VARCHAR(50)  UNIQUE ,
    "IDForme" SERIAL4  PRIMARY KEY );

-- Suppression de la table GPU_Groupe
DROP TABLE "GPU_Groupe" ;
-- Création de la table GPU_Groupe
CREATE TABLE "GPU_Groupe" (
    "IDGroupe" SERIAL4  PRIMARY KEY ,
    "Nom" VARCHAR(255) ,
    "IDGroupeParent" INTEGER );
CREATE INDEX "WDIDX_GPU_Groupe_Nom" ON "GPU_Groupe" ("Nom");
CREATE INDEX "WDIDX_GPU_Groupe_IDGroupeParent" ON "GPU_Groupe" ("IDGroupeParent");

-- Suppression de la table GPU_Utilisateur
DROP TABLE "GPU_Utilisateur" ;
-- Création de la table GPU_Utilisateur
CREATE TABLE "GPU_Utilisateur" (
    "Login" VARCHAR(255)  NOT NULL  UNIQUE ,
    "Nom" VARCHAR(255)  NOT NULL ,
    "Prenom" VARCHAR(255)  NOT NULL ,
    "MotPasse" VARCHAR(50)  NOT NULL ,
    "Superviseur" BOOL  NOT NULL  DEFAULT false,
    "MotPasseASaisir" BOOL  NOT NULL  DEFAULT true,
    "IDUtilisateur" SERIAL4  PRIMARY KEY ,
    "Photo" BYTEA  NOT NULL ,
    "Téléphone" VARCHAR(50)  NOT NULL ,
    "Civilité" VARCHAR(15)  NOT NULL ,
    "DateNaissance" DATE  NOT NULL ,
    "Email" VARCHAR(50)  NOT NULL ,
    "Adresse" TEXT  NOT NULL ,
    "CompteActif" BOOL  NOT NULL  DEFAULT false,
    "DateRecrutement" DATE  NOT NULL );

-- Suppression de la table GPU_Utilisateur_Groupe
DROP TABLE "GPU_Utilisateur_Groupe" ;
-- Création de la table GPU_Utilisateur_Groupe
CREATE TABLE "GPU_Utilisateur_Groupe" (
    "IDGroupe" INTEGER  NOT NULL ,
    "IDUtilisateur" INTEGER  NOT NULL );
CREATE INDEX "WDIDX_GPU_Utilisateur_Groupe_IDGroupe" ON "GPU_Utilisateur_Groupe" ("IDGroupe");
CREATE INDEX "WDIDX_GPU_Utilisateur_Groupe_IDUtilisateur" ON "GPU_Utilisateur_Groupe" ("IDUtilisateur");
CREATE INDEX "WDIDX_GPU_Utilisateur_Groupe_IDUtilisateurGroupe" ON "GPU_Utilisateur_Groupe" ("IDUtilisateur","IDGroupe");

-- Suppression de la table GroupeProjets
DROP TABLE "GroupeProjets" ;
-- Création de la table GroupeProjets
CREATE TABLE "GroupeProjets" (
    "IDGroupeProjets" SERIAL8  PRIMARY KEY ,
    "NomGroupe" VARCHAR(50) );

-- Suppression de la table MaitresOuvrages
DROP TABLE "MaitresOuvrages" ;
-- Création de la table MaitresOuvrages
CREATE TABLE "MaitresOuvrages" (
    "IDEntitésOrg" BIGINT  UNIQUE  DEFAULT 0,
    "IDProjet" INTEGER );
CREATE INDEX "WDIDX_MaitresOuvrages_IDProjet" ON "MaitresOuvrages" ("IDProjet");
CREATE INDEX "WDIDX_MaitresOuvrages_IDProjet_IDEntitésOrg" ON "MaitresOuvrages" ("IDProjet","IDEntitésOrg");

-- Suppression de la table ModePassation
DROP TABLE "ModePassation" ;
-- Création de la table ModePassation
CREATE TABLE "ModePassation" (
    "ModePassation" VARCHAR(50)  UNIQUE ,
    "IDModePassation" SERIAL4  PRIMARY KEY );

-- Suppression de la table Modules
DROP TABLE "Modules" ;
-- Création de la table Modules
CREATE TABLE "Modules" (
    "IDModules" SERIAL8  PRIMARY KEY ,
    "Nom" VARCHAR(50)  UNIQUE ,
    "IDModulesParent" BIGINT DEFAULT 0);
CREATE INDEX "WDIDX_Modules_IDModulesParent" ON "Modules" ("IDModulesParent");

-- Suppression de la table Organismes
DROP TABLE "Organismes" ;
-- Création de la table Organismes
CREATE TABLE "Organismes" (
    "IDOrganismes" SERIAL8  PRIMARY KEY ,
    "Pseudo" VARCHAR(50) ,
    "IDTypeOrg" BIGINT DEFAULT 0);
CREATE INDEX "WDIDX_Organismes_IDTypeOrg" ON "Organismes" ("IDTypeOrg");

-- Suppression de la table OS
DROP TABLE "OS" ;
-- Création de la table OS
CREATE TABLE "OS" (
    "IDOS" SERIAL8  PRIMARY KEY ,
    "NumOS" INTEGER DEFAULT 0,
    "RefRegistre" VARCHAR(25) ,
    "IDProjet" INTEGER ,
    "DateEffet" DATE ,
    "DateNotification" DATE ,
    "IDTypeOS" BIGINT DEFAULT 0,
    "MotifArret" VARCHAR(500) ,
    "Décisions_Infos" TEXT ,
    "IdArchiveDocs" BIGINT );
CREATE INDEX "WDIDX_OS_IDProjet" ON "OS" ("IDProjet");
CREATE INDEX "WDIDX_OS_IDTypeOS" ON "OS" ("IDTypeOS");
CREATE INDEX "WDIDX_OS_IdArchiveDocs" ON "OS" ("IdArchiveDocs");

-- Suppression de la table OS_TabDélais
DROP TABLE "OS_TabDélais" ;
-- Création de la table OS_TabDélais
CREATE TABLE "OS_TabDélais" (
    "IDTabDélais" BIGINT ,
    "IDOS" BIGINT ,
    "ID_Délai_OS" SERIAL8  PRIMARY KEY ,
    "IDArchiveDocsOS" VARCHAR(50) );
CREATE INDEX "WDIDX_OS_TabDélais_IDTabDélais" ON "OS_TabDélais" ("IDTabDélais");
CREATE INDEX "WDIDX_OS_TabDélais_IDOS" ON "OS_TabDélais" ("IDOS");
CREATE INDEX "WDIDX_OS_TabDélais_IDOSIDTabDélais" ON "OS_TabDélais" ("IDOS","IDTabDélais");

-- Suppression de la table Ouvrages
DROP TABLE "Ouvrages" ;
-- Création de la table Ouvrages
CREATE TABLE "Ouvrages" (
    "IDOuvrages" SERIAL8  PRIMARY KEY ,
    "Nom" VARCHAR(50)  UNIQUE ,
    "ExNom" VARCHAR(50) ,
    "Emplacement" VARCHAR(50) ,
    "Coordonnées" VARCHAR(50) );

-- Suppression de la table Priorité
DROP TABLE "Priorité" ;
-- Création de la table Priorité
CREATE TABLE "Priorité" (
    "IDPriorité" SERIAL8  PRIMARY KEY ,
    "Priorité" SMALLINT  UNIQUE  DEFAULT 0,
    "Image" BYTEA );

-- Suppression de la table Projet
DROP TABLE "Projet" ;
-- Création de la table Projet
CREATE TABLE "Projet" (
    "IDProjet" SERIAL4  PRIMARY KEY ,
    "numero" VARCHAR(30) ,
    "DateModification" DATE ,
    "ObjetP" VARCHAR(150)  UNIQUE ,
    "MontantEstMO" NUMERIC(14,2) DEFAULT 0,
    "IDTitulaireEntité" BIGINT DEFAULT 0,
    "MontantDetailEst" NUMERIC(14,2) DEFAULT 0,
    "IDCreatedBy" INTEGER DEFAULT 0,
    "IDProjetdeControle" INTEGER DEFAULT 0,
    "DélaisExecution" INTEGER DEFAULT 0,
    "DateCreation" DATE ,
    "IDChargéAff" INTEGER DEFAULT 0,
    "IDEtat" INTEGER ,
    "IDOuvrages" BIGINT ,
    "IDType" INTEGER DEFAULT 0,
    "IDProjetParent" INTEGER ,
    "SAV_InteretsMoratoire" NUMERIC(13,2) DEFAULT 0,
    "SAV_RevisionPrix" NUMERIC(13,2) DEFAULT 0,
    "IDForme" INTEGER ,
    "IDCaractère_Prix" INTEGER ,
    "IDModePassation" INTEGER ,
    "estMarché" BOOL DEFAULT false,
    "ObjetMarché" VARCHAR(250) ,
    "NumArtDélais" VARCHAR(12) ,
    "IDGroupeProjets" BIGINT ,
    "IDEntitésAdmin" BIGINT );
CREATE INDEX "WDIDX_Projet_numero" ON "Projet" ("numero");
CREATE INDEX "WDIDX_Projet_IDTitulaireEntité" ON "Projet" ("IDTitulaireEntité");
CREATE INDEX "WDIDX_Projet_IDCreatedBy" ON "Projet" ("IDCreatedBy");
CREATE INDEX "WDIDX_Projet_IDProjetdeControle" ON "Projet" ("IDProjetdeControle");
CREATE INDEX "WDIDX_Projet_IDChargéAff" ON "Projet" ("IDChargéAff");
CREATE INDEX "WDIDX_Projet_IDEtat" ON "Projet" ("IDEtat");
CREATE INDEX "WDIDX_Projet_IDOuvrages" ON "Projet" ("IDOuvrages");
CREATE INDEX "WDIDX_Projet_IDType" ON "Projet" ("IDType");
CREATE INDEX "WDIDX_Projet_IDProjetParent" ON "Projet" ("IDProjetParent");
CREATE INDEX "WDIDX_Projet_IDForme" ON "Projet" ("IDForme");
CREATE INDEX "WDIDX_Projet_IDCaractère_Prix" ON "Projet" ("IDCaractère_Prix");
CREATE INDEX "WDIDX_Projet_IDModePassation" ON "Projet" ("IDModePassation");
CREATE INDEX "WDIDX_Projet_IDGroupeProjets" ON "Projet" ("IDGroupeProjets");
CREATE INDEX "WDIDX_Projet_IDEntitésAdmin" ON "Projet" ("IDEntitésAdmin");

-- Suppression de la table ProjetRéponse
DROP TABLE "ProjetRéponse" ;
-- Création de la table ProjetRéponse
CREATE TABLE "ProjetRéponse" (
    "IDProjetRép" SERIAL8  PRIMARY KEY ,
    "Document" BYTEA ,
    "IDCourriers" BIGINT );
CREATE INDEX "WDIDX_ProjetRéponse_IDCourriers" ON "ProjetRéponse" ("IDCourriers");

-- Suppression de la table RapportControle
DROP TABLE "RapportControle" ;
-- Création de la table RapportControle
CREATE TABLE "RapportControle" (
    "IDRapportControle" SERIAL8  PRIMARY KEY ,
    "DateMission" DATE ,
    "Réf" VARCHAR(20) ,
    "DateEdition" DATE ,
    "IdArchiveDocs" BIGINT DEFAULT 0,
    "IDProjetControlé" INTEGER DEFAULT 0,
    "IDProjetdeControle" INTEGER DEFAULT 0);
CREATE INDEX "WDIDX_RapportControle_IdArchiveDocs" ON "RapportControle" ("IdArchiveDocs");
CREATE INDEX "WDIDX_RapportControle_IDProjetControlé" ON "RapportControle" ("IDProjetControlé");
CREATE INDEX "WDIDX_RapportControle_IDProjetdeControle" ON "RapportControle" ("IDProjetdeControle");

-- Suppression de la table RapportsdesCourrier
DROP TABLE "RapportsdesCourrier" ;
-- Création de la table RapportsdesCourrier
CREATE TABLE "RapportsdesCourrier" (
    "IDRapport" SERIAL8  PRIMARY KEY ,
    "IDCourriers" BIGINT ,
    "IDArchiveDocs" BIGINT  UNIQUE ,
    "IDProjet" INTEGER );
CREATE INDEX "WDIDX_RapportsdesCourrier_IDCourriers" ON "RapportsdesCourrier" ("IDCourriers");
CREATE INDEX "WDIDX_RapportsdesCourrier_IDProjet" ON "RapportsdesCourrier" ("IDProjet");

-- Suppression de la table Réception
DROP TABLE "Réception" ;
-- Création de la table Réception
CREATE TABLE "Réception" (
    "IDReception" SERIAL8  PRIMARY KEY ,
    "NumAttach" INTEGER DEFAULT 0,
    "IDProjet" INTEGER DEFAULT 0,
    "MontantTravauxHT" NUMERIC(14,2) DEFAULT 0,
    "NumPV" INTEGER DEFAULT 0,
    "DatePV" DATE ,
    "DateSignatAttachement" DATE ,
    "MontantPénalitésHT" NUMERIC(14,2) DEFAULT 0,
    "IdArchiveDocs" BIGINT );
CREATE INDEX "WDIDX_Réception_IDProjet" ON "Réception" ("IDProjet");
CREATE INDEX "WDIDX_Réception_IdArchiveDocs" ON "Réception" ("IdArchiveDocs");

-- Suppression de la table TabDélais
DROP TABLE "TabDélais" ;
-- Création de la table TabDélais
CREATE TABLE "TabDélais" (
    "IDTabDélais" SERIAL8  PRIMARY KEY ,
    "Indice" INTEGER DEFAULT 0,
    "Désignation" VARCHAR(200) ,
    "Délai" INTEGER DEFAULT 0,
    "Unité" VARCHAR(8) ,
    "IDProjet" INTEGER ,
    "NumDélais" VARCHAR(50) ,
    "IDTabDélaisParent" BIGINT DEFAULT 0,
    "IDRecepCloture" BIGINT DEFAULT 0);
CREATE INDEX "WDIDX_TabDélais_IDProjet" ON "TabDélais" ("IDProjet");
CREATE INDEX "WDIDX_TabDélais_IDTabDélaisParent" ON "TabDélais" ("IDTabDélaisParent");
CREATE INDEX "WDIDX_TabDélais_IDRecepCloture" ON "TabDélais" ("IDRecepCloture");

-- Suppression de la table Tasks
DROP TABLE "Tasks" ;
-- Création de la table Tasks
CREATE TABLE "Tasks" (
    "IDTasks" SERIAL8  PRIMARY KEY ,
    "Task" VARCHAR(200) ,
    "DueDate" DATE ,
    "IDPriorité" BIGINT ,
    "IDEtatTask" BIGINT ,
    "IDCourriers" BIGINT ,
    "IDLogin" INTEGER ,
    "IDProjet" INTEGER ,
    "Terminée" BOOL DEFAULT false,
    "Détail" VARCHAR(500) );
CREATE INDEX "WDIDX_Tasks_IDPriorité" ON "Tasks" ("IDPriorité");
CREATE INDEX "WDIDX_Tasks_IDEtatTask" ON "Tasks" ("IDEtatTask");
CREATE INDEX "WDIDX_Tasks_IDCourriers" ON "Tasks" ("IDCourriers");
CREATE INDEX "WDIDX_Tasks_IDLogin" ON "Tasks" ("IDLogin");
CREATE INDEX "WDIDX_Tasks_IDProjet" ON "Tasks" ("IDProjet");

-- Suppression de la table Titulaires
DROP TABLE "Titulaires" ;
-- Création de la table Titulaires
CREATE TABLE "Titulaires" (
    "IDProjet" INTEGER ,
    "IDEntitésOrg" BIGINT );
CREATE INDEX "WDIDX_Titulaires_IDProjet" ON "Titulaires" ("IDProjet");
CREATE INDEX "WDIDX_Titulaires_IDEntitésOrg" ON "Titulaires" ("IDEntitésOrg");
CREATE INDEX "WDIDX_Titulaires_IDEntitésDeVersionsOrganismes_IDProjet" ON "Titulaires" ("IDEntitésOrg","IDProjet");

-- Suppression de la table TypeCourrier
DROP TABLE "TypeCourrier" ;
-- Création de la table TypeCourrier
CREATE TABLE "TypeCourrier" (
    "IDTypeCourrier" SERIAL8  PRIMARY KEY ,
    "Type" VARCHAR(50)  UNIQUE );

-- Suppression de la table typeDocArchive
DROP TABLE "typeDocArchive" ;
-- Création de la table typeDocArchive
CREATE TABLE "typeDocArchive" (
    "IDtypeDoc" SERIAL8  PRIMARY KEY ,
    "Type" VARCHAR(50) );
CREATE INDEX "WDIDX_typeDocArchive_Type" ON "typeDocArchive" ("Type");

-- Suppression de la table TypeOrganisme
DROP TABLE "TypeOrganisme" ;
-- Création de la table TypeOrganisme
CREATE TABLE "TypeOrganisme" (
    "IDTypeOrg" SERIAL8  PRIMARY KEY ,
    "Type" VARCHAR(50)  UNIQUE );

-- Suppression de la table TypeOS
DROP TABLE "TypeOS" ;
-- Création de la table TypeOS
CREATE TABLE "TypeOS" (
    "IDTypeOS" SERIAL8  PRIMARY KEY ,
    "Type" VARCHAR(50)  UNIQUE );

-- Suppression de la table TypeProjet
DROP TABLE "TypeProjet" ;
-- Création de la table TypeProjet
CREATE TABLE "TypeProjet" (
    "Type" VARCHAR(50)  NOT NULL  UNIQUE ,
    "IDType" SERIAL4  PRIMARY KEY );

-- Suppression de la table VersionsOrganismes
DROP TABLE "VersionsOrganismes" ;
-- Création de la table VersionsOrganismes
CREATE TABLE "VersionsOrganismes" (
    "IDVersionsOrg" SERIAL8  PRIMARY KEY ,
    "DateDébutVersion" DATE ,
    "IDOrganismes" BIGINT ,
    "DatefinVersion" DATE );
CREATE INDEX "WDIDX_VersionsOrganismes_DateDébutVersion" ON "VersionsOrganismes" ("DateDébutVersion");
CREATE INDEX "WDIDX_VersionsOrganismes_IDOrganismes" ON "VersionsOrganismes" ("IDOrganismes");
CREATE INDEX "WDIDX_VersionsOrganismes_DatefinVersion" ON "VersionsOrganismes" ("DatefinVersion");
-- Contraintes d'intégrité
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDEtat") REFERENCES "EtatProjet" ("IDEtat");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDType") REFERENCES "TypeProjet" ("IDType");
ALTER TABLE "TabDélais" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "BPDE" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "OS_TabDélais" ADD FOREIGN KEY ("IDTabDélais") REFERENCES "TabDélais" ("IDTabDélais");
ALTER TABLE "OS_TabDélais" ADD FOREIGN KEY ("IDOS") REFERENCES "OS" ("IDOS");
ALTER TABLE "TabDélais" ADD FOREIGN KEY ("IDTabDélaisParent") REFERENCES "TabDélais" ("IDTabDélais");
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
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDPriorité") REFERENCES "Priorité" ("IDPriorité");
ALTER TABLE "DestinatairesProjetRéponse" ADD FOREIGN KEY ("IDProjetRép") REFERENCES "ProjetRéponse" ("IDProjetRép");
ALTER TABLE "DestinatairesProjetRéponse" ADD FOREIGN KEY ("IDEntitéExpDest") REFERENCES "EntitésOrg" ("IDEntitésOrg");
ALTER TABLE "DétailAttachements" ADD FOREIGN KEY ("IDBPDE") REFERENCES "BPDE" ("IDBPDE");
ALTER TABLE "DétailAttachements" ADD FOREIGN KEY ("IDReception") REFERENCES "Réception" ("IDReception");
ALTER TABLE "BPDE" ADD FOREIGN KEY ("IDBPDEParent") REFERENCES "BPDE" ("IDBPDE");
ALTER TABLE "ControlesdesPrix" ADD FOREIGN KEY ("IDControle") REFERENCES "ControlesTechniques" ("IDControle");
ALTER TABLE "ControlesTechniques" ADD FOREIGN KEY ("IDControleParent") REFERENCES "ControlesTechniques" ("IDControle");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDProjetParent") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "BPDE" ADD FOREIGN KEY ("IDTabDélais") REFERENCES "TabDélais" ("IDTabDélais");
ALTER TABLE "archivedocs" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "ControlesdesPrix_Rapports" ADD FOREIGN KEY ("IDPrix_IDControle") REFERENCES "ControlesdesPrix" ("IDBPDE","IDControle");
ALTER TABLE "ElementsdePrixValidés" ADD FOREIGN KEY ("IDPrix_IDCont_IdRappCont") REFERENCES "ControlesdesPrix_Rapports" ("IDPrix_IDControle","IDRapportControle");
ALTER TABLE "MaitresOuvrages" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "ElementPrix" ADD FOREIGN KEY ("IDBPDE") REFERENCES "BPDE" ("IDBPDE");
ALTER TABLE "ElementsdePrixValidés" ADD FOREIGN KEY ("IDElementPrix") REFERENCES "ElementPrix" ("IDElementPrix");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDCreatedBy") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDChargéAff") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "Tasks" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "Tasks" ADD FOREIGN KEY ("IDLogin") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "ControlesdesPrix_Rapports" ADD FOREIGN KEY ("IDRapportControle") REFERENCES "RapportControle" ("IDRapportControle");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDForme") REFERENCES "Forme Marché" ("IDForme");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDModePassation") REFERENCES "ModePassation" ("IDModePassation");
ALTER TABLE "RapportControle" ADD FOREIGN KEY ("IdArchiveDocs") REFERENCES "archivedocs" ("idArchiveDocs");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDProjetdeControle") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "DétailPvRéception" ADD FOREIGN KEY ("IDReception") REFERENCES "Réception" ("IDReception");
ALTER TABLE "DétailPvRéception" ADD FOREIGN KEY ("IDTabDélais") REFERENCES "TabDélais" ("IDTabDélais");
ALTER TABLE "OS" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "Réception" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "RapportControle" ADD FOREIGN KEY ("IDProjetControlé") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "RapportControle" ADD FOREIGN KEY ("IDProjetdeControle") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "archivedocs" ADD FOREIGN KEY ("IDAuteur") REFERENCES "EntitésOrg" ("IDEntitésOrg");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDCaractère_Prix") REFERENCES "Caractère Prix" ("IDCaractère_Prix");
ALTER TABLE "TabDélais" ADD FOREIGN KEY ("IDRecepCloture") REFERENCES "Réception" ("IDReception");
ALTER TABLE "BPDE" ADD FOREIGN KEY ("IDRecepCloture") REFERENCES "Réception" ("IDReception");
ALTER TABLE "OS" ADD FOREIGN KEY ("IdArchiveDocs") REFERENCES "archivedocs" ("idArchiveDocs");
ALTER TABLE "Réception" ADD FOREIGN KEY ("IdArchiveDocs") REFERENCES "archivedocs" ("idArchiveDocs");
ALTER TABLE "ProjetRéponse" ADD FOREIGN KEY ("IDCourriers") REFERENCES "Courriers" ("IDCourriers");
ALTER TABLE "Tasks" ADD FOREIGN KEY ("IDPriorité") REFERENCES "Priorité" ("IDPriorité");
ALTER TABLE "Tasks" ADD FOREIGN KEY ("IDEtatTask") REFERENCES "EtatTask" ("IDEtatTask");
ALTER TABLE "Tasks" ADD FOREIGN KEY ("IDCourriers") REFERENCES "Courriers" ("IDCourriers");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDChargéAff") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDtypeDoc") REFERENCES "typeDocArchive" ("IDtypeDoc");
ALTER TABLE "Documents" ADD FOREIGN KEY ("IdArchiveDocs") REFERENCES "archivedocs" ("idArchiveDocs");
ALTER TABLE "Destinataire_Expediteur" ADD FOREIGN KEY ("IDCourriers") REFERENCES "Courriers" ("IDCourriers");
ALTER TABLE "AffectationPersonnel" ADD FOREIGN KEY ("IDEmployé") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "Organismes" ADD FOREIGN KEY ("IDTypeOrg") REFERENCES "TypeOrganisme" ("IDTypeOrg");
ALTER TABLE "VersionsOrganismes" ADD FOREIGN KEY ("IDOrganismes") REFERENCES "Organismes" ("IDOrganismes");
ALTER TABLE "EntitésOrg" ADD FOREIGN KEY ("IDEntitésOrgParent") REFERENCES "EntitésOrg" ("IDEntitésOrg");
ALTER TABLE "EntitésOrg" ADD FOREIGN KEY ("IDVersionsOrg") REFERENCES "VersionsOrganismes" ("IDVersionsOrg");
ALTER TABLE "EtatTask" ADD FOREIGN KEY ("Etat") REFERENCES "EtatProjet" ("Etat");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDGroupeProjets") REFERENCES "GroupeProjets" ("IDGroupeProjets");
ALTER TABLE "MaitresOuvrages" ADD FOREIGN KEY ("IDEntitésOrg") REFERENCES "EntitésOrg" ("IDEntitésOrg");
ALTER TABLE "Titulaires" ADD FOREIGN KEY ("IDEntitésOrg") REFERENCES "EntitésOrg" ("IDEntitésOrg");
ALTER TABLE "Titulaires" ADD FOREIGN KEY ("IDProjet") REFERENCES "Projet" ("IDProjet");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDEntitésAdmin") REFERENCES "EntitésOrg" ("IDEntitésOrg");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDCreatedBy") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "Destinataire_Expediteur" ADD FOREIGN KEY ("IDEntitéExpDest") REFERENCES "EntitésOrg" ("IDEntitésOrg");
ALTER TABLE "Courriers" ADD FOREIGN KEY ("IDEntitésAdmin") REFERENCES "EntitésOrg" ("IDEntitésOrg");
ALTER TABLE "archivedocs" ADD FOREIGN KEY ("IDCreatedBy") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "TypeOS" ADD FOREIGN KEY ("Type") REFERENCES "TypeProjet" ("Type");
ALTER TABLE "TypeCourrier" ADD FOREIGN KEY ("Type") REFERENCES "TypeProjet" ("Type");
ALTER TABLE "typeDocArchive" ADD FOREIGN KEY ("Type") REFERENCES "TypeProjet" ("Type");
ALTER TABLE "TypeOrganisme" ADD FOREIGN KEY ("Type") REFERENCES "TypeProjet" ("Type");
ALTER TABLE "AffectationPersonnel" ADD FOREIGN KEY ("IDEntitésOrg") REFERENCES "EntitésOrg" ("IDEntitésOrg");
ALTER TABLE "Modules" ADD FOREIGN KEY ("IDModulesParent") REFERENCES "Modules" ("IDModules");
ALTER TABLE "GPU_Utilisateur_Groupe" ADD FOREIGN KEY ("IDUtilisateur") REFERENCES "GPU_Utilisateur" ("IDUtilisateur");
ALTER TABLE "GPU_Utilisateur_Groupe" ADD FOREIGN KEY ("IDGroupe") REFERENCES "GPU_Groupe" ("IDGroupe");
ALTER TABLE "GPU_Groupe" ADD FOREIGN KEY ("IDGroupeParent") REFERENCES "GPU_Groupe" ("IDGroupe");
ALTER TABLE "ConfigurationDroitsAccès" ADD FOREIGN KEY ("IDModules") REFERENCES "Modules" ("IDModules");
ALTER TABLE "Projet" ADD FOREIGN KEY ("IDTitulaireEntité") REFERENCES "EntitésOrg" ("IDEntitésOrg");
