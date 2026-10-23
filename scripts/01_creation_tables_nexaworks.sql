-- =====================================================================
-- NexaWorks - Création de la base de données et des tables
-- À exécuter en premier. Ordre des fichiers : 01 → 05.
--
-- ATTENTION : ce script SUPPRIME puis recrée la base NexaWorksDb si elle existe déjà. Les fichiers 02 à 04 la remplissent ensuite.
-- =====================================================================
USE master;
GO

IF DB_ID('NexaWorksDb') IS NOT NULL
BEGIN
    ALTER DATABASE NexaWorksDb SET SINGLE_USER WITH ROLLBACK IMMEDIATE;  -- ferme les connexions en cours
    DROP DATABASE NexaWorksDb;
END
GO

CREATE DATABASE NexaWorksDb;   -- fichiers placés dans le dossier par défaut
GO

USE NexaWorksDb;
GO

CREATE TABLE Produit
(
    Id   INT IDENTITY(1,1) PRIMARY KEY,
    Nom  NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE SystemeExploitation
(
    Id   INT IDENTITY(1,1) PRIMARY KEY,
    Nom  NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Version
(
    Id         INT IDENTITY(1,1) PRIMARY KEY,
    Numero     NVARCHAR(20) NOT NULL,
    ProduitId  INT NOT NULL,

    CONSTRAINT FK_Version_Produit
        FOREIGN KEY (ProduitId) REFERENCES Produit(Id)
);
GO

CREATE TABLE VersionOS
(
    Id                      INT IDENTITY(1,1) PRIMARY KEY,
    VersionId               INT NOT NULL,
    SystemeExploitationId   INT NOT NULL,

    CONSTRAINT FK_VersionOS_Version
        FOREIGN KEY (VersionId) REFERENCES Version(Id),

    CONSTRAINT FK_VersionOS_SystemeExploitation
        FOREIGN KEY (SystemeExploitationId) REFERENCES SystemeExploitation(Id),

    CONSTRAINT UQ_VersionOS_Combinaison                     -- Une même combinaison version + OS ne peut exister qu'une seule fois
        UNIQUE (VersionId, SystemeExploitationId)
);
GO

CREATE TABLE Ticket
(
    Id              INT IDENTITY(1,1) PRIMARY KEY,
    VersionOSId     INT NOT NULL,
    Probleme        NVARCHAR(MAX) NOT NULL,
    DateCreation    DATE NOT NULL,
    DateResolution  DATE NULL,
    Statut          NVARCHAR(20) NOT NULL,
    Resolution      NVARCHAR(MAX) NULL,

    CONSTRAINT FK_Ticket_VersionOS
        FOREIGN KEY (VersionOSId) REFERENCES VersionOS(Id),

    CONSTRAINT CK_Ticket_Statut                             -- Statut limité à deux valeurs
        CHECK (Statut IN ('EnCours', 'Resolu')),

    CONSTRAINT CK_Ticket_Coherence                          -- Un ticket résolu a une date et un texte de résolution, un ticket en cours n'en a pas
        CHECK (
            (Statut = 'Resolu' AND DateResolution IS NOT NULL AND Resolution IS NOT NULL)
            OR
            (Statut = 'EnCours' AND DateResolution IS NULL AND Resolution IS NULL)
        )
);
GO