-- =====================================================================
-- NexaWorks - Données de référence
-- Produits, systèmes d'exploitation, versions, et compatibilités
-- À exécuter après 01_creation_tables_nexaworks.sql.
-- =====================================================================
USE NexaWorksDb;
GO

INSERT INTO Produit (Nom) VALUES
('Trader en Herbe'),
('Maître des Investissements'),
('Planificateur d''Entraînement'),
('Planificateur d''Anxiété Sociale');
GO

INSERT INTO SystemeExploitation (Nom) VALUES
('Linux'), ('MacOS'), ('Windows'), ('Android'), ('iOS'), ('Windows Mobile');
GO

INSERT INTO Version (Numero, ProduitId) VALUES
('1.0', (SELECT Id FROM Produit WHERE Nom = 'Trader en Herbe')),
('1.1', (SELECT Id FROM Produit WHERE Nom = 'Trader en Herbe')),
('1.2', (SELECT Id FROM Produit WHERE Nom = 'Trader en Herbe')),
('1.3', (SELECT Id FROM Produit WHERE Nom = 'Trader en Herbe')),
('1.0', (SELECT Id FROM Produit WHERE Nom = 'Maître des Investissements')),
('2.0', (SELECT Id FROM Produit WHERE Nom = 'Maître des Investissements')),
('2.1', (SELECT Id FROM Produit WHERE Nom = 'Maître des Investissements')),
('1.0', (SELECT Id FROM Produit WHERE Nom = 'Planificateur d''Entraînement')),
('1.1', (SELECT Id FROM Produit WHERE Nom = 'Planificateur d''Entraînement')),
('2.0', (SELECT Id FROM Produit WHERE Nom = 'Planificateur d''Entraînement')),
('1.0', (SELECT Id FROM Produit WHERE Nom = 'Planificateur d''Anxiété Sociale')),
('1.1', (SELECT Id FROM Produit WHERE Nom = 'Planificateur d''Anxiété Sociale'));
GO

-- Trader en Herbe
INSERT INTO VersionOS (VersionId, SystemeExploitationId)
SELECT v.Id, os.Id FROM Version v
JOIN Produit p ON v.ProduitId = p.Id
JOIN SystemeExploitation os ON os.Nom IN ('Linux', 'Windows')
WHERE p.Nom = 'Trader en Herbe' AND v.Numero = '1.0';
GO

INSERT INTO VersionOS (VersionId, SystemeExploitationId)
SELECT v.Id, os.Id FROM Version v
JOIN Produit p ON v.ProduitId = p.Id
JOIN SystemeExploitation os ON os.Nom IN ('Linux', 'MacOS', 'Windows')
WHERE p.Nom = 'Trader en Herbe' AND v.Numero = '1.1';
GO

INSERT INTO VersionOS (VersionId, SystemeExploitationId)
SELECT v.Id, os.Id FROM Version v
JOIN Produit p ON v.ProduitId = p.Id
JOIN SystemeExploitation os ON os.Nom IN ('Linux', 'MacOS', 'Windows', 'Android', 'iOS', 'Windows Mobile')
WHERE p.Nom = 'Trader en Herbe' AND v.Numero = '1.2';
GO

INSERT INTO VersionOS (VersionId, SystemeExploitationId)
SELECT v.Id, os.Id FROM Version v
JOIN Produit p ON v.ProduitId = p.Id
JOIN SystemeExploitation os ON os.Nom IN ('MacOS', 'Windows', 'Android', 'iOS')
WHERE p.Nom = 'Trader en Herbe' AND v.Numero = '1.3';
GO

-- Maître des Investissements
INSERT INTO VersionOS (VersionId, SystemeExploitationId)
SELECT v.Id, os.Id FROM Version v
JOIN Produit p ON v.ProduitId = p.Id
JOIN SystemeExploitation os ON os.Nom IN ('MacOS', 'iOS')
WHERE p.Nom = 'Maître des Investissements' AND v.Numero = '1.0';
GO

INSERT INTO VersionOS (VersionId, SystemeExploitationId)
SELECT v.Id, os.Id FROM Version v
JOIN Produit p ON v.ProduitId = p.Id
JOIN SystemeExploitation os ON os.Nom IN ('MacOS', 'Android', 'iOS')
WHERE p.Nom = 'Maître des Investissements' AND v.Numero = '2.0';
GO

INSERT INTO VersionOS (VersionId, SystemeExploitationId)
SELECT v.Id, os.Id FROM Version v
JOIN Produit p ON v.ProduitId = p.Id
JOIN SystemeExploitation os ON os.Nom IN ('MacOS', 'Windows', 'Android', 'iOS')
WHERE p.Nom = 'Maître des Investissements' AND v.Numero = '2.1';
GO

-- Planificateur d'Entraînement
INSERT INTO VersionOS (VersionId, SystemeExploitationId)
SELECT v.Id, os.Id FROM Version v
JOIN Produit p ON v.ProduitId = p.Id
JOIN SystemeExploitation os ON os.Nom IN ('Linux', 'MacOS')
WHERE p.Nom = 'Planificateur d''Entraînement' AND v.Numero = '1.0';
GO

INSERT INTO VersionOS (VersionId, SystemeExploitationId)
SELECT v.Id, os.Id FROM Version v
JOIN Produit p ON v.ProduitId = p.Id
JOIN SystemeExploitation os ON os.Nom IN ('Linux', 'MacOS', 'Windows', 'Android', 'iOS', 'Windows Mobile')
WHERE p.Nom = 'Planificateur d''Entraînement' AND v.Numero = '1.1';
GO

INSERT INTO VersionOS (VersionId, SystemeExploitationId)
SELECT v.Id, os.Id FROM Version v
JOIN Produit p ON v.ProduitId = p.Id
JOIN SystemeExploitation os ON os.Nom IN ('MacOS', 'Windows', 'Android', 'iOS')
WHERE p.Nom = 'Planificateur d''Entraînement' AND v.Numero = '2.0';
GO

-- Planificateur d'Anxiété Sociale
INSERT INTO VersionOS (VersionId, SystemeExploitationId)
SELECT v.Id, os.Id FROM Version v
JOIN Produit p ON v.ProduitId = p.Id
JOIN SystemeExploitation os ON os.Nom IN ('MacOS', 'Windows', 'Android', 'iOS')
WHERE p.Nom = 'Planificateur d''Anxiété Sociale' AND v.Numero = '1.0';
GO

INSERT INTO VersionOS (VersionId, SystemeExploitationId)
SELECT v.Id, os.Id FROM Version v
JOIN Produit p ON v.ProduitId = p.Id
JOIN SystemeExploitation os ON os.Nom IN ('MacOS', 'Windows', 'Android', 'iOS')
WHERE p.Nom = 'Planificateur d''Anxiété Sociale' AND v.Numero = '1.1';
GO

-- Vérification : nombre de lignes attendu dans chaque table
SELECT 'Produit' AS [Table], COUNT(*) AS Lignes FROM Produit			   -- attendu : 4
UNION ALL SELECT 'SystemeExploitation', COUNT(*) FROM SystemeExploitation  -- attendu : 6
UNION ALL SELECT 'Version', COUNT(*) FROM Version                          -- attendu : 12
UNION ALL SELECT 'VersionOS', COUNT(*) FROM VersionOS;                     -- attendu : 44