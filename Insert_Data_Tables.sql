USE CacaoProductionDB;
GO

-- 1. TABLE Plantations (25 enregistrements avec erreurs)
INSERT INTO Plantations (CodePlantation, NomPlantation, Village, Departement, Region, Superficie, AnneePlantation, NbArbres, Variete, GPS_Latitude, GPS_Longitude, Statut)
VALUES
('PLANT-001', 'Plantation Muyuka Sud', 'Muyuka', 'Fako', 'Sud-Ouest', 12.5, 2015, 2500, 'Forastero', 4.289900, 9.410500, 'Active'),
('PLANT-002', 'Ferme Buea Heights', 'Buea', 'Fako', 'Sud-Ouest', 8.7, 2018, 1800, 'Trinitario', 4.155400, 9.242200, 'Active'),
('PLANT-002', 'Champs de Tiko', 'Tiko', 'Fako', 'Sud-Ouest', 15.2, 2012, 3200, 'Forastero', 4.075000, 9.360000, 'Active'), -- DOUBLON CodePlantation
('PLANT-004', 'Plantation de Lobe', 'Kumba', 'Meme', 'Sud-Ouest', 20.0, 2010, 4500, 'Criollo', 4.634600, 9.445300, 'Active'),
('PLANT-005', '', 'Muyuka', 'Fako', 'Sud-Ouest', -5.0, 2020, 800, 'Trinitario', 4.290000, 9.411000, 'Active'), -- Nom vide, superficie négative
('PLANT-006', 'Ferme Akonolinga', 'Akonolinga', 'Nyong et Mfoumou', 'Centre', 18.3, 2016, 3800, 'Forastero', 3.766700, 12.250000, 'Active'),
('PLANT-007', 'Plantation Ebolowa', 'Ebolowa', 'Mvila', 'Sud', 25.1, 2014, 5200, 'Trinitario', 2.900000, 11.150000, 'Suspendue'),
('PLANT-008', 'Domaine de Sangmelima', 'Sangmelima', 'Dja et Lobo', 'Sud', 30.5, 2011, 6500, 'Criollo', 2.933300, 11.983300, 'Active'),
('PLANT-009', 'Ferme Batouri', 'Batouri', 'Kadey', 'Est', 22.8, 2017, 4800, 'Forastero', 4.433300, 14.366700, 'Active'),
('PLANT-010', 'Plantation Bertoua', 'Bertoua', 'Lom et Djerem', 'Est', 16.4, 2019, 3400, 'Trinitario', 4.577800, 13.684700, 'Active'),
('PLANT-011', 'Champs de Douala', 'Douala', 'Wouri', 'Littoral', 9.8, 2021, 2000, 'Forastero', 4.051100, 9.767900, 'Active'),
('PLANT-012', 'Ferme de Nkongsamba', 'Nkongsamba', 'Moungo', 'Littoral', 14.2, 2013, 2900, 'Trinitario', 4.954700, 9.940300, 'Abandonnée'),
('PLANT-013', 'Plantation Bamenda', 'Bamenda', 'Mezam', 'Nord-Ouest', 11.7, 2018, 2400, 'Forastero', 5.959700, 10.145800, 'Active'),
('PLANT-014', 'Ferme de Bafoussam', 'Bafoussam', 'Mifi', 'Ouest', 19.5, 2015, 4100, 'Trinitario', 5.477200, 10.417500, 'Active'),
('PLANT-015', 'Domaine de Dschang', 'Dschang', 'Menoua', 'Ouest', 13.9, 2020, 2800, 'Criollo', 5.443900, 10.068100, 'Active'),
('PLANT-016', 'Plantation de Foumban', 'Foumban', 'Noun', 'Ouest', 17.6, 2014, 3700, 'Forastero', 5.716700, 10.916700, 'Active'),
('PLANT-017', 'Ferme de Garoua', 'Garoua', 'Benôue', 'Nord', 28.3, 2012, 6000, 'Trinitario', 9.300000, 13.400000, 'Suspendue'),
('PLANT-018', 'Champs de Maroua', 'Maroua', 'Diamaré', 'Extrême-Nord', 21.4, 2016, 4600, 'Forastero', 10.595600, 14.324700, 'Active'),
('PLANT-019', 'Plantation de Ngaounderé', 'Ngaounderé', 'Vina', 'Adamaoua', 23.8, 2013, 5000, 'Trinitario', 7.321400, 13.583900, 'Active'),
('PLANT-020', 'Ferme de Yaoundé', 'Yaoundé', 'Mfoundi', 'Centre', 7.5, 2022, 1500, 'Forastero', 3.866700, 11.516700, 'Active'),
('PLANT-021', 'Domaine de Kribi', 'Kribi', 'Océan', 'Sud', 26.2, 2011, 5500, 'Criollo', 2.940000, 9.910000, 'Active'),
('PLANT-022', 'Plantation Edea', 'Edea', 'Sanaga-Maritime', 'Littoral', 10.3, 2019, 2100, 'Forastero', 3.800000, 10.133300, 'Active'),
('PLANT-023', 'Ferme de Limbe', 'Limbe', 'Fako', 'Sud-Ouest', 12.8, 2017, 2700, 'Trinitario', 4.016700, 9.216700, 'Active'),
('PLANT-024', 'Champs de Kumba', 'Kumba', 'Meme', 'Sud-Ouest', 18.9, 2014, 4000, 'Forastero', 4.634600, 9.445300, 'Active'),
('PLANT-025', 'Plantation de Ndop', 'Ndop', 'Ngo-Ketunjia', 'Nord-Ouest', 14.6, 2021, 3100, 'Trinitario', 6.066700, 10.450000, 'Active');
GO

-- 2. TABLE Agriculteurs (25 enregistrements avec erreurs)
INSERT INTO Agriculteurs (Matricule, Nom, Prenom, DateNaissance, Genre, Telephone, Email, Adresse, Village, CooperativeID, AnneeAdhesion, TypeMembre, Statut)
VALUES
('AGRI-2021-001', 'Moussa', 'Ahmadou', '1985-03-15', 'M', '677112233', 'moussa.ahmadou@mail.com', 'Quartier Sud', 'Muyuka', 1, 2021, 'Actif', 'Actif'),
('AGRI-2020-015', 'NGO', 'Marie', '1990-07-22', 'F', '699445566', 'marie.ngo@mail.com', 'Centre Ville', 'Buea', 1, 2020, 'Actif', 'Actif'),
('AGRI-2022-003', 'KAMGA', 'Jean', NULL, 'M', '655778899', 'jean.kamga@mail.com', 'Bamendjou', 'Tiko', 2, 2022, 'Actif', 'Actif'), -- DateNaissance NULL
('AGRI-2021-012', 'TCHINDA', 'Paul', '1978-11-30', 'M', '677990011', 'paul.tchinda@mail.com', 'Carrefour Ngodi', 'Kumba', 3, 2021, 'Actif', 'Actif'),
('AGRI-2020-008', 'MBIA', 'Sophie', '1995-02-14', 'X', '699223344', 'sophie.mbia@mail.com', 'Mile 16', 'Buea', 1, 2020, 'Actif', 'Actif'), -- Genre invalide
('AGRI-2022-025', 'NDJOCK', 'Albert', '1982-09-08', 'M', '655556677', '', 'New Town', 'Limbe', 4, 2022, 'Actif', 'Actif'), -- Email vide
('AGRI-2021-007', 'FOTSO', 'Martine', '1988-05-19', 'F', '677334455', 'martine.fotso@mail.com', 'Bonduma', 'Buea', 1, 2021, 'Associé', 'Actif'),
('AGRI-2020-020', 'NKENG', 'Pierre', '1975-12-03', 'M', '699667788', 'pierre.nkeng@mail.com', 'Molyko', 'Buea', 1, 2020, 'Actif', 'Inactif'),
('AGRI-2022-011', 'DJEUKAM', 'Chantal', '1992-08-25', 'F', '655889900', 'chantal.djeukam@mail.com', 'Mile 17', 'Buea', 1, 2022, 'Actif', 'Actif'),
('AGRI-2021-018', 'TEMGOUA', 'Samuel', '1980-04-12', 'M', '677112244', 'samuel.temgoua@mail.com', 'Bonakanda', 'Limbe', 4, 2021, 'Associé', 'Actif'),
('AGRI-2020-005', 'MEFIRE', 'Estelle', '1987-06-30', 'F', '699335566', 'estelle.mefire@mail.com', 'Mile 4', 'Buea', 1, 2020, 'Actif', 'Actif'),
('AGRI-2022-009', 'TSAFACK', 'Roger', '1973-01-17', 'M', '655778811', 'roger.tsafack@mail.com', 'Mile 18', 'Buea', 1, 2022, 'Actif', 'Suspendu'),
('AGRI-2021-023', 'KENFACK', 'Celine', '1994-03-08', 'F', '677990022', 'celine.kenfack@mail.com', 'Great Soppo', 'Buea', 1, 2021, 'Actif', 'Actif'),
('AGRI-2020-014', 'WANDJI', 'Joseph', '1984-10-21', 'M', '699224433', 'joseph.wandji@mail.com', 'Small Soppo', 'Buea', 1, 2020, 'Associé', 'Actif'),
('AGRI-2022-002', 'MEGNE', 'Angele', '1991-12-05', 'F', '655556688', 'angele.megne@mail.com', 'Mile 15', 'Buea', 1, 2022, 'Actif', 'Actif'),
('AGRI-2021-016', 'FOKOU', 'David', '1979-07-14', 'M', '677334466', 'david.fokou@mail.com', 'Mile 14', 'Buea', 1, 2021, 'Actif', 'Actif'),
('AGRI-2020-022', 'TAGNE', 'Patricia', '1986-09-28', 'F', '699667799', 'patricia.tagne@mail.com', 'Mile 3', 'Buea', 1, 2020, 'Actif', 'Actif'),
('AGRI-2022-004', 'NGOUPAYOU', 'Martin', '1977-02-11', 'M', '655889911', 'martin.ngoupayou@mail.com', 'Mile 2', 'Buea', 1, 2022, 'Associé', 'Inactif'),
('AGRI-2021-010', 'DJOUDA', 'Genevieve', '1983-05-23', 'F', '677112255', 'genevieve.djouda@mail.com', 'Mile 1', 'Buea', 1, 2021, 'Actif', 'Actif'),
('AGRI-2020-019', 'MBIANDA', 'Eric', '1993-11-16', 'M', '699335577', 'eric.mbianda@mail.com', 'Mile 6', 'Buea', 1, 2020, 'Actif', 'Actif'),
('AGRI-2022-013', 'NGUEMBOCK', 'Brigitte', '1989-08-07', 'F', '655778822', 'brigitte.nguembock@mail.com', 'Mile 7', 'Buea', 1, 2022, 'Actif', 'Actif'),
('AGRI-2021-006', 'TSALA', 'Armand', '1974-04-29', 'M', '677990033', 'armand.tsala@mail.com', 'Mile 8', 'Buea', 1, 2021, 'Actif', 'Actif'),
('AGRI-2020-017', 'MEFE', 'Veronique', '1996-01-09', 'F', '699224444', 'veronique.mefe@mail.com', 'Mile 9', 'Buea', 1, 2020, 'Actif', 'Actif'),
('AGRI-2022-021', 'KOUAM', 'Georges', '1981-06-13', 'M', '655556699', 'georges.kouam@mail.com', 'Mile 10', 'Buea', 1, 2022, 'Associé', 'Actif'),
('AGRI-2020-001', 'DONGMO', 'Claire', '1976-10-27', 'F', '677334477', 'claire.dongmo@mail.com', 'Mile 11', 'Buea', 1, 2020, 'Actif', 'Actif');
GO

-- 3. TABLE Recoltes (25 enregistrements avec erreurs)
INSERT INTO Recoltes (PlantationID, AgriculteurID, DateRecolte, Saison, PoidsCabosses, PoidsFevesFraiches, TauxExtraction, PrixAchatKG, ModePaiement, StatutPaiement, Observations)
VALUES
(1, 1, '2024-03-15', 'Grande', 1200.5, 300.1, 25.0, 850.0, 'Espèces', 'Payé', 'Récolte de bonne qualité'),
(2, 2, '2024-03-18', 'Grande', 950.2, 237.6, 25.0, 860.0, 'Mobile Money', 'Payé', 'Fèves bien mûres'),
(3, 3, '2024-03-20', 'Grande', 1500.0, -375.0, 25.0, 870.0, 'Chèque', 'En attente', 'Poids négatif'), -- PoidsFevesFraiches négatif
(1, 1, '2024-03-22', 'Grande', 800.3, 200.1, 25.0, 850.0, 'Espèces', 'Payé', 'Deuxième récolte'), -- Doublon partiel
(4, 4, '2024-03-25', 'Grande', 1800.7, 450.2, 25.0, 880.0, 'Mobile Money', 'Payé', 'Excellente récolte'),
(5, 5, '2024-03-28', 'Grande', 500.0, 125.0, 25.0, 900.0, 'Espèces', 'En attente', 'Petite récolte'),
(6, 6, '2024-04-01', 'Grande', 2200.0, 550.0, 25.0, 860.0, 'Virement', 'Payé', NULL), -- Observations NULL
(7, 7, '2024-04-03', 'Grande', 1700.5, 425.1, 25.0, 850.0, 'Mobile Money', 'Payé', 'Récolte moyenne'),
(8, 8, '2024-04-05', 'Grande', 1900.8, 475.2, 25.0, 870.0, 'Espèces', 'Retard', 'Paiement en retard'),
(9, 9, '2024-04-08', 'Grande', 2100.0, 525.0, 25.0, 890.0, 'Chèque', 'Payé', 'Bonne qualité'),
(10, 10, '2024-04-10', 'Grande', 1600.3, 400.1, 25.0, 850.0, 'Mobile Money', 'Payé', 'Standard'),
(11, 11, '2024-04-12', 'Grande', 1300.7, 325.2, 25.0, 860.0, 'Espèces', 'Payé', 'Correct'),
(12, 12, '2024-04-15', 'Grande', 1400.5, 350.1, 25.0, 850.0, 'Mobile Money', 'En attente', ''),
(13, 13, '2024-04-18', 'Grande', 2300.0, 575.0, 25.0, 900.0, 'Virement', 'Payé', 'Excellente qualité'),
(14, 14, '2024-04-20', 'Grande', 2000.8, 500.2, 25.0, 880.0, 'Espèces', 'Payé', 'Très bien'),
(15, 15, '2024-04-22', 'Grande', 1750.3, 437.6, 25.0, 870.0, 'Mobile Money', 'Payé', 'Normal'),
(16, 16, '2024-04-25', 'Grande', 1650.7, 412.7, 25.0, 860.0, 'Espèces', 'Payé', 'Satisfaisant'),
(17, 17, '2024-04-28', 'Grande', 1550.5, 387.6, 25.0, 850.0, 'Mobile Money', 'En attente', 'En cours'),
(18, 18, '2024-05-01', 'Petite', 1450.0, 362.5, 25.0, 920.0, 'Espèces', 'Payé', 'Début petite saison'),
(19, 19, '2024-05-03', 'Petite', 1350.8, 337.7, 25.0, 910.0, 'Mobile Money', 'Payé', 'Correct'),
(20, 20, '2024-05-05', 'Petite', 1250.3, 312.6, 25.0, 900.0, 'Espèces', 'Payé', 'Moyen'),
(21, 21, '2024-05-08', 'Petite', 1150.7, 287.7, 25.0, 890.0, 'Mobile Money', 'Payé', 'Acceptable'),
(22, 22, '2024-05-10', 'Petite', 1050.5, 262.6, 25.0, 880.0, 'Espèces', 'En attente', 'Petite quantité'),
(23, 23, '2024-05-12', 'Petite', 950.0, 237.5, 25.0, 870.0, 'Mobile Money', 'Payé', 'Limite'),
(24, 24, '2024-05-15', 'Petite', 850.8, 212.7, 25.0, 860.0, 'Espèces', 'Payé', 'Fin de saison'),
(25, 25, '2024-05-18', 'Petite', 750.3, 187.6, 25.0, 850.0, 'Mobile Money', 'Payé', 'Dernière récolte');
GO

-- 4. TABLE Exportations (25 enregistrements avec erreurs)
INSERT INTO Exportations (NumeroContrat, ClientID, DateContrat, DateLivraison, QuantiteTonnes, PrixTonneUSD, Incoterm, PortDestination, Certificats, Statut, NumeroConnaissement)
VALUES
('CONT-2024-001', 1, '2024-03-10', '2024-04-15', 25.5, 3200.0, 'FOB', 'Douala', 'BIO, Fairtrade', 'Livré', 'BL00124567'),
('CONT-2024-002', 2, '2024-03-12', '2024-04-20', 18.7, 3150.0, 'CIF', 'Anvers', 'UTZ, Rainforest', 'En transit', 'BL00124568'),
('CONT-2024-002', 3, '2024-03-15', '2024-04-25', 30.2, 3250.0, 'FOB', 'Douala', 'BIO', 'Préparation', 'BL00124569'), -- Doublon NumeroContrat
('CONT-2024-004', 4, '2024-03-18', NULL, 22.8, 3100.0, 'CIF', 'Rotterdam', 'Fairtrade', 'En attente', NULL), -- DateLivraison NULL
('CONT-2024-005', 5, '2024-03-20', '2024-05-05', 15.3, -3300.0, 'FOB', 'Douala', 'BIO, Organic', 'Livré', 'BL00124570'), -- Prix négatif
('CONT-2024-006', 6, '2024-03-22', '2024-05-10', 28.5, 3350.0, 'CIF', 'Hambourg', 'UTZ', 'En transit', 'BL00124571'),
('CONT-2024-007', 7, '2024-03-25', '2024-05-15', 20.1, 3200.0, 'FOB', 'Douala', 'Fairtrade', 'Préparation', 'BL00124572'),
('CONT-2024-008', 8, '2024-03-28', '2024-05-20', 17.6, 3150.0, 'CIF', 'Le Havre', 'BIO', 'En attente', 'BL00124573'),
('CONT-2024-009', 9, '2024-03-30', '2024-05-25', 32.4, 3400.0, 'FOB', 'Douala', 'UTZ, Rainforest', 'Livré', 'BL00124574'),
('CONT-2024-010', 10, '2024-04-02', '2024-05-30', 19.8, 3250.0, 'CIF', 'Anvers', 'BIO, Fairtrade', 'En transit', 'BL00124575'),
('', 11, '2024-04-05', '2024-06-05', 24.7, 3300.0, 'FOB', 'Douala', 'Organic', 'Préparation', 'BL00124576'), -- NumeroContrat vide
('CONT-2024-012', 12, '2024-04-08', '2024-06-10', 16.5, 3200.0, 'CIF', 'Rotterdam', 'Fairtrade, UTZ', 'En attente', 'BL00124577'),
('CONT-2024-013', 13, '2024-04-10', '2024-06-15', 29.3, 3450.0, 'FOB', 'Douala', 'BIO', 'Livré', 'BL00124578'),
('CONT-2024-014', 14, '2024-04-12', '2024-06-20', 21.2, 3350.0, 'CIF', 'Hambourg', 'Rainforest', 'En transit', 'BL00124579'),
('CONT-2024-015', 15, '2024-04-15', '2024-06-25', 18.9, 3300.0, 'FOB', 'Douala', 'BIO, Fairtrade', 'Préparation', 'BL00124580'),
('CONT-2024-016', 16, '2024-04-18', '2024-06-30', 26.4, 3400.0, 'CIF', 'Le Havre', 'UTZ', 'En attente', 'BL00124581'),
('CONT-2024-017', 17, '2024-04-20', '2024-07-05', 23.1, 3350.0, 'FOB', 'Douala', 'BIO, Organic', 'Livré', 'BL00124582'),
('CONT-2024-018', 18, '2024-04-22', '2024-07-10', 17.8, 3250.0, 'CIF', 'Anvers', 'Fairtrade', 'En transit', 'BL00124583'),
('CONT-2024-019', 19, '2024-04-25', '2024-07-15', 31.5, 3500.0, 'FOB', 'Douala', 'UTZ, Rainforest', 'Préparation', 'BL00124584'),
('CONT-2024-020', 20, '2024-04-28', '2024-07-20', 20.6, 3400.0, 'CIF', 'Rotterdam', 'BIO', 'En attente', 'BL00124585'),
('CONT-2024-021', 21, '2024-05-01', '2024-07-25', 25.9, 3450.0, 'FOB', 'Douala', 'Fairtrade, UTZ', 'Livré', 'BL00124586'),
('CONT-2024-022', 22, '2024-05-03', '2024-07-30', 19.4, 3350.0, 'CIF', 'Hambourg', 'BIO', 'En transit', 'BL00124587'),
('CONT-2024-023', 23, '2024-05-05', '2024-08-05', 28.7, 3550.0, 'FOB', 'Douala', 'Organic', 'Préparation', 'BL00124588'),
('CONT-2024-024', 24, '2024-05-08', '2024-08-10', 22.3, 3450.0, 'CIF', 'Le Havre', 'BIO, Fairtrade', 'En attente', 'BL00124589'),
('CONT-2024-025', 25, '2024-05-10', '2024-08-15', 16.8, 3400.0, 'FOB', 'Douala', 'UTZ', 'Livré', 'BL00124590');
GO

-- 5. TABLE Clients (25 enregistrements avec erreurs)
INSERT INTO Clients (TypeClient, NomSociete, Pays, Contact, Email, Telephone, Adresse, Categorie, DatePremierAchat)
VALUES
('Exportateur', 'Chocolate World Ltd', 'Belgique', 'Mr. Van Damme', 'contact@chocoworld.be', '+32 2 123 4567', 'Rue du Cacao 123, Bruxelles', 'Grand compte', '2020-01-15'),
('Transformateur', 'CacaoCam SARL', 'Cameroun', 'M. Nkeng', 'info@cacaocam.cm', '677889900', 'Zone industrielle, Douala', 'National', '2019-03-20'),
('Exportateur', 'EuroCacao GmbH', 'Allemagne', 'Herr Schmidt', 'info@eurocacao.de', '+49 30 9876543', 'Berliner Str. 45, Hamburg', 'Grand compte', '2021-05-10'),
('Négociant', 'West Africa Cocoa Traders', 'France', 'M. Dubois', NULL, '+33 1 2345678', 'Avenue des Tropiques 78, Paris', 'Intermédiaire', '2022-02-28'), -- Email NULL
('Transformateur', '', 'Cameroun', 'Mme Fotso', 'contact@artisanal.cm', '699112233', 'Boulevard du Mfoundi, Yaoundé', 'Local', '2023-07-15'), -- NomSociete vide
('Exportateur', 'Swiss Chocolate Masters', 'Suisse', 'Mr. Müller', 'order@swisschoco.ch', '+41 22 3456789', 'Quai du Cacao 12, Genève', 'Premium', '2020-09-30'),
('Négociant', 'Global Cocoa Network', 'Pays-Bas', 'Mr. Van Berg', 'sales@globalcocoa.nl', '+31 20 4567890', 'Cacaostraat 34, Amsterdam', 'Intermédiaire', '2021-11-25'),
('Transformateur', 'ChocoDelice Ltd', 'Cameroun', 'M. Kenfack', 'production@chocodelice.cm', '655667788', 'Route de Bonaberi, Douala', 'National', '2022-04-10'),
('Exportateur', 'Italian Fine Cocoa', 'Italie', 'Signor Rossi', 'export@italiancocoa.it', '+39 06 5678901', 'Via Cacao 56, Milan', 'Moyen compte', '2023-01-20'),
('Négociant', 'Africa Cocoa Partners', 'Royaume-Uni', 'Mr. Johnson', 'uk@africacocoa.uk', '+44 20 6789012', 'Cocoa Street 78, London', 'Intermédiaire', '2019-08-05'),
('Transformateur', 'Bonne Chocolaterie', 'Cameroun', 'Mme Temgoua', 'contact@bonnechoco.cm', '677998877', 'Carrefour Nlongkak, Yaoundé', 'Local', '2020-12-15'),
('Exportateur', 'Scandinavian Cocoa AB', 'Suède', 'Mr. Andersson', 'info@scanocoa.se', '+46 8 7890123', 'Kakaogatan 90, Stockholm', 'Grand compte', '2021-06-30'),
('Négociant', 'Cocoa Connect SA', 'Espagne', 'Señor Garcia', 'spain@cocoaconnect.es', '+34 91 8901234', 'Calle Cacao 23, Madrid', 'Intermédiaire', '2022-09-15'),
('Transformateur', 'Miel et Chocolat', 'Cameroun', 'M. Djouda', 'miel.chocolat@mail.cm', '699887766', 'Marché Central, Bafoussam', 'Artisanal', '2023-03-10'),
('Exportateur', 'USA Cocoa Importers', 'États-Unis', 'Mr. Smith', 'imports@usacocoa.com', '+1 212 9012345', 'Cocoa Avenue 345, New York', 'Premium', '2020-04-25'),
('Négociant', 'Asian Cocoa Market', 'Singapour', 'Mr. Lee', 'asia@cocoamarket.sg', '+65 6123 4567', 'Cocoa Way 67, Singapore', 'Intermédiaire', '2021-10-10'),
('Transformateur', 'Saveurs du Terroir', 'Cameroun', 'Mme Mefire', 'saveurs@terroir.cm', '655776655', 'Quartier Briqueterie, Yaoundé', 'Local', '2022-05-20'),
('Exportateur', 'Japanese Fine Foods', 'Japon', 'Mr. Tanaka', 'japan@finefoods.jp', '+81 3 2345678', 'Cocoa Street 89, Tokyo', 'Moyen compte', '2023-02-15'),
('Négociant', 'Oceanic Cocoa Traders', 'Australie', 'Mr. Brown', 'oceania@cocoatraders.au', '+61 2 3456789', 'Cocoa Road 123, Sydney', 'Intermédiaire', '2019-12-20'),
('Transformateur', 'Cacao Artisanal CM', 'Cameroun', 'M. Wandji', 'artisanal@cacaocm.cm', '677665544', 'Marché Mfoundi, Yaoundé', 'Artisanal', '2020-07-05'),
('Exportateur', 'Portuguese Cocoa Co', 'Portugal', 'Sr. Silva', 'portugal@cocoa.pt', '+351 21 4567890', 'Rua do Cacau 45, Lisbonne', 'Petit compte', '2021-03-30'),
('Négociant', 'Mediterranean Cocoa', 'Grèce', 'Mr. Papadopoulos', 'greece@medcocoa.gr', '+30 21 5678901', 'Cocoa Street 67, Athènes', 'Intermédiaire', '2022-08-25'),
('Transformateur', 'Chocolatier du Cameroun', 'Cameroun', 'M. Fokou', 'chocolatier@cm.cm', '699554433', 'Avenue Kennedy, Douala', 'National', '2023-06-10'),
('Exportateur', 'Nordic Chocolate AB', 'Norvège', 'Mr. Olsen', 'nordic@chocolate.no', '+47 22 6789012', 'Kakaoveien 78, Oslo', 'Grand compte', '2020-11-15'),
('Négociant', 'Baltic Cocoa Trade', 'Pologne', 'Mr. Kowalski', 'poland@balticcocoa.pl', '+48 22 7890123', 'Ulica Kakao 90, Varsovie', 'Intermédiaire', '2021-09-30');
GO

-- 6. TABLE Cooperatives (10 enregistrements avec erreurs)
INSERT INTO Cooperatives (NomCooperative, Region, DateCreation, President, Telephone, Certifications)
VALUES
('Coopérative Cacao Muyuka', 'Sud-Ouest', '2015-06-15', 'M. Moussa Ahmadou', '677112233', 'Fairtrade, BIO'),
('Coopérative des Planteurs de Buea', 'Sud-Ouest', '2016-03-20', 'Mme Marie NGO', '699445566', 'UTZ, BIO'),
('Coopérative Cacao Tiko', 'Sud-Ouest', '2017-01-10', 'M. Jean KAMGA', '655778899', 'Rainforest Alliance'),
('Coopérative de Kumba', 'Sud-Ouest', '2018-09-05', 'M. Paul TCHINDA', '677990011', 'Fairtrade'),
('Coopérative de Limbe', 'Sud-Ouest', NULL, 'M. Albert NDJOCK', '655556677', 'BIO, Organic'), -- DateCreation NULL
('Coopérative d''Akonolinga', 'Centre', '2020-05-15', 'M. Samuel TEMGOUA', '677112244', ''),
('Coopérative d''Ebolowa', 'Sud', '2021-02-28', 'Mme Chantal DJEUKAM', '655889900', 'UTZ'),
('Coopérative de Batouri', 'Est', '2019-08-12', 'M. Roger TSAFACK', '655778811', 'Fairtrade, BIO'),
('Coopérative de Douala', 'Littoral', '2022-07-01', 'M. David FOKOU', '677334466', 'Rainforest Alliance'),
('Coopérative de Bamenda', 'Nord-Ouest', '2023-04-18', 'Mme Patricia TAGNE', '699667799', 'BIO');
GO

-- 7. TABLE Parametres (données de référence)
INSERT INTO Parametres (CodeParametre, Categorie, Valeur, Description, DateEffet, DateExpiration)
VALUES
('PRIX_MIN', 'Prix', '800', 'Prix minimum d''achat FCFA/kg', '2024-01-01', '2024-12-31'),
('PRIX_MAX', 'Prix', '1000', 'Prix maximum d''achat FCFA/kg', '2024-01-01', '2024-12-31'),
('QUALITE_A_MIN', 'Qualite', '75', 'Taux fermentation minimum Grade A', '2024-01-01', NULL),
('QUALITE_B_MIN', 'Qualite', '60', 'Taux fermentation minimum Grade B', '2024-01-01', NULL),
('HUMIDITE_MAX', 'Qualite', '7.5', 'Humidité maximum fèves sèches', '2024-01-01', NULL),
('TAILLE_MIN_A', 'Qualite', '1.1', 'Taille minimum fèves Grade A (g)', '2024-01-01', NULL),
('SEUIL_STOCK_MIN', 'Stock', '500', 'Seuil minimum stock fèves (kg)', '2024-01-01', NULL);
GO