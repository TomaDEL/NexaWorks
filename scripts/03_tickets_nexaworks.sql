-- =====================================================================
-- NexaWorks - 25 tickets d'exemple (résolus et en cours)
-- À exécuter après 02_donnees_nexaworks.sql.
-- =====================================================================
USE NexaWorksDb;
GO

-- Ticket 1
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le cours des actions affiché ne se met pas à jour automatiquement. L''utilisateur doit fermer et rouvrir l''application pour voir les nouvelles valeurs.', 
        '2023-02-03', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Trader en Herbe' AND v.Numero = '1.2' AND os.Nom = 'Windows';
GO

-- Ticket 2
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le clavier virtuel recouvre le champ de saisie du nombre d''actions à acheter, empêchant de voir ce qu''on tape.',
       '2023-09-02', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Trader en Herbe' AND v.Numero = '1.2' AND os.Nom = 'Windows Mobile';
GO

-- Ticket 3
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le pavé numérique ne s''affiche plus pour saisir le nombre d''actions.',
       '2024-01-12', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Trader en Herbe' AND v.Numero = '1.3' AND os.Nom = 'MacOS';
GO

-- Ticket 4
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le pavé numérique ne s''affiche plus pour saisir le nombre d''actions.',
       '2024-01-12', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Trader en Herbe' AND v.Numero = '1.3' AND os.Nom = 'Windows';
GO

-- Ticket 5
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le pavé numérique ne s''affiche plus pour saisir le nombre d''actions.',
       '2024-01-12', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Trader en Herbe' AND v.Numero = '1.3' AND os.Nom = 'iOS';
GO

-- Ticket 6
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'L''export du relevé de portefeuille au format PDF produit un fichier vide.',
       '2024-01-05', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Maître des Investissements' AND v.Numero = '1.0' AND os.Nom = 'iOS';
GO

-- Ticket 7
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'L''application se ferme brutalement lors de l''ajout d''un nouvel actif dans un portefeuille contenant déjà plus de 50 lignes.',
       '2024-03-22', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Maître des Investissements' AND v.Numero = '2.0' AND os.Nom = 'Android';
GO

-- Ticket 8
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le mode sombre n''affiche pas correctement les couleurs des indicateurs de gains/pertes (le rouge et le vert sont inversés).',
       '2024-05-03', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Maître des Investissements' AND v.Numero = '2.1' AND os.Nom = 'Windows';
GO

-- Ticket 9
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Impossible de supprimer un actif du portefeuille : le bouton de suppression reste grisé même après sélection.',
       '2024-06-17', '2024-06-25', 'Resolu', 'Un bug de gestion d''état de l''interface empêchait l''activation du bouton après la première sélection. Correctif appliqué dans le code de gestion des états.'
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Maître des Investissements' AND v.Numero = '2.1' AND os.Nom = 'MacOS';
GO

-- Ticket 10
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le taux de change affiché pour les actifs en devise étrangère n''est pas actualisé depuis plus de 24h.',
       '2024-03-25', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Maître des Investissements' AND v.Numero = '2.0' AND os.Nom = 'MacOS';
GO

-- Ticket 11
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le taux de change affiché pour les actifs en devise étrangère n''est pas actualisé depuis plus de 24h.',
       '2024-05-11', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Maître des Investissements' AND v.Numero = '2.1' AND os.Nom = 'MacOS';
GO

-- Ticket 12
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le calendrier d''entraînement affiche les séances du mois suivant au lieu du mois en cours.',
       '2023-01-12', '2023-01-20', 'Resolu', 'Erreur de calcul de date liée au fuseau horaire du système Linux utilisé pour les tests. Correction du calcul de la date courante.'
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Entraînement' AND v.Numero = '1.0' AND os.Nom = 'Linux';
GO

-- Ticket 13
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Les séances marquées comme terminées réapparaissent comme non complétées après redémarrage de l''application.',
       '2023-02-09', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Entraînement' AND v.Numero = '1.0' AND os.Nom = 'MacOS';
GO

-- Ticket 14
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le chronomètre de repos entre les séries ne s''arrête pas automatiquement à zéro et continue en négatif.',
       '2023-03-30', '2023-04-10', 'Resolu', 'Absence de condition d''arrêt dans la boucle du minuteur. Ajout d''un contrôle empêchant le compteur de descendre sous zéro.'
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Entraînement' AND v.Numero = '1.1' AND os.Nom = 'Windows Mobile';
GO

-- Ticket 15
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'La synchronisation avec l''Apple Watch envoie deux fois les mêmes données de fréquence cardiaque, faussant les statistiques.',
       '2023-05-15', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Entraînement' AND v.Numero = '1.1' AND os.Nom = 'iOS';
GO

-- Ticket 16
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'L''application se déconnecte automatiquement toutes les 15 minutes, obligeant à ressaisir le mot de passe.',
       '2023-05-20', '2023-05-25', 'Resolu', 'Le problème venait d''un délai d''expiration de session configuré à 15 minutes. Le délai a été corrigé afin de maintenir la session active plus longtemps. Une mise à jour de la configuration a été effectuée et des tests de connexion ont confirmé que la déconnexion automatique ne se produisait plus.'
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Entraînement' AND v.Numero = '1.1' AND os.Nom = 'Android';
GO

-- Ticket 17 
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le journal d''humeur quotidien perd les entrées saisies si l''utilisateur change d''onglet avant d''avoir cliqué sur "Enregistrer".',
       '2024-01-04', '2024-01-15', 'Resolu', 'Absence de sauvegarde automatique. Ajout d''une sauvegarde automatique à chaque changement de champ.'
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Anxiété Sociale' AND v.Numero = '1.0' AND os.Nom = 'MacOS';
GO

-- Ticket 18
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Les exercices de respiration guidée ne jouent plus le son d''accompagnement depuis la dernière mise à jour.',
       '2024-02-20', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Anxiété Sociale' AND v.Numero = '1.0' AND os.Nom = 'Windows';
GO

-- Ticket 19
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'L''application envoie des notifications de suivi d''exercice à des horaires aléatoires, y compris en pleine nuit.',
       '2024-03-11', '2024-04-02', 'Resolu', 'Erreur dans la gestion du fuseau horaire pour la planification des notifications locales. Correction pour utiliser systématiquement le fuseau horaire de l''appareil.'
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Anxiété Sociale' AND v.Numero = '1.0' AND os.Nom = 'iOS';
GO

-- Ticket 20
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le mode "exercice d''exposition progressive" ne sauvegarde pas la progression de l''utilisateur entre deux sessions.',
       '2024-05-06', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Anxiété Sociale' AND v.Numero = '1.1' AND os.Nom = 'iOS';
GO

-- Ticket 21
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le mode "exercice d''exposition progressive" ne sauvegarde pas la progression de l''utilisateur entre deux sessions.',
       '2024-05-06', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Anxiété Sociale' AND v.Numero = '1.1' AND os.Nom = 'Android';
GO

-- Ticket 22
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le module de suivi des progrès affiche un graphique vide pour les utilisateurs ayant plus de 6 mois d''historique.',
       '2024-07-30', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Anxiété Sociale' AND v.Numero = '1.1' AND os.Nom = 'Windows';
GO

-- Ticket 23
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'L''icône de l''application disparaît de l''écran d''accueil après une mise à jour automatique via le Play Store.',
       '2024-06-14', '2024-06-28', 'Resolu', 'Conflit de nom de package lors de la mise à jour automatique sur certains launchers Android personnalisés. Correction du manifeste de l''application.'
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Anxiété Sociale' AND v.Numero = '1.1' AND os.Nom = 'Android';
GO

-- Ticket 24
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'L''application se déconnecte automatiquement toutes les 15 minutes, obligeant à ressaisir le mot de passe.',
       '2023-05-20', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Anxiété Sociale' AND v.Numero = '1.0' AND os.Nom = 'Android';
GO

-- Ticket 25
INSERT INTO Ticket (VersionOSId, Probleme, DateCreation, DateResolution, Statut, Resolution)
SELECT vos.Id, 'Le module de suivi des progrès affiche un graphique vide pour les utilisateurs ayant plus de 6 mois d''historique.',
       '2024-07-30', NULL, 'EnCours', NULL
FROM VersionOS vos JOIN Version v ON vos.VersionId = v.Id JOIN Produit p ON v.ProduitId = p.Id JOIN SystemeExploitation os ON vos.SystemeExploitationId = os.Id
WHERE p.Nom = 'Planificateur d''Anxiété Sociale' AND v.Numero = '1.1' AND os.Nom = 'Windows';
GO

SELECT COUNT(*) AS NbTickets FROM Ticket;                       -- attendu : 25
SELECT Statut, COUNT(*) AS Nb FROM Ticket GROUP BY Statut;      -- attendu : EnCours 18, Resolu 7