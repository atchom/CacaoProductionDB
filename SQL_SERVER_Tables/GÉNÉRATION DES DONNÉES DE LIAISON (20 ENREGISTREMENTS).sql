-- =====================================================
-- DONNÉES: StockFeves (10 lots)
-- Lien avec Recoltes et Exportations
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

INSERT INTO StockFeves (RecolteID, NumeroLot, DateEntree, QuantiteKG, QualiteGrade, Humidite, LieuStockage, Statut, ExportID, DateSortie)
VALUES
(3, 'LOT-2024-M01', '2024-03-16', 298.5, 'A', 6.8, 'Entrepôt Douala A1', 'Exporté', 13, '2024-04-10'),  -- ExportID 13
(4, 'LOT-2024-M02', '2024-03-19', 235.0, 'A', 6.9, 'Entrepôt Douala A1', 'Exporté', 13, '2024-04-10'),  -- ExportID 13
(5, 'LOT-2024-M03', '2024-03-23', 198.7, 'B', 7.2, 'Entrepôt Douala B2', 'Exporté', 14, '2024-04-15'),  -- ExportID 14
(6, 'LOT-2024-M04', '2024-03-26', 448.5, 'A', 6.5, 'Entrepôt Douala A2', 'Exporté', 15, '2024-04-20'),  -- ExportID 15
(7, 'LOT-2024-M05', '2024-03-29', 124.3, 'C', 8.1, 'Entrepôt Douala C1', 'Déclassé', NULL, NULL),
(8, 'LOT-2024-M06', '2024-04-02', 547.8, 'A', 6.7, 'Entrepôt Douala A1', 'Affecté', 16, NULL),           -- ExportID 16
(9, 'LOT-2024-M07', '2024-04-04', 423.6, 'B', 7.0, 'Entrepôt Douala B1', 'Affecté', 17, NULL),           -- ExportID 17
(10, 'LOT-2024-M08', '2024-04-06', 473.5, 'A', 6.6, 'Entrepôt Douala A2', 'Affecté', 18, NULL),          -- ExportID 18
(11, 'LOT-2024-M09', '2024-04-09', 523.2, 'A', 6.4, 'Entrepôt Douala A1', 'En stock', NULL, NULL),
(12, 'LOT-2024-M10', '2024-04-19', 573.8, 'A', 6.5, 'Entrepôt Douala A1', 'En stock', NULL, NULL);

-- =====================================================
-- TABLE 2: UtilisationIntrants - Traçabilité intrants agricoles
-- Lien: inventaire_logistique (PG) → Plantations
-- =====================================================
CREATE TABLE UtilisationIntrants (
    UtilisationID INT IDENTITY(1,1) PRIMARY KEY,
    ProduitCode_PG VARCHAR(50) NOT NULL, -- Référence vers PostgreSQL
    ProduitNom_PG NVARCHAR(200),
    FournisseurID_PG INT, -- Référence vers fournisseurs PostgreSQL
    PlantationID INT NOT NULL REFERENCES Plantations(PlantationID),
    AgriculteurID INT NOT NULL REFERENCES Agriculteurs(AgriculteurID),
    DateApplication DATE NOT NULL,
    QuantiteUtilisee DECIMAL(10,2) NOT NULL,
    Unite VARCHAR(20) NOT NULL,
    TypeIntrant NVARCHAR(50) CHECK (TypeIntrant IN ('Engrais', 'Fongicide', 'Insecticide', 'Herbicide')),
    MouvementStockID_PG INT, -- Référence vers mouvement_stock PostgreSQL
    RecommandationTechnicien NVARCHAR(500),
    DateCreation DATETIME DEFAULT GETDATE()
);

CREATE INDEX IX_UtilisationIntrants_ProduitCode_PG ON UtilisationIntrants(ProduitCode_PG);
CREATE INDEX IX_UtilisationIntrants_PlantationID ON UtilisationIntrants(PlantationID);
GO


INSERT INTO UtilisationIntrants (
    ProduitCode_PG, ProduitNom_PG, FournisseurID_PG,
    PlantationID, AgriculteurID, DateApplication,
    QuantiteUtilisee, Unite, TypeIntrant, MouvementStockID_PG,
    RecommandationTechnicien
)
VALUES
('ENG-NPK-01', 'Engrais NPK 15-15-15', 2, 7, 1, '2024-02-15', 250.0, 'kg', 'Engrais', 2, 'Application en foyers, 50g/pied'),
('ENG-NPK-01', 'Engrais NPK 15-15-15', 2, 8, 2, '2024-02-16', 200.0, 'kg', 'Engrais', 2, 'Épandage manuel'),
('ENG-NPK-01', 'Engrais NPK 15-15-15', 2, 9, 4, '2024-02-18', 300.0, 'kg', 'Engrais', 2, 'Fertilisation de fond'),
('FONG-CU-01', 'Fongicide Cupravit', 2, 10, 5, '2024-02-20', 15.0, 'litre', 'Fongicide', 6, 'Traitement contre la pourriture brune'),
('FONG-CU-01', 'Fongicide Cupravit', 2, 11, 7, '2024-02-22', 20.0, 'litre', 'Fongicide', 6, 'Application préventive'),
('ENG-NPK-01', 'Engrais NPK 15-15-15', 2, 12, 8, '2024-02-25', 180.0, 'kg', 'Engrais', 2, 'Deuxième passage'),
('ENG-NPK-01', 'Engrais NPK 15-15-15', 2, 13, 9, '2024-02-28', 220.0, 'kg', 'Engrais', 2, 'Sol fertile, dose réduite'),
('FONG-CU-01', 'Fongicide Cupravit', 2, 14, 11, '2024-03-02', 12.0, 'litre', 'Fongicide', 6, 'Tachetures sur cabosses'),
('ENG-NPK-01', 'Engrais NPK 15-15-15', 2, 15, 13, '2024-03-05', 280.0, 'kg', 'Engrais', 2, 'Zone à fort potentiel'),
('FONG-CU-01', 'Fongicide Cupravit', 2, 16, 14, '2024-03-08', 18.0, 'litre', 'Fongicide', 6, 'Humidité élevée');
GO

-- =====================================================
-- TABLE 3: EmballageUtilise - Traçabilité conditionnement
-- Lien: inventaire_logistique (PG) → Recoltes
-- =====================================================
CREATE TABLE EmballageUtilise (
    EmballageID INT IDENTITY(1,1) PRIMARY KEY,
    ProduitCode_PG VARCHAR(50) NOT NULL,
    RecolteID INT NOT NULL REFERENCES Recoltes(RecolteID),
    StockFevesID INT NULL REFERENCES StockFeves(StockFevesID),
    QuantiteUtilisee INT NOT NULL, -- Nombre de sacs/big bags
    TypeEmballage NVARCHAR(50) CHECK (TypeEmballage IN ('Sac jute', 'Big bag', 'Sac papier', 'Conteneur')),
    CapaciteUnitaire DECIMAL(8,2), -- en kg
    PoidsTotalConditionne DECIMAL(10,2),
    DateConditionnement DATE NOT NULL,
    Responsable NVARCHAR(100),
    MouvementStockID_PG INT,
    DateCreation DATETIME DEFAULT GETDATE()
);
GO


INSERT INTO EmballageUtilise (
    ProduitCode_PG, RecolteID, StockFevesID,
    QuantiteUtilisee, TypeEmballage, CapaciteUnitaire,
    PoidsTotalConditionne, DateConditionnement, Responsable,
    MouvementStockID_PG
)
VALUES
-- RecolteID ajustés pour correspondre à votre séquence (3-49)
('SAC-J60-01', 3, 1, 5, 'Sac jute', 60.0, 298.5, '2024-03-16', 'Tchinda Paul', 3),
('SAC-J60-01', 4, 2, 4, 'Sac jute', 60.0, 235.0, '2024-03-19', 'Tchinda Paul', 3),
('SAC-J60-01', 5, 3, 4, 'Sac jute', 50.0, 198.7, '2024-03-23', 'Fotso Célestin', 8),
('SAC-J60-01', 6, 4, 8, 'Sac jute', 60.0, 448.5, '2024-03-26', 'Tchinda Paul', 3),
('SAC-J60-01', 7, 5, 3, 'Sac jute', 50.0, 124.3, '2024-03-29', 'Fotso Célestin', 8),
('BIG-15-01', 8, 6, 3, 'Big bag', 1500.0, 547.8, '2024-04-02', 'Fotso Célestin', 8),
('BIG-15-01', 9, 7, 3, 'Big bag', 1500.0, 423.6, '2024-04-04', 'Fotso Célestin', 8),
('SAC-J60-01', 10, 8, 8, 'Sac jute', 60.0, 473.5, '2024-04-06', 'Tchinda Paul', 3),
('SAC-J60-01', 11, 9, 9, 'Sac jute', 60.0, 523.2, '2024-04-09', 'Tchinda Paul', 3),
('BIG-15-01', 12, 10, 4, 'Big bag', 1500.0, 573.8, '2024-04-19', 'Fotso Célestin', 8);
GO

-- =====================================================
-- TABLE 4: AffectationEquipement - Suivi du matériel
-- Lien: inventaire_logistique (PG) → Plantations
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
-- TABLE 5: ControleQualite - Traçabilité laboratoire/certifications
-- Lien: maintenance_equipements (PG) + Exportations.Certificats
-- =====================================================
CREATE TABLE ControleQualite (
    ControleID INT IDENTITY(1,1) PRIMARY KEY,
    StockFevesID INT NOT NULL REFERENCES StockFeves(StockFevesID),
    DateControle DATE NOT NULL,
    TechnicienLabo NVARCHAR(100),
    EquipementLaboID_PG INT, -- Référence vers inventaire_logistique (équipement labo)
    TauxFermentation DECIMAL(5,2),
    TauxHumidite DECIMAL(5,2),
    TauxDefaut DECIMAL(5,2),
    PoidsMoyenFeve DECIMAL(6,2),
    CertificationObtenue NVARCHAR(100), -- 'BIO', 'Fairtrade', 'UTZ', 'Rainforest'
    StatutControle NVARCHAR(20) CHECK (StatutControle IN ('Conforme', 'Non conforme', 'En attente')),
    DateValidation DATE,
    RapportControle VARCHAR(100), -- Lien vers document
    DateCreation DATETIME DEFAULT GETDATE()
);

CREATE INDEX IX_ControleQualite_StockFevesID ON ControleQualite(StockFevesID);
GO


INSERT INTO ControleQualite (
    StockFevesID, DateControle, TechnicienLabo, EquipementLaboID_PG,
    TauxFermentation, TauxHumidite, TauxDefaut, PoidsMoyenFeve,
    CertificationObtenue, StatutControle, DateValidation
)
VALUES
(1, '2024-03-18', 'Dr. Abomo', 4, 82.5, 6.8, 1.2, 1.25, 'BIO, Fairtrade', 'Conforme', '2024-03-20'),
(2, '2024-03-20', 'Dr. Abomo', 4, 79.8, 6.9, 1.5, 1.22, 'BIO', 'Conforme', '2024-03-22'),
(3, '2024-03-25', 'Dr. Abomo', 9, 71.2, 7.2, 2.8, 1.08, NULL, 'Non conforme', '2024-03-27'),
(4, '2024-03-28', 'Dr. Abomo', 4, 85.1, 6.5, 0.9, 1.31, 'BIO, UTZ', 'Conforme', '2024-03-30'),
(5, '2024-03-31', 'Dr. Abomo', 9, 62.3, 8.1, 4.2, 0.95, NULL, 'Non conforme', '2024-04-02'),
(6, '2024-04-04', 'Dr. Abomo', 4, 81.7, 6.7, 1.1, 1.28, 'BIO, Fairtrade', 'Conforme', '2024-04-06'),
(7, '2024-04-06', 'Dr. Abomo', 4, 78.4, 7.0, 1.8, 1.18, 'Fairtrade', 'Conforme', '2024-04-08'),
(8, '2024-04-08', 'Dr. Abomo', 9, 83.2, 6.6, 1.0, 1.29, 'BIO, UTZ', 'Conforme', '2024-04-10'),
(9, '2024-04-11', 'Dr. Abomo', 4, 80.5, 6.4, 1.3, 1.26, 'BIO', 'Conforme', '2024-04-13'),
(10, '2024-04-21', 'Dr. Abomo', 4, 82.9, 6.5, 1.1, 1.30, 'BIO, Fairtrade', 'Conforme', '2024-04-23');
GO

-- =====================================================
-- TABLE 6: Integration.SynchronisationLog - Audit ETL
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