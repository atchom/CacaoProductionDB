-- 1. BASE DE DONNEES: CacaoProductionDB
USE CacaoProductionDB;
GO

-- TABLE: Plantations
CREATE TABLE Plantations (
    PlantationID INT IDENTITY(1,1) PRIMARY KEY,
    CodePlantation VARCHAR(20) UNIQUE NOT NULL,
    NomPlantation NVARCHAR(100),
    Village NVARCHAR(100),
    Departement NVARCHAR(100),
    Region NVARCHAR(50),
    CooperativeID INT,
    Superficie DECIMAL(8,2), -- hectares
    AnneePlantation INT,
    NbArbres INT,
    Variete NVARCHAR(50),
    GPS_Latitude DECIMAL(10,6),
    GPS_Longitude DECIMAL(10,6),
    Statut NVARCHAR(20) DEFAULT 'Active',
    DateCreation DATETIME DEFAULT GETDATE(),
    DateMaj DATETIME DEFAULT GETDATE()
);
GO

-- TABLE: Agriculteurs
CREATE TABLE Agriculteurs (
    AgriculteurID INT IDENTITY(1,1) PRIMARY KEY,
    Matricule VARCHAR(20) UNIQUE NOT NULL,
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
    Statut NVARCHAR(20) DEFAULT 'Actif'
);
GO

-- TABLE: Recoltes
CREATE TABLE Recoltes (
    RecolteID INT IDENTITY(1,1) PRIMARY KEY,
    PlantationID INT NOT NULL,
    AgriculteurID INT NOT NULL,
    DateRecolte DATE NOT NULL,
    Saison NVARCHAR(20), -- 'Grande' ou 'Petite'
    PoidsCabosses DECIMAL(8,2), -- kg
    PoidsFevesFraiches DECIMAL(8,2), -- kg
    TauxExtraction DECIMAL(5,2), -- %
    PrixAchatKG DECIMAL(8,2), -- FCFA/kg
    MontantTotal AS (PoidsFevesFraiches * PrixAchatKG),
    ModePaiement NVARCHAR(30),
    StatutPaiement NVARCHAR(20) DEFAULT 'En attente',
    Observations NVARCHAR(500),
    CONSTRAINT FK_Recoltes_Plantation FOREIGN KEY (PlantationID) REFERENCES Plantations(PlantationID),
    CONSTRAINT FK_Recoltes_Agriculteur FOREIGN KEY (AgriculteurID) REFERENCES Agriculteurs(AgriculteurID)
);
GO

-- TABLE: Exportations
CREATE TABLE Exportations (
    ExportID INT IDENTITY(1,1) PRIMARY KEY,
    NumeroContrat VARCHAR(50) UNIQUE,
    ClientID INT,
    DateContrat DATE,
    DateLivraison DATE,
    QuantiteTonnes DECIMAL(10,3),
    PrixTonneUSD DECIMAL(12,2),
    MontantTotal AS (QuantiteTonnes * PrixTonneUSD),
    Incoterm NVARCHAR(20),
    PortDestination NVARCHAR(100),
    Certificats NVARCHAR(500), -- 'BIO, Fairtrade, UTZ'
    Statut NVARCHAR(30) DEFAULT 'En préparation',
    NumeroConnaissement VARCHAR(50)
);
GO

-- TABLE: Clients
CREATE TABLE Clients (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    TypeClient NVARCHAR(30), -- 'Exportateur', 'Transformateur', 'Négociant'
    NomSociete NVARCHAR(200) NOT NULL,
    Pays NVARCHAR(100),
    Contact NVARCHAR(100),
    Email VARCHAR(100),
    Telephone VARCHAR(30),
    Adresse NVARCHAR(300),
    Categorie NVARCHAR(50),
    DatePremierAchat DATE
);
GO

-- TABLE: Cooperatives
CREATE TABLE Cooperatives (
    CooperativeID INT IDENTITY(1,1) PRIMARY KEY,
    NomCooperative NVARCHAR(200) NOT NULL,
    Region NVARCHAR(50),
    DateCreation DATE,
    President NVARCHAR(100),
    Telephone VARCHAR(20),
    Certifications NVARCHAR(500)
);
GO

-- TABLE: Parametres
CREATE TABLE Parametres (
    ParametreID INT IDENTITY(1,1) PRIMARY KEY,
    CodeParametre VARCHAR(50) UNIQUE,
    Categorie NVARCHAR(50),
    Valeur NVARCHAR(200),
    Description NVARCHAR(500),
    DateEffet DATE,
    DateExpiration DATE
);
GO