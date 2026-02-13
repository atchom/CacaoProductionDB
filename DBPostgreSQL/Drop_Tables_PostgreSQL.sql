-- ============================================
-- SUPPRESSION DES TABLES - PostgreSQL
-- Ordre respectant les contraintes de clés étrangères
-- ============================================

-- 1. Supprimer les tables enfants d'abord (celles qui ont des clés étrangères)
DROP TABLE IF EXISTS mouvements_stock CASCADE;
DROP TABLE IF EXISTS maintenance_equipements CASCADE;
DROP TABLE IF EXISTS commandes_fournisseurs CASCADE;
DROP TABLE IF EXISTS inventaire_logistique CASCADE;

-- 2. Supprimer les tables parents ensuite
DROP TABLE IF EXISTS categories_materiel CASCADE;
DROP TABLE IF EXISTS fournisseurs CASCADE;

-- 3. Optionnel : Supprimer les séquences automatiquement créées
DROP SEQUENCE IF EXISTS fournisseurs_fournisseur_id_seq CASCADE;
DROP SEQUENCE IF EXISTS categories_materiel_categorie_id_seq CASCADE;
DROP SEQUENCE IF EXISTS inventaire_logistique_inventaire_id_seq CASCADE;
DROP SEQUENCE IF EXISTS mouvements_stock_mouvement_id_seq CASCADE;
DROP SEQUENCE IF EXISTS maintenance_equipements_maintenance_id_seq CASCADE;

-- 4. Vérification : Afficher les tables restantes (devrait être vide)
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_type = 'BASE TABLE';