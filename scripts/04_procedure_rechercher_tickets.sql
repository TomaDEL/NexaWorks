-- =====================================================================
-- NexaWorks - Procédure stockée RechercherTickets
-- À exécuter après 03_tickets_nexaworks.sql.
--
-- Chaque paramètre est optionnel et NULL signifie « ne pas filtrer sur ce critère ».
-- Les mots-clés fonctionnent en logique OR : un ticket est retourné s'il contient au moins un des mots, cherché dans le champ Probleme.
-- Le filtre de période porte sur la date de création du ticket.
--
-- Exemple : EXEC RechercherTickets @Statut = 'EnCours', @NomProduit = 'Trader en Herbe';
-- =====================================================================
USE NexaWorksDb;
GO

CREATE OR ALTER PROCEDURE RechercherTickets
    @Statut         NVARCHAR(20)  = NULL,  -- 'EnCours' ou 'Resolu' ; NULL = pas de filtre sur le statut
    @NomProduit     NVARCHAR(100) = NULL,  -- nom du produit ; NULL = tous les produits
    @NumeroVersion  NVARCHAR(20)  = NULL,  -- numéro de version ; NULL = toutes les versions
    @DateDebut      DATE          = NULL,  -- début de la période recherchée ; NULL = pas de borne basse
    @DateFin        DATE          = NULL,  -- fin de la période recherchée ; NULL = pas de borne haute
    @MotsCles       NVARCHAR(MAX) = NULL   -- mots séparés par des virgules ; NULL = pas de filtre texte
AS
BEGIN
    SELECT
        t.Id,
        p.Nom                AS Produit,
        v.Numero             AS Version,
        os.Nom               AS SystemeExploitation,
        t.Probleme,
        t.DateCreation,
        t.DateResolution,
        t.Statut,
        t.Resolution
    FROM Ticket t
    JOIN VersionOS vos           ON t.VersionOSId = vos.Id
    JOIN Version v                ON vos.VersionId = v.Id
    JOIN Produit p                 ON v.ProduitId = p.Id
    JOIN SystemeExploitation os   ON vos.SystemeExploitationId = os.Id
    WHERE
        (@Statut IS NULL OR t.Statut = @Statut)
        AND (@NomProduit IS NULL OR p.Nom = @NomProduit)
        AND (@NumeroVersion IS NULL OR v.Numero = @NumeroVersion)
        AND (@DateDebut IS NULL OR t.DateCreation >= @DateDebut)
        AND (@DateFin IS NULL OR t.DateCreation <= @DateFin)
        AND (
            @MotsCles IS NULL
            OR EXISTS (
                SELECT 1
                FROM STRING_SPLIT(@MotsCles, ',') AS mot
                WHERE t.Probleme LIKE '%' + TRIM(mot.value) + '%'
            )
        )
    ORDER BY t.DateCreation DESC;
END
GO