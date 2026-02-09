-- 1. D'abord, trouver le nom de la contrainte UNIQUE
SELECT name 
FROM sys.key_constraints 
WHERE type = 'UQ' 
AND parent_object_id = OBJECT_ID('Plantations');

-- 2. Supprimer la contrainte temporairement
ALTER TABLE Plantations
DROP CONSTRAINT UQ__Plantati__271FA38B0DC61A50; -- Remplacez par le nom réel

-- Récréer la contrainte UNIQUE
ALTER TABLE Plantations
ADD CONSTRAINT UQ__Plantati__271FA38B0DC61A50 UNIQUE (CodePlantation);
--  pour Agriculteurs
SELECT name 
FROM sys.key_constraints 
WHERE type = 'UQ' 
AND parent_object_id = OBJECT_ID('Agriculteurs');

ALTER TABLE Agriculteurs
DROP CONSTRAINT UQ__Agricult__0FB9FB43D0CB4FF3;


-- Désactiver toutes les contraintes de la table
ALTER TABLE Recoltes NOCHECK CONSTRAINT ALL;
 
 -- Réactiver les contraintes
ALTER TABLE Recoltes CHECK CONSTRAINT ALL;

--  pour Agriculteurs
SELECT name 
FROM sys.key_constraints 
WHERE type = 'UQ' 
AND parent_object_id = OBJECT_ID('Exportations');


ALTER TABLE Exportations
DROP CONSTRAINT UQ__Exportat__DF3C4DFAD6A73333;


-- Désactiver toutes les contraintes de la table
ALTER TABLE Clients NOCHECK CONSTRAINT ALL;

-- Réactiver les contraintes
ALTER TABLE Clients  CHECK CONSTRAINT ALL;

-- Désactiver toutes les contraintes de la table
ALTER TABLE Cooperatives NOCHECK CONSTRAINT ALL;

-- Réactiver les contraintes
ALTER TABLE Cooperatives CHECK CONSTRAINT ALL;

-- Désactiver toutes les contraintes de la table
ALTER TABLE Parametres NOCHECK CONSTRAINT ALL;

--  pour Agriculteurs
SELECT name 
FROM sys.key_constraints 
WHERE type = 'UQ' 
AND parent_object_id = OBJECT_ID('Parametres');

ALTER TABLE Parametres
DROP CONSTRAINT UQ__Parametr__C3F92971DAAD402A;

 -- Vérifier les doublons
SELECT CodePlantation, COUNT(*) as Doublons
FROM Plantations
GROUP BY CodePlantation
HAVING COUNT(*) > 1
ORDER BY Doublons DESC;