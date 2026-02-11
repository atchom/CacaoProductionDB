USE CacaoProductionDB;
GO

-- =====================================================
-- SYNCROHNISATION FINALE - CORRIGÉE ET OPTIMISÉE
-- =====================================================
BEGIN TRY
    BEGIN TRANSACTION;
    
    PRINT '🚀 Début de la synchronisation...';
    
    -- 1. NETTOYAGE : Supprimer les entrées obsolètes si nécessaire
    -- (Optionnel - décommente si besoin)
    -- DELETE FROM Integration.LogistiqueMapping WHERE StatutIntegration = 'Inactif';
    
    -- 2. SYNCHRONISATION - VERSION SIMPLIFIÉE SANS CONDITION BLOQUANTE
    MERGE INTO Integration.LogistiqueMapping AS target
    USING (
        SELECT 
            produit_code,
            produit_nom,
            fournisseur_id,
            fournisseur_nom,
            categorie,
            type_produit,
            unite,
            cout_unitaire
        FROM OPENQUERY(POSTGRES_LINKED_SERVER, '
            SELECT 
                i.produit_code,
                i.produit_nom,
                i.fournisseur_id,
                f.nom_fournisseur AS fournisseur_nom,
                c.nom_categorie AS categorie,
                CASE 
                    WHEN c.code_categorie ILIKE ''%INT%'' THEN ''Intrant''
                    WHEN c.code_categorie ILIKE ''%EMB%'' THEN ''Emballage''
                    WHEN c.code_categorie ILIKE ''%EQP%'' THEN ''Équipement''
                    WHEN c.code_categorie ILIKE ''%LAB%'' THEN ''Laboratoire''
                    WHEN c.code_categorie ILIKE ''%TRA%'' THEN ''Transport''
                    ELSE ''Divers''
                END AS type_produit,
                i.unite,
                i.cout_unitaire
            FROM inventaire_logistique i
            LEFT JOIN fournisseurs f ON i.fournisseur_id = f.fournisseur_id
            LEFT JOIN categories_materiel c ON i.categorie_id = c.categorie_id
            WHERE i.statut = ''disponible''
        ')) AS source (
            ProduitCode, ProduitNom, FournisseurID_PG, FournisseurNom_PG,
            Categorie, TypeProduit, Unite, CoutUnitaire_PG
        )
    ON (target.ProduitCode = source.ProduitCode)
    
    -- ✅ CORRECTION : Plus de condition restrictive !
    WHEN MATCHED THEN
        UPDATE SET 
            ProduitNom = source.ProduitNom,
            FournisseurID_PG = source.FournisseurID_PG,
            FournisseurNom_PG = source.FournisseurNom_PG,
            Categorie = source.Categorie,
            TypeProduit = source.TypeProduit,
            Unite = source.Unite,
            CoutUnitaire_PG = source.CoutUnitaire_PG,
            DateDerniereSync = GETDATE(),
            StatutIntegration = 'Actif',
            DateModification = GETDATE()
    
    WHEN NOT MATCHED THEN
        INSERT (
            ProduitCode, ProduitNom, FournisseurID_PG, FournisseurNom_PG,
            Categorie, TypeProduit, Unite, CoutUnitaire_PG,
            DateDerniereSync, StatutIntegration
        )
        VALUES (
            source.ProduitCode, source.ProduitNom, source.FournisseurID_PG, source.FournisseurNom_PG,
            source.Categorie, source.TypeProduit, source.Unite, source.CoutUnitaire_PG,
            GETDATE(), 'Actif'
        );
    
    DECLARE @RowCount INT = @@ROWCOUNT;
    
    -- 3. Compter les lignes actives
    DECLARE @ActifsCount INT;
    SELECT @ActifsCount = COUNT(*) 
    FROM Integration.LogistiqueMapping 
    WHERE StatutIntegration = 'Actif';
    
    -- 4. LOGGER LE RÉSULTAT
    INSERT INTO Integration.SynchronisationLog (
        DateSynchronisation,
        TableCible, 
        TypeOperation, 
        EnregistrementsImportes, 
        Statut, 
        MessageErreur
    )
    VALUES (
        GETDATE(),
        'Integration.LogistiqueMapping',
        'MERGE',
        @RowCount,
        CASE 
            WHEN @RowCount > 0 THEN '✅ Succès'
            ELSE '⚠️ Avertissement'
        END,
        CASE 
            WHEN @RowCount > 0 THEN CONCAT('Synchronisation réussie : ', @RowCount, ' lignes traitées')
            ELSE 'Aucune donnée synchronisée'
        END
    );
    
    COMMIT TRANSACTION;
    
    -- 5. RÉSULTAT FINAL
    SELECT 
        '✅ SYNCHRONISATION TERMINÉE AVEC SUCCÈS' AS Statut,
        @RowCount AS LignesMergees,
        @ActifsCount AS TotalActifs,
        (SELECT COUNT(*) FROM Integration.LogistiqueMapping) AS TotalGeneral,
        GETDATE() AS DateExecution;
    
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    
    DECLARE @ErrorMsg NVARCHAR(MAX) = ERROR_MESSAGE();
    
    INSERT INTO Integration.SynchronisationLog (
        DateSynchronisation,
        TableCible, 
        TypeOperation, 
        EnregistrementsImportes, 
        Statut, 
        MessageErreur
    )
    VALUES (
        GETDATE(),
        'Integration.LogistiqueMapping',
        'MERGE',
        0,
        '❌ Échec',
        CONCAT('ERREUR: ', @ErrorMsg)
    );
    
    SELECT 
        '❌ ERREUR' AS Statut,
        @ErrorMsg AS MessageErreur,
        GETDATE() AS DateExecution;
    
END CATCH;
GO

-- =====================================================
-- VÉRIFICATION FINALE
-- =====================================================
PRINT '📊 DERNIER LOG DE SYNCHRONISATION :';
SELECT TOP 1 * FROM Integration.SynchronisationLog ORDER BY DateSynchronisation DESC;

PRINT '📦 CONTENU DE LOGISTIQUE MAPPING :';
SELECT * FROM Integration.LogistiqueMapping;

PRINT '📋 RÉCAPITULATIF PAR TYPE DE PRODUIT :';
SELECT 
    TypeProduit,
    COUNT(*) AS Nombre,
    STRING_AGG(ProduitCode, ', ') AS Produits
FROM Integration.LogistiqueMapping
WHERE StatutIntegration = 'Actif'
GROUP BY TypeProduit
ORDER BY TypeProduit;
GO