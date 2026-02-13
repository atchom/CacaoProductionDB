-- =====================================================
-- 1. TABLES STAGING POUR POSTGRESQL (Module Logistique)
-- =====================================================

-- 1.1 Staging.Fournisseurs_PG
CREATE TABLE Staging_Fournisseurs_PG (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    fournisseur_id INT,
    nom_fournisseur NVARCHAR(200),
    type_fournisseur NVARCHAR(50),
    contact NVARCHAR(100),
    telephone NVARCHAR(20),
    email NVARCHAR(100),
    adresse NVARCHAR(MAX),
    pays NVARCHAR(100),
    statut NVARCHAR(20),
    note_credit DECIMAL(12,2),
    delai_livraison_moyen INT,
    DateExtraction DATETIME DEFAULT GETDATE(),
    SourceSystem VARCHAR(50) DEFAULT 'PostgreSQL'
);

-- 1.2 Staging.CategoriesMateriel_PG
CREATE TABLE Staging_CategoriesMateriel_PG (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    categorie_id INT,
    code_categorie VARCHAR(20),
    nom_categorie NVARCHAR(100),
    description NVARCHAR(MAX),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 1.3 Staging.CommandesFournisseurs_PG
CREATE TABLE Staging_CommandesFournisseurs_PG (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    commande_id VARCHAR(20),
    date_commande DATE,
    fournisseur_id INT,
    materiel NVARCHAR(200),
    categorie_id INT,
    quantite DECIMAL(10,2),
    unite VARCHAR(20),
    prix_unitaire DECIMAL(12,2),
    devise VARCHAR(10),
    total DECIMAL(12,2),
    mode_livraison VARCHAR(50),
    date_livraison_prevue DATE,
    date_livraison_reelle DATE,
    statut VARCHAR(30),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 1.4 Staging.InventaireLogistique_PG (TOUTES les colonnes)
CREATE TABLE Staging_InventaireLogistique_PG (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    inventaire_id INT,
    produit_code VARCHAR(50),
    produit_nom NVARCHAR(200),
    categorie_id INT,
    fournisseur_id INT,
    quantite_stock DECIMAL(10,2),
    unite VARCHAR(20),
    seuil_min DECIMAL(10,2),
    seuil_max DECIMAL(10,2),
    cout_unitaire DECIMAL(12,2),
    valeur_stock DECIMAL(12,2),
    lieu_stockage NVARCHAR(100),
    specifications NVARCHAR(MAX), -- JSONB converti en NVARCHAR
    date_acquisition DATE,
    valeur_achat DECIMAL(12,2),
    duree_amortissement_ans INT,
    methode_amortissement VARCHAR(20),
    valeur_residuelle DECIMAL(12,2),
    date_derniere_entree DATE,
    date_derniere_sortie DATE,
    responsable NVARCHAR(100),
    statut VARCHAR(20),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 1.5 Staging.MouvementsStock_PG
CREATE TABLE Staging_MouvementsStock_PG (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    mouvement_id INT,
    commande_id VARCHAR(20),
    produit_code VARCHAR(50),
    type_mouvement VARCHAR(20),
    quantite DECIMAL(10,2),
    date_mouvement DATETIME,
    motif NVARCHAR(200),
    utilisateur NVARCHAR(100),
    reference_document VARCHAR(50),
    lieu_origine NVARCHAR(100),
    lieu_destination NVARCHAR(100),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 1.6 Staging.MaintenanceEquipements_PG
CREATE TABLE Staging_MaintenanceEquipements_PG (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    maintenance_id INT,
    equipement_id INT,
    type_maintenance VARCHAR(30),
    date_maintenance DATE,
    cout_maintenance DECIMAL(10,2),
    description_travaux NVARCHAR(MAX),
    technicien NVARCHAR(100),
    prochaine_maintenance DATE,
    statut VARCHAR(20),
    priorite VARCHAR(10),
    pieces_remplacees NVARCHAR(MAX),
    duree_intervention_heures DECIMAL(5,2),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- =====================================================
-- 2. TABLES STAGING POUR SQL SERVER (Cœur Métier)
-- =====================================================

-- 2.1 Staging.Plantations_SS (TOUTES les colonnes)
CREATE TABLE Staging_Plantations_SS (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    PlantationID INT,
    CodePlantation VARCHAR(20),
    NomPlantation NVARCHAR(100),
    Village NVARCHAR(100),
    Departement NVARCHAR(100),
    Region NVARCHAR(50),
    CooperativeID INT,
    Superficie DECIMAL(8,2),
    AnneePlantation INT,
    NbArbres INT,
    Variete NVARCHAR(50),
    GPS_Latitude DECIMAL(10,6),
    GPS_Longitude DECIMAL(10,6),
    Statut NVARCHAR(20),
    DateCreation DATETIME,
    DateMaj DATETIME,
    DateExtraction DATETIME DEFAULT GETDATE()
);
CREATE TABLE Staging_Agriculteurs_SS (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    AgriculteurID INT,
    Matricule VARCHAR(20),
    Nom NVARCHAR(50),
    Prenom NVARCHAR(50),
    DateNaissance DATE,
    Genre CHAR(1),
    Telephone VARCHAR(20),
    Email VARCHAR(100),
    Adresse NVARCHAR(200),
    Village NVARCHAR(100),
    CooperativeID INT,
    AnneeAdhesion INT,
    TypeMembre NVARCHAR(30),
    Statut NVARCHAR(20),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 2.3 Staging.Recoltes_SS
CREATE TABLE Staging_Recoltes_SS (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    RecolteID INT,
    PlantationID INT,
    AgriculteurID INT,
    DateRecolte DATE,
    Saison NVARCHAR(20),
    PoidsCabosses DECIMAL(8,2),
    PoidsFevesFraiches DECIMAL(8,2),
    TauxExtraction DECIMAL(5,2),
    PrixAchatKG DECIMAL(8,2),
    MontantTotal DECIMAL(12,2),
    ModePaiement NVARCHAR(30),
    StatutPaiement NVARCHAR(20),
    Observations NVARCHAR(500),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 2.4 Staging.Exportations_SS
CREATE TABLE Staging_Exportations_SS (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    ExportID INT,
    NumeroContrat VARCHAR(50),
    ClientID INT,
    DateContrat DATE,
    DateLivraison DATE,
    QuantiteTonnes DECIMAL(10,3),
    PrixTonneUSD DECIMAL(12,2),
    MontantTotal DECIMAL(12,2),
    Incoterm NVARCHAR(20),
    PortDestination NVARCHAR(100),
    Certificats NVARCHAR(500),
    Statut NVARCHAR(30),
    NumeroConnaissement VARCHAR(50),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 2.5 Staging.Clients_SS
CREATE TABLE Staging_Clients_SS (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT,
    TypeClient NVARCHAR(30),
    NomSociete NVARCHAR(200),
    Pays NVARCHAR(100),
    Contact NVARCHAR(100),
    Email VARCHAR(100),
    Telephone VARCHAR(30),
    Adresse NVARCHAR(300),
    Categorie NVARCHAR(50),
    DatePremierAchat DATE,
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 2.6 Staging.Cooperatives_SS
CREATE TABLE Staging_Cooperatives_SS (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    CooperativeID INT,
    NomCooperative NVARCHAR(200),
    Region NVARCHAR(50),
    DateCreation DATE,
    President NVARCHAR(100),
    Telephone VARCHAR(20),
    Certifications NVARCHAR(500),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 2.7 Staging.StockFeves_SS (de Missing_Tables.sql)
CREATE TABLE Staging_StockFeves_SS (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    StockFevesID INT,
    RecolteID INT,
    NumeroLot VARCHAR(30),
    DateEntree DATE,
    QuantiteKG DECIMAL(10,2),
    QualiteGrade CHAR(1),
    Humidite DECIMAL(5,2),
    LieuStockage NVARCHAR(100),
    Statut NVARCHAR(20),
    ExportID INT,
    DateSortie DATE,
    DateCreation DATETIME,
    UtilisateurCreation NVARCHAR(100),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 2.8 Staging.UtilisationIntrants_SS
CREATE TABLE Staging_UtilisationIntrants_SS (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    UtilisationID INT,
    ProduitCode_PG VARCHAR(50),
    ProduitNom_PG NVARCHAR(200),
    FournisseurID_PG INT,
    PlantationID INT,
    AgriculteurID INT,
    DateApplication DATE,
    QuantiteUtilisee DECIMAL(10,2),
    Unite VARCHAR(20),
    TypeIntrant NVARCHAR(50),
    MouvementStockID_PG INT,
    RecommandationTechnicien NVARCHAR(500),
    DateCreation DATETIME,
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 2.9 Staging.AffectationEquipement_SS
CREATE TABLE Staging_AffectationEquipement_SS (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    AffectationID INT,
    EquipementID_PG INT,
    EquipementNom_PG NVARCHAR(200),
    PlantationID INT,
    AgriculteurID INT,
    DateAffectation DATE,
    DateRetour DATE,
    EtatEquipement NVARCHAR(50),
    ResponsableAffectation NVARCHAR(100),
    Observations NVARCHAR(500),
    DateCreation DATETIME,
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 2.10 Staging.ControleQualite_SS
CREATE TABLE Staging_ControleQualite_SS (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    ControleID INT,
    StockFevesID INT,
    DateControle DATE,
    TechnicienLabo NVARCHAR(100),
    EquipementLaboID_PG INT,
    TauxFermentation DECIMAL(5,2),
    TauxHumidite DECIMAL(5,2),
    TauxDefaut DECIMAL(5,2),
    PoidsMoyenFeve DECIMAL(6,2),
    CertificationObtenue NVARCHAR(100),
    StatutControle NVARCHAR(20),
    DateValidation DATE,
    RapportControle VARCHAR(100),
    DateCreation DATETIME,
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- =====================================================
-- 3. TABLES STAGING POUR FICHIERS CSV
-- =====================================================

-- 3.1 Staging.Fermentation_CSV
CREATE TABLE Staging_Fermentation_CSV (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    LotID VARCHAR(20),
    DateDebut DATE,
    DateFin DATE,
    Methode VARCHAR(50),
    TemperatureMoyenne DECIMAL(5,2),
    DureeJours INT,
    PoidsEntree DECIMAL(10,2),
    PoidsSortie DECIMAL(10,2),
    pHFinal DECIMAL(4,2),
    Responsable NVARCHAR(100),
    Observations NVARCHAR(500),
    DateImport DATE,
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 3.2 Staging.Formations_CSV (même structure que formations.csv)
CREATE TABLE Staging_Formations_CSV (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    SessionID VARCHAR(20),
    DateFormation DATE,
    Theme NVARCHAR(200),
    Formateur NVARCHAR(100),
    NbParticipants INT,
    Village NVARCHAR(100),
    DureeHeures INT,
    MaterielDistribue NVARCHAR(500),
    Cooperative NVARCHAR(200),
    Evaluation VARCHAR(10),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 3.3 Staging.TransactionsLocales_CSV
CREATE TABLE Staging_TransactionsLocales_CSV (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    TransactionID VARCHAR(20),
    DateTransaction DATE,
    TypeAcheteur NVARCHAR(50),
    NomAcheteur NVARCHAR(200),
    QuantiteKG DECIMAL(10,2),
    PrixKGFCFA DECIMAL(10,2),
    TotalFCFA DECIMAL(12,2),
    Lieu NVARCHAR(100),
    MoyenTransport NVARCHAR(50),
    ProduitForme NVARCHAR(50),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 3.4 Staging.ObservationsChamp_CSV
CREATE TABLE Staging_ObservationsChamp_CSV (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    -- À adapter selon le contenu réel du fichier
    ObservationID INT,
    DateObservation DATE,
    PlantationID INT,
    Observateur NVARCHAR(100),
    TypeObservation NVARCHAR(50),
    Description NVARCHAR(MAX),
    ActionRecommandee NVARCHAR(MAX),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 3.5 Staging.CommandesFournisseurs_CSV
CREATE TABLE Staging_CommandesFournisseurs_CSV (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    CommandeID VARCHAR(20),
    DateCommande DATE,
    Fournisseur NVARCHAR(200),
    Materiel NVARCHAR(200),
    Quantite DECIMAL(10,2),
    Unite VARCHAR(20),
    PrixUnitaire DECIMAL(12,2),
    Devise VARCHAR(10),
    Total DECIMAL(12,2),
    ModeLivraison NVARCHAR(50),
    DateLivraison DATE,
    Statut VARCHAR(30),
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- 3.6 Staging.DonneesMeteo_CSV
CREATE TABLE Staging_DonneesMeteo_CSV (
    StagingID INT IDENTITY(1,1) PRIMARY KEY,
    -- À adapter selon le contenu réel
    StationID VARCHAR(20),
    DateMesure DATE,
    Region NVARCHAR(50),
    TemperatureMin DECIMAL(5,2),
    TemperatureMax DECIMAL(5,2),
    Precipitation DECIMAL(8,2),
    Humidite INT,
    DateExtraction DATETIME DEFAULT GETDATE()
);

-- =====================================================
-- INDEX POUR PERFORMANCE
-- =====================================================
CREATE INDEX IX_Fournisseurs_PG_ID ON Staging_Fournisseurs_PG(fournisseur_id);
CREATE INDEX IX_Inventaire_PG_Code ON Staging_InventaireLogistique_PG(produit_code);
CREATE INDEX IX_Plantations_SS_ID ON Staging_Plantations_SS(PlantationID);
CREATE INDEX IX_Agriculteurs_SS_ID ON Staging_Agriculteurs_SS(AgriculteurID);
CREATE INDEX IX_Fermentation_CSV_Lot ON Staging_Fermentation_CSV(LotID);
CREATE INDEX IX_Formations_CSV_Session ON Staging_Formations_CSV(SessionID);
CREATE INDEX IX_DateExtraction ON Staging_Fermentation_CSV(DateExtraction);
GO
