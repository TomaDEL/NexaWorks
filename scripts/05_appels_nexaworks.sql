-- =====================================================================
-- NexaWorks - Les 20 appels de la procédure RechercherTickets
-- À exécuter après 04_procedure_rechercher_tickets.sql.
-- =====================================================================
USE NexaWorksDb;
GO

-- 1 Tous les problèmes en cours (tous produits)
EXEC RechercherTickets @Statut = 'EnCours';

-- 2 En cours, un produit (toutes versions)
EXEC RechercherTickets @Statut = 'EnCours', @NomProduit = 'Trader en Herbe';

-- 3 En cours, un produit, une version
EXEC RechercherTickets @Statut = 'EnCours', @NomProduit = 'Trader en Herbe', @NumeroVersion = '1.2';

-- 4 Une période, un produit (toutes versions)
EXEC RechercherTickets @NomProduit = 'Maître des Investissements',
    @DateDebut = '2024-01-01', @DateFin = '2024-06-01';

-- 5 Une période, un produit, une version
EXEC RechercherTickets @NomProduit = 'Planificateur d''Entraînement',
    @NumeroVersion = '1.1', @DateDebut = '2023-01-01', @DateFin = '2023-12-31';

-- 6 En cours, mots-clés (tous produits)
EXEC RechercherTickets @Statut = 'EnCours', @MotsCles = 'notifications,synchronisation';

-- 7 En cours, un produit, mots-clés (toutes versions)
EXEC RechercherTickets @Statut = 'EnCours', @NomProduit = 'Planificateur d''Anxiété Sociale',
    @MotsCles = 'exercice';

-- 8 En cours, un produit, une version, mots-clés
EXEC RechercherTickets @Statut = 'EnCours', @NomProduit = 'Trader en Herbe',
    @NumeroVersion = '1.2', @MotsCles = 'clavier, champ';

-- 9 Une période, un produit, mots-clés (toutes versions)
EXEC RechercherTickets @NomProduit = 'Maître des Investissements',
    @MotsCles = 'portefeuille,actif', @DateDebut = '2024-01-01', @DateFin = '2024-12-31';

-- 10 Une période, un produit, une version, mots-clés
EXEC RechercherTickets @NomProduit = 'Planificateur d''Entraînement',
    @NumeroVersion = '1.1', @MotsCles = 'synchronisation', @DateDebut = '2023-01-01', @DateFin = '2023-06-01';

-- 11 Tous les problèmes résolus (tous produits)
EXEC RechercherTickets @Statut = 'Resolu';

-- 12 Résolus, un produit (toutes versions)
EXEC RechercherTickets @Statut = 'Resolu', @NomProduit = 'Trader en Herbe';

-- 13 Résolus, un produit, une version
EXEC RechercherTickets @Statut = 'Resolu', @NomProduit = 'Planificateur d''Entraînement', @NumeroVersion = '1.1';

-- 14 Résolus, une période, un produit (toutes versions)
EXEC RechercherTickets @Statut = 'Resolu', @NomProduit = 'Maître des Investissements',
    @DateDebut = '2024-01-01', @DateFin = '2024-12-31';

-- 15 Résolus, une période, un produit, une version
EXEC RechercherTickets @Statut = 'Resolu', @NomProduit = 'Planificateur d''Entraînement',
    @NumeroVersion = '1.1', @DateDebut = '2023-01-01', @DateFin = '2023-05-01';

-- 16 Résolus, mots-clés (tous produits)
EXEC RechercherTickets @Statut = 'Resolu', @MotsCles = 'application';

-- 17 Résolus, un produit, mots-clés (toutes versions)
EXEC RechercherTickets @Statut = 'Resolu', @NomProduit = 'Planificateur d''Anxiété Sociale',
    @MotsCles = 'application';

-- 18 Résolus, un produit, une version, mots-clés
EXEC RechercherTickets @Statut = 'Resolu', @NomProduit = 'Planificateur d''Anxiété Sociale',
    @NumeroVersion = '1.0', @MotsCles = 'humeur';

-- 19 Résolus, période, un produit, mots-clés (toutes versions)
EXEC RechercherTickets @Statut = 'Resolu', @NomProduit = 'Maître des Investissements',
    @MotsCles = 'bouton', @DateDebut = '2024-01-01', @DateFin = '2024-12-31';

-- 20 Résolus, période, un produit, une version, mots-clés
EXEC RechercherTickets @Statut = 'Resolu', @NomProduit = 'Planificateur d''Entraînement',
    @NumeroVersion = '1.1', @MotsCles = 'chronomètre', @DateDebut = '2023-01-01', @DateFin = '2023-12-31';