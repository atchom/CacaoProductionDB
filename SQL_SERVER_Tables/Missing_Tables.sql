-- =====================================================
-- CRÉATION DES TABLES SQL SERVER - VERSION POSTGRES_CACAO
-- =====================================================

USE CacaoProductionDB;
GO

-- Schéma pour l'intégration
CREATE SCHEMA Integration;
GO

-- =====================================================
-- TABLE 1: StockFeves - Gestion des stocks de fèves
-- =====================================================
CREATE TABLE StockFeves (
    StockFevesID INT IDENTITY(1,1) PRIMARY KEY,
    RecolteID INT NOT NULL REFERENCES Recoltes(RecolteID),
    NumeroLot VARCHAR(30) NOT NULL UNIQUE,
    DateEntree DATE NOT NULL,
    QuantiteKG DECIMAL(10,2) NOT NULL,
    QualiteGrade CHAR(1) CHECK (QualiteGrade IN ('A', 'B', 'C')),
    Humidite DECIMAL(5,2),
    LieuStockage NVARCHAR(100),
    Statut NVARCHAR(20) DEFAULT 'En stock' CHECK (Statut IN ('En stock', 'Affecté', 'Exporté', 'Déclassé')),
    ExportID INT NULL REFERENCES Exportations(ExportID),
    DateSortie DATE NULL,
    DateCreation DATETIME DEFAULT GETDATE(),
    UtilisateurCreation NVARCHAR(100) DEFAULT SYSTEM_USER
);

CREATE INDEX IX_StockFeves_NumeroLot ON StockFeves(NumeroLot);
CREATE INDEX IX_StockFeves_ExportID ON StockFeves(ExportID);
GO

-- =====================================================
-- TABLE 2: UtilisationIntrants - Traçabilité intrants
-- =====================================================
CREATE TABLE UtilisationIntrants (
    UtilisationID INT IDENTITY(1,1) PRIMARY KEY,
    ProduitCode_PG VARCHAR(50) NOT NULL,
    ProduitNom_PG NVARCHAR(200),
    FournisseurID_PG INT,
    PlantationID INT NOT NULL REFERENCES Plantations(PlantationID),
    AgriculteurID INT NOT NULL REFERENCES Agriculteurs(AgriculteurID),
    DateApplication DATE NOT NULL,
    QuantiteUtilisee DECIMAL(10,2) NOT NULL,
    Unite VARCHAR(20) NOT NULL,
    TypeIntrant NVARCHAR(50) CHECK (TypeIntrant IN ('Engrais', 'Fongicide', 'Insecticide', 'Herbicide')),
    MouvementStockID_PG INT,
    RecommandationTechnicien NVARCHAR(500),
    DateCreation DATETIME DEFAULT GETDATE()
);

CREATE INDEX IX_UtilisationIntrants_ProduitCode_PG ON UtilisationIntrants(ProduitCode_PG);
CREATE INDEX IX_UtilisationIntrants_PlantationID ON UtilisationIntrants(PlantationID);
GO

-- =====================================================
-- TABLE 3: EmballageUtilise - Traçabilité conditionnement
-- =====================================================
CREATE TABLE EmballageUtilise (
    EmballageID INT IDENTITY(1,1) PRIMARY KEY,
    ProduitCode_PG VARCHAR(50) NOT NULL,
    RecolteID INT NOT NULL REFERENCES Recoltes(RecolteID),
    StockFevesID INT NULL REFERENCES StockFeves(StockFevesID),
    QuantiteUtilisee INT NOT NULL,
    TypeEmballage NVARCHAR(50) CHECK (TypeEmballage IN ('Sac jute', 'Big bag', 'Sac papier', 'Conteneur')),
    CapaciteUnitaire DECIMAL(8,2),
    PoidsTotalConditionne DECIMAL(10,2),
    DateConditionnement DATE NOT NULL,
    Responsable NVARCHAR(100),
    MouvementStockID_PG INT,
    DateCreation DATETIME DEFAULT GETDATE()
);
GO

-- =====================================================
-- TABLE 4: AffectationEquipement - Suivi du matériel
-- =====================================================
CREATE TABLE AffectationEquipement (
    AffectationID INT IDENTITY(1,1) PRIMARY KEY,
    EquipementID_PG INT NOT NULL,
    EquipementNom_PG NVARCHAR(200),
    PlantationID INT NOT NULL REFERENCES Plantations(PlantationID),
    AgriculteurID INT NOT NULL REFERENCES Agriculteurs(AgriculteurID),
    DateAffectation DATE NOT NULL,
    DateRetour DATE NULL,
    EtatEquipement NVARCHAR(50) CHECK (EtatEquipement IN ('Neuf', 'Bon', 'Usagé', 'En panne', 'Réparation')),
    ResponsableAffectation NVARCHAR(100),
    Observations NVARCHAR(500),
    DateCreation DATETIME DEFAULT GETDATE()
);

CREATE INDEX IX_AffectationEquipement_EquipementID_PG ON AffectationEquipement(EquipementID_PG);
CREATE INDEX IX_AffectationEquipement_PlantationID ON AffectationEquipement(PlantationID);
GO

-- =====================================================
-- TABLE 5: ControleQualite - Traçabilité laboratoire
-- =====================================================
CREATE TABLE ControleQualite (
    ControleID INT IDENTITY(1,1) PRIMARY KEY,
    StockFevesID INT NOT NULL REFERENCES StockFeves(StockFevesID),
    DateControle DATE NOT NULL,
    TechnicienLabo NVARCHAR(100),
    EquipementLaboID_PG INT,
    TauxFermentation DECIMAL(5,2),
    TauxHumidite DECIMAL(5,2),
    TauxDefaut DECIMAL(5,2),
    PoidsMoyenFeve DECIMAL(6,2),
    CertificationObtenue NVARCHAR(100),
    StatutControle NVARCHAR(20) CHECK (StatutControle IN ('Conforme', 'Non conforme', 'En attente')),
    DateValidation DATE,
    RapportControle VARCHAR(100),
    DateCreation DATETIME DEFAULT GETDATE()
);

CREATE INDEX IX_ControleQualite_StockFevesID ON ControleQualite(StockFevesID);
GO

-- =====================================================
-- TABLE 6: Integration.LogistiqueMapping - Mapping des produits
-- =====================================================
CREATE TABLE Integration.LogistiqueMapping (
    MappingID INT IDENTITY(1,1) PRIMARY KEY,
    ProduitCode VARCHAR(50) NOT NULL,
    ProduitNom NVARCHAR(200),
    FournisseurID_PG INT,
    Categorie NVARCHAR(50),
    DateIntegration DATETIME DEFAULT GETDATE()
);

CREATE INDEX IX_LogistiqueMapping_ProduitCode ON Integration.LogistiqueMapping(ProduitCode);
GO

-- =====================================================
-- TABLE 7: Integration.SynchronisationLog - Audit ETL
-- =====================================================
CREATE TABLE Integration.SynchronisationLog (
    SyncID INT IDENTITY(1,1) PRIMARY KEY,
    DateSynchronisation DATETIME DEFAULT GETDATE(),
    TableCible NVARCHAR(100),
    TypeOperation NVARCHAR(20),
    EnregistrementsImportes INT,
    Statut NVARCHAR(20),
    MessageErreur NVARCHAR(MAX)
);
GO
