-- =====================================================
-- SUPPRESSION DE TOUTES LES TABLES SQL SERVER
-- Ordre respectant les contraintes de clés étrangères
-- =====================================================

USE CacaoProductionDB;
GO

-- Désactiver les contraintes temporairement
EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
GO

-- 1. Supprimer les tables de mapping et logs d'abord
DROP TABLE IF EXISTS Integration.SynchronisationLog;
DROP TABLE IF EXISTS Integration.LogistiqueMapping;
DROP SCHEMA IF EXISTS Integration;
GO

-- 2. Supprimer les tables enfants (celles avec clés étrangères)
DROP TABLE IF EXISTS ControleQualite;
DROP TABLE IF EXISTS AffectationEquipement;
DROP TABLE IF EXISTS EmballageUtilise;
DROP TABLE IF EXISTS UtilisationIntrants;
DROP TABLE IF EXISTS StockFeves;
GO

-- 3. Réactiver les contraintes
EXEC sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
GO

-- 4. Vérification
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE'
AND TABLE_NAME IN ('StockFeves', 'UtilisationIntrants', 'EmballageUtilise', 
                   'AffectationEquipement', 'ControleQualite')
ORDER BY TABLE_NAME;
-- Résultat attendu : 0 ligne (tables supprimées)
GO
