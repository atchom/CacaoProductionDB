-- ETL_Postgres_CACAO_to_SQLServer --

-- =====================================================
-- ÉTAPE 1: Mise à jour de la table de mapping logistique
-- =====================================================
TRUNCATE TABLE Integration.LogistiqueMapping;
GO

INSERT INTO Integration.LogistiqueMapping (ProduitCode, ProduitNom, FournisseurID_PG, Categorie, DateIntegration)
SELECT 
    produit_code,
    produit_nom,
    fournisseur_id,
    categorie,
    GETDATE()
FROM OPENQUERY(POSTGRES_CACAO, '
    SELECT 
        i.produit_code, 
        i.produit_nom, 
        i.fournisseur_id,
        CASE 
            WHEN c.code_categorie LIKE ''%INT%'' THEN ''Intrant''
            WHEN c.code_categorie LIKE ''%AMB%'' THEN ''Emballage''
            WHEN c.code_categorie LIKE ''%EQP%'' THEN ''Équipement''
            WHEN c.code_categorie LIKE ''%LAB%'' THEN ''Laboratoire''
            WHEN c.code_categorie LIKE ''%TRA%'' THEN ''Transport''
            ELSE ''Divers''
        END AS categorie
    FROM inventaire_logistique i
    LEFT JOIN categories_materiel c ON i.categorie_id = c.categorie_id
    WHERE i.statut = ''disponible''
');
GO

-- =====================================================
-- ÉTAPE 2: Import des mouvements de stock (intrants)
-- =====================================================
-- Étape 1: Récupérer les données du serveur PostgreSQL
SELECT 
    mouvement_id,
    produit_code,
    date_mouvement,
    quantite,
    lieu_destination,
    produit_nom,
    unite,
    fournisseur_id
INTO #TempMouvements
FROM OPENQUERY(POSTGRES_CACAO, '
    SELECT 
        m.mouvement_id,
        m.produit_code,
        m.date_mouvement,
        m.quantite,
        m.lieu_destination,
        i.produit_nom,
        i.unite,
        i.fournisseur_id
    FROM mouvements_stock m
    JOIN inventaire_logistique i ON m.produit_code = i.produit_code
    WHERE m.type_mouvement = ''SORTIE''
    AND (m.motif LIKE ''%plantation%'' OR m.motif LIKE ''%distribution%'')
');

-- =====================================================
-- ÉTAPE 2: Import des mouvements de stock (intrants)
IF OBJECT_ID('tempdb..#TempMouvements') IS NOT NULL
    DROP TABLE #TempMouvements;

SELECT 
    mouvement_id,
    produit_code,
    date_mouvement,
    quantite,
    lieu_destination,
    produit_nom,
    unite,
    fournisseur_id,
    -- Calculer Village directement
    CASE 
        WHEN lieu_destination LIKE '%Muyuka%' THEN 'Muyuka'
        WHEN lieu_destination LIKE '%Buea%' THEN 'Buea'
        WHEN lieu_destination LIKE '%Tiko%' THEN 'Tiko'
        WHEN lieu_destination LIKE '%Kumba%' THEN 'Kumba'
        WHEN lieu_destination LIKE '%Limbe%' THEN 'Limbe'
        ELSE 'Muyuka'
    END AS Village
INTO #TempMouvements
FROM OPENQUERY(POSTGRES_CACAO, '
    SELECT 
        m.mouvement_id,
        m.produit_code,
        m.date_mouvement,
        m.quantite,
        m.lieu_destination,
        i.produit_nom,
        i.unite,
        i.fournisseur_id
    FROM mouvements_stock m
    JOIN inventaire_logistique i ON m.produit_code = i.produit_code
    WHERE m.type_mouvement = ''SORTIE''
    AND (m.motif LIKE ''%plantation%'' OR m.motif LIKE ''%distribution%'')
');

-- PLUS BESOIN d'UPDATE, Village est déjà calculé !
-- Étape 3: Insérer dans UtilisationIntrants
INSERT INTO UtilisationIntrants (
    ProduitCode_PG, ProduitNom_PG, FournisseurID_PG,
    PlantationID, AgriculteurID, DateApplication,
    QuantiteUtilisee, Unite, TypeIntrant, MouvementStockID_PG
)
SELECT 
    m.produit_code,
    m.produit_nom,
    m.fournisseur_id,
    p.PlantationID,
    a.AgriculteurID,
    CAST(m.date_mouvement AS DATE),
    m.quantite,
    m.unite,
    CASE 
        WHEN m.produit_nom LIKE '%Engrais%' THEN 'Engrais'
        WHEN m.produit_nom LIKE '%Fongicide%' THEN 'Fongicide'
        WHEN m.produit_nom LIKE '%Insecticide%' THEN 'Insecticide'
        ELSE 'Autre'
    END,
    m.mouvement_id
FROM #TempMouvements m
JOIN Plantations p ON p.Village = m.Village
JOIN Agriculteurs a ON a.Village = p.Village AND a.Statut = 'Actif'
WHERE NOT EXISTS (
    SELECT 1 FROM UtilisationIntrants u 
    WHERE u.MouvementStockID_PG = m.mouvement_id
);

-- Étape 4: Nettoyage
DROP TABLE #TempMouvements;
GO

INSERT INTO AffectationEquipement (
    EquipementID_PG, EquipementNom_PG,
    PlantationID, AgriculteurID, DateAffectation,
    EtatEquipement, ResponsableAffectation
)
SELECT 
    i.inventaire_id,
    i.produit_nom,
    p.PlantationID,
    a.AgriculteurID,
    DATEADD(day, -ABS(CHECKSUM(NEWID())) % 60, GETDATE()),
    CASE ABS(CHECKSUM(NEWID())) % 4 
        WHEN 0 THEN 'Neuf' 
        WHEN 1 THEN 'Bon' 
        WHEN 2 THEN 'Usagé' 
        WHEN 3 THEN 'Bon'
    END,
    i.responsable
FROM OPENQUERY(POSTGRES_CACAO, '
    SELECT i.inventaire_id, i.produit_nom, i.responsable
    FROM inventaire_logistique i
    JOIN categories_materiel c ON i.categorie_id = c.categorie_id
    WHERE (c.code_categorie LIKE ''%EQP%'' OR c.code_categorie LIKE ''%TRA%'')
    AND i.quantite_stock > 0
') i
CROSS APPLY (
    SELECT TOP 1 PlantationID, Village 
    FROM Plantations 
    WHERE Region IN ('Sud-Ouest', 'Centre', 'Sud', 'Littoral')
    ORDER BY NEWID()
) p
CROSS APPLY (
    SELECT TOP 1 AgriculteurID 
    FROM Agriculteurs 
    WHERE Village = p.Village AND Statut = 'Actif'
    ORDER BY NEWID()
) a;
GO
-- =====================================================
-- ÉTAPE 4: Journalisation
-- =====================================================
INSERT INTO Integration.SynchronisationLog (TableCible, TypeOperation, EnregistrementsImportes, Statut)
SELECT 'UtilisationIntrants', 'INSERT', COUNT(*), 'SUCCÈS'
FROM UtilisationIntrants
WHERE DateCreation >= DATEADD(minute, -5, GETDATE());

INSERT INTO Integration.SynchronisationLog (TableCible, TypeOperation, EnregistrementsImportes, Statut)
SELECT 'AffectationEquipement', 'INSERT', COUNT(*), 'SUCCÈS'
FROM AffectationEquipement
WHERE DateCreation >= DATEADD(minute, -5, GETDATE());
GO

-- =====================================================
-- ÉTAPE 5: Vérifications
-- =====================================================
SELECT 'UtilisationIntrants' AS TableName, COUNT(*) AS NbLignes FROM UtilisationIntrants
UNION ALL
SELECT 'AffectationEquipement', COUNT(*) FROM AffectationEquipement
UNION ALL
SELECT 'Integration.LogistiqueMapping', COUNT(*) FROM Integration.LogistiqueMapping;
GO
