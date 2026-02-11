USE CacaoProductionDB;
GO

-- =====================================================
-- CRÉATION DU SCHÉMA Integration S'IL N'EXISTE PAS
-- =====================================================
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Integration')
BEGIN
    EXEC('CREATE SCHEMA Integration');
END
GO

-- =====================================================
-- TABLE: Integration.LogistiqueMapping
-- Rôle: Mapping des références PostgreSQL vers SQL Server
-- =====================================================
CREATE TABLE Integration.LogistiqueMapping (
    MappingID INT IDENTITY(1,1) PRIMARY KEY,
    ProduitCode VARCHAR(50) NOT NULL,
    ProduitNom NVARCHAR(200) NOT NULL,
    FournisseurID_PG INT NULL, -- Référence vers PostgreSQL
    FournisseurNom_PG NVARCHAR(200) NULL,
    Categorie NVARCHAR(100) NULL,
    TypeProduit NVARCHAR(50) CHECK (TypeProduit IN ('Intrant', 'Emballage', 'Équipement', 'Laboratoire', 'Transport', 'Divers')),
    Unite VARCHAR(20) NULL,
    CoutUnitaire_PG DECIMAL(12,2) NULL,
    DateDerniereSync DATE DEFAULT GETDATE(),
    StatutIntegration VARCHAR(20) DEFAULT 'Actif' CHECK (StatutIntegration IN ('Actif', 'Inactif', 'À vérifier')),
    DateIntegration DATETIME DEFAULT GETDATE(),
    DateModification DATETIME DEFAULT GETDATE(),
    UtilisateurModification NVARCHAR(100) DEFAULT SYSTEM_USER
);

-- =====================================================
-- INDEX POUR OPTIMISATION DES JOINTS
-- =====================================================
CREATE INDEX IX_LogistiqueMapping_ProduitCode ON Integration.LogistiqueMapping(ProduitCode);
CREATE INDEX IX_LogistiqueMapping_FournisseurID_PG ON Integration.LogistiqueMapping(FournisseurID_PG);
CREATE INDEX IX_LogistiqueMapping_Categorie ON Integration.LogistiqueMapping(Categorie);
GO

-- =====================================================
-- TRIGGER POUR METTRE À JOUR DateModification
-- =====================================================
CREATE TRIGGER trg_LogistiqueMapping_UpdateDate
ON Integration.LogistiqueMapping
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Integration.LogistiqueMapping
    SET DateModification = GETDATE(),
        UtilisateurModification = SYSTEM_USER
    FROM Integration.LogistiqueMapping lm
    INNER JOIN inserted i ON lm.MappingID = i.MappingID;
END
GO