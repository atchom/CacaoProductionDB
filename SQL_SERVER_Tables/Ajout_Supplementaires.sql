USE CacaoProductionDB;
GO

-- 1. TABLE Plantations (20 enregistrements supplémentaires)
INSERT INTO Plantations (CodePlantation, NomPlantation, Village, Departement, Region, Superficie, AnneePlantation, NbArbres, Variete, GPS_Latitude, GPS_Longitude, Statut)
VALUES
('PLANT-026', 'Ferme de Mbanga', 'Mbanga', 'Moungo', 'Littoral', 16.8, 2019, 3500, 'Trinitario', 4.500000, 9.566700, 'Active'),
('PLANT-027', 'Plantation Loum', 'Loum', 'Moungo', 'Littoral', 14.3, 2017, 3000, 'Forastero', 4.716700, 9.733300, 'Active'),
('PLANT-028', 'Domaine Manjo', 'Manjo', 'Moungo', 'Littoral', 12.7, 2020, 2600, 'Trinitario', 4.850000, 9.816700, 'Suspendue'),
('PLANT-029', 'Plantation Nkondjock', 'Nkondjock', 'Nkam', 'Littoral', 19.2, 2016, 4200, 'Forastero', 4.516700, 10.166700, 'Active'),
('PLANT-030', 'Ferme de Yabassi', 'Yabassi', 'Nkam', 'Littoral', 22.1, 2015, 4800, 'Criollo', 4.450000, 9.966700, 'Active'),
('PLANT-031', 'Plantation de Melong', 'Melong', 'Moungo', 'Littoral', 11.5, 2021, 2400, 'Trinitario', 5.116700, 9.950000, 'Active'),
('PLANT-032', 'Ferme Penja', 'Penja', 'Moungo', 'Littoral', 17.9, 2014, 3800, 'Forastero', 4.633300, 9.683300, 'Active'),
('PLANT-033', 'Domaine Ndom', 'Ndom', 'Sanaga-Maritime', 'Littoral', 13.6, 2018, 2900, 'Trinitario', 4.016700, 10.466700, 'Active'),
('PLANT-034', 'Plantation Dibombari', 'Dibombari', 'Moungo', 'Littoral', 15.4, 2019, 3200, 'Forastero', 4.183300, 9.666700, 'Active'),
('PLANT-035', 'Ferme de Bonalea', 'Bonalea', 'Moungo', 'Littoral', 20.8, 2013, 4500, 'Criollo', 4.250000, 9.583300, 'Active'),
('PLANT-036', 'Plantation de Dibamba', 'Dibamba', 'Sanaga-Maritime', 'Littoral', 18.7, 2017, 4100, 'Trinitario', 3.833300, 9.916700, 'Active'),
('PLANT-037', 'Domaine Nlonako', 'Nlonako', 'Moungo', 'Littoral', 14.9, 2020, 3100, 'Forastero', 4.916700, 9.833300, 'Abandonnée'),
('PLANT-038', 'Plantation Mbanga', 'Mbanga', 'Moungo', 'Littoral', -5.5, 2022, 0, 'Trinitario', 4.500000, 9.566700, 'Active'), -- Superficie négative et NbArbres = 0
('PLANT-039', 'Ferme de Nkongsamba', 'Nkongsamba', 'Moungo', 'Littoral', 12.2, 2016, 2500, 'Forastero', 4.954700, 9.940300, 'Active'), -- Doublon partiel de PLANT-012
('PLANT-040', 'Domaine Manoka', 'Manoka', 'Wouri', 'Littoral', 25.3, 2012, 5500, 'Criollo', 3.800000, 9.700000, 'Active'),
('PLANT-041', 'Plantation Idemba', 'Idemba', 'Moungo', 'Littoral', 16.1, 2018, 3400, 'Trinitario', 4.650000, 9.750000, 'Active'),
('PLANT-042', 'Ferme de Mouanko', 'Mouanko', 'Sanaga-Maritime', 'Littoral', 21.7, 2014, 4700, 'Forastero', 3.633300, 9.766700, 'Active'),
('PLANT-043', '', 'Ngwei', 'Sanaga-Maritime', 'Littoral', 13.8, 2021, 2800, 'Trinitario', 3.750000, 9.850000, 'Active'), -- Nom vide
('PLANT-044', 'Plantation de Yato', 'Yato', 'Moungo', 'Littoral', 19.5, 2015, 4200, 'Criollo', 4.783300, 9.900000, 'Active'),
('PLANT-045', 'Ferme Nyanon', 'Nyanon', 'Moungo', 'Littoral', 17.2, 2019, 3700, 'Trinitario', 4.700000, 9.800000, 'Active');
GO

-- 2. TABLE Agriculteurs (20 enregistrements supplémentaires)
INSERT INTO Agriculteurs (Matricule, Nom, Prenom, DateNaissance, Genre, Telephone, Email, Adresse, Village, CooperativeID, AnneeAdhesion, TypeMembre, Statut)
VALUES
('AGRI-2023-001', 'MBAPPE', 'Kylian', '1998-12-20', 'M', '677123456', 'k.mbappe@mail.com', 'Quartier Sportif', 'Mbanga', 5, 2023, 'Actif', 'Actif'),
('AGRI-2023-002', 'HAALAND', 'Erling', '2000-07-21', 'M', '699654321', 'e.haaland@mail.com', 'Zone Nordique', 'Loum', 5, 2023, 'Actif', 'Actif'),
('AGRI-2023-003', 'MBELE', 'Sarah', '1995-04-15', 'F', '655789012', 'sarah.mbele@mail.com', 'Carrefour Marché', 'Manjo', 6, 2023, 'Associé', 'Actif'),
('AGRI-2023-004', 'NDONGO', 'Jacques', '1985-09-30', 'M', '677890123', 'j.ndongo@mail.com', 'Avenue Principale', 'Nkondjock', 6, 2023, 'Actif', 'Actif'),
('AGRI-2023-005', 'FOMENA', 'Alice', '1992-03-12', 'F', '699901234', 'alice.fomena@mail.com', 'Rue du Commerce', 'Yabassi', 7, 2023, 'Actif', 'Actif'),
('AGRI-2023-006', 'TCHAKOUTE', 'Marc', '1988-11-25', 'M', '655012345', 'marc.tchakoute@mail.com', 'Quartier Résidentiel', 'Melong', 7, 2023, 'Actif', 'Actif'),
('AGRI-2023-007', 'KWEDI', 'Julie', '1990-06-18', 'F', '677123789', 'julie.kwedi@mail.com', 'Zone Industrielle', 'Penja', 8, 2023, 'Associé', 'Actif'),
('AGRI-2023-008', 'MBALLA', 'Georges', '1979-08-05', 'M', '699456012', 'georges.mballa@mail.com', 'Boulevard Central', 'Ndom', 8, 2023, 'Actif', 'Actif'),
('AGRI-2023-009', 'AGRI-2023-009', 'Sophie', '1993-02-28', 'F', '655789456', 'sophie.dupont@mail.com', 'Rue des Fleurs', 'Dibombari', 9, 2023, 'Actif', 'Actif'), -- Matricule identique au nom
('AGRI-2023-010', 'DUPONT', 'Luc', '1983-12-10', 'M', '677012789', 'luc.dupont@mail.com', 'Avenue des Arbres', 'Bonalea', 9, 2023, 'Actif', 'Actif'),
('AGRI-2023-011', 'MARTIN', 'Émilie', '1997-05-22', 'F', '699345678', '', 'Quartier Vert', 'Dibamba', 10, 2023, 'Actif', 'Actif'), -- Email vide
('AGRI-2023-012', 'LEFEBVRE', 'Antoine', '1980-10-15', 'M', '655678901', 'antoine.lefebvre@mail.com', 'Route Forestière', 'Nlonako', 10, 2023, 'Actif', 'Actif'),
('AGRI-2023-013', 'ROUX', 'Marie', '1994-01-08', 'F', '677901234', 'marie.roux@mail.com', 'Chemin Rural', 'Mbanga', 5, 2023, 'Associé', 'Actif'),
('AGRI-2023-014', 'FOURNIER', 'Pierre', '1976-07-03', 'M', '699234567', 'pierre.fournier@mail.com', 'Voie Agricole', 'Nkongsamba', 5, 2023, 'Actif', 'Inactif'),
('AGRI-2023-015', 'MERCIER', 'Claire', '1991-09-14', 'F', '655567890', 'claire.mercier@mail.com', 'Sentier du Cacao', 'Manoka', 6, 2023, 'Actif', 'Actif'),
('AGRI-2023-016', 'BLANC', 'Thomas', '1986-04-27', 'M', '677890456', 'thomas.blanc@mail.com', 'Allée des Plantations', 'Idemba', 6, 2023, 'Actif', 'Actif'),
('AGRI-2023-017', 'GIRARD', 'Nathalie', '1999-11-30', 'F', '699123789', 'nathalie.girard@mail.com', 'Route du Village', 'Mouanko', 7, 2023, 'Associé', 'Actif'),
('AGRI-2023-018', 'BONNET', 'François', '1982-03-17', 'M', '655456012', 'francois.bonnet@mail.com', 'Chemin Principal', 'Ngwei', 7, 2023, 'Actif', 'Actif'),
('AGRI-2023-019', 'FABRE', 'Isabelle', '1996-08-09', 'Z', '677789123', 'isabelle.fabre@mail.com', 'Voie Secondaire', 'Yato', 8, 2023, 'Actif', 'Actif'), -- Genre invalide (Z)
('AGRI-2023-020', 'GUERIN', 'Philippe', '1974-06-21', 'M', '699012456', 'philippe.guerin@mail.com', 'Avenue du Marché', 'Nyanon', 8, 2023, 'Actif', 'Actif');
GO

-- 3. TABLE Recoltes (20 enregistrements supplémentaires)
INSERT INTO Recoltes (PlantationID, AgriculteurID, DateRecolte, Saison, PoidsCabosses, PoidsFevesFraiches, TauxExtraction, PrixAchatKG, ModePaiement, StatutPaiement, Observations)
VALUES
(26, 26, '2024-06-10', 'Petite', 1100.5, 275.1, 25.0, 920.0, 'Espèces', 'Payé', 'Bon début'),
(27, 27, '2024-06-12', 'Petite', 1050.3, 262.6, 25.0, 910.0, 'Mobile Money', 'Payé', 'Standard'),
(28, 28, '2024-06-15', 'Petite', 1200.7, 300.2, 25.0, 930.0, 'Chèque', 'En attente', 'Qualité moyenne'),
(29, 29, '2024-06-18', 'Petite', 1150.0, 287.5, 25.0, 920.0, 'Espèces', 'Payé', 'Correct'),
(30, 30, '2024-06-20', 'Petite', 1250.8, 312.7, 25.0, 940.0, 'Mobile Money', 'Payé', 'Bonne récolte'),
(31, 31, '2024-06-22', 'Petite', 1300.5, 325.1, 25.0, 950.0, 'Virement', 'Payé', 'Excellente'),
(32, 32, '2024-06-25', 'Petite', 1000.3, 250.1, 25.0, 900.0, 'Espèces', 'En attente', 'Petite quantité'),
(33, 33, '2024-06-28', 'Petite', 1400.7, 350.2, 25.0, 960.0, 'Mobile Money', 'Payé', 'Très bien'),
(34, 34, '2024-07-01', 'Petite', 1350.0, 337.5, 25.0, 950.0, 'Espèces', 'Payé', 'Normal'),
(35, 35, '2024-07-03', 'Petite', 1450.8, 362.7, 25.0, 970.0, 'Mobile Money', 'Payé', 'Supérieure'),
(36, 36, '2024-07-05', 'Petite', 950.5, 237.6, 25.0, 890.0, 'Chèque', 'Payé', 'Moyenne'),
(37, 37, '2024-07-08', 'Petite', 1500.3, -375.1, 25.0, 980.0, 'Espèces', 'En attente', 'Poids négatif'), -- PoidsFevesFraiches négatif
(38, 38, '2024-07-10', 'Petite', 1600.7, 400.2, 25.0, 990.0, 'Mobile Money', 'Payé', 'Excellente qualité'),
(39, 39, '2024-07-12', 'Petite', 1550.0, 387.5, 25.0, 980.0, 'Espèces', 'Payé', 'Très bon'),
(40, 40, '2024-07-15', 'Petite', 1650.8, 412.7, 25.0, 1000.0, 'Mobile Money', 'Payé', 'Premium'),
(41, 41, '2024-07-18', 'Petite', 900.5, 225.1, 25.0, 880.0, 'Virement', 'Payé', 'Petit lot'),
(42, 42, '2024-07-20', 'Petite', 1700.3, 425.1, 25.0, 1010.0, 'Espèces', 'En attente', 'Grande quantité'),
(43, 43, '2024-07-22', 'Petite', 1750.7, 437.7, 25.0, 1020.0, 'Mobile Money', 'Payé', 'Exceptionnel'),
(44, 44, '2024-07-25', 'Petite', 1800.0, 450.0, 0.0, 1030.0, 'Espèces', 'Payé', 'Taux extraction 0'), -- TauxExtraction = 0
(45, 45, '2024-07-28', 'Petite', 1850.8, 462.7, 25.0, 1040.0, 'Mobile Money', 'Payé', 'Dernière de la saison');
GO

-- 4. TABLE Exportations (20 enregistrements supplémentaires)
INSERT INTO Exportations (NumeroContrat, ClientID, DateContrat, DateLivraison, QuantiteTonnes, PrixTonneUSD, Incoterm, PortDestination, Certificats, Statut, NumeroConnaissement)
VALUES
('CONT-2024-026', 26, '2024-06-05', '2024-08-20', 24.3, 3500.0, 'CIF', 'Rotterdam', 'BIO, Fairtrade', 'En préparation', 'BL00124591'),
('CONT-2024-027', 27, '2024-06-08', '2024-08-25', 19.7, 3450.0, 'FOB', 'Douala', 'UTZ', 'Préparation', 'BL00124592'),
('CONT-2024-028', 28, '2024-06-10', '2024-08-30', 28.1, 3600.0, 'CIF', 'Hambourg', 'Rainforest', 'En attente', 'BL00124593'),
('CONT-2024-029', 29, '2024-06-12', '2024-09-05', 21.5, 3550.0, 'FOB', 'Douala', 'BIO, Organic', 'Livré', 'BL00124594'),
('CONT-2024-030', 30, '2024-06-15', '2024-09-10', 17.8, 3400.0, 'CIF', 'Le Havre', 'Fairtrade', 'En transit', 'BL00124595'),
('CONT-2024-031', 31, '2024-06-18', '2024-09-15', 30.6, 3650.0, 'FOB', 'Douala', 'UTZ, Rainforest', 'Préparation', 'BL00124596'),
('CONT-2024-032', 32, '2024-06-20', '2024-09-20', 23.9, 3550.0, 'CIF', 'Anvers', 'BIO', 'En attente', 'BL00124597'),
('CONT-2024-033', 33, '2024-06-22', '2024-09-25', 20.2, 3500.0, 'FOB', 'Douala', 'Fairtrade, UTZ', 'Livré', 'BL00124598'),
('CONT-2024-034', 34, '2024-06-25', '2024-09-30', 26.4, 3600.0, 'CIF', 'Rotterdam', 'BIO, Organic', 'En transit', 'BL00124599'),
('CONT-2024-035', 35, '2024-06-28', '2024-10-05', 22.7, 3550.0, 'FOB', 'Douala', 'Rainforest', 'Préparation', 'BL00124600'),
('CONT-2024-034', 36, '2024-07-01', '2024-10-10', 18.9, 3400.0, 'CIF', 'Hambourg', 'BIO, Fairtrade', 'En attente', 'BL00124601'), -- Doublon NumeroContrat
('CONT-2024-037', 37, '2024-07-03', '2024-10-15', 31.8, 3700.0, 'FOB', 'Douala', 'UTZ', 'Livré', 'BL00124602'),
('CONT-2024-038', 38, '2024-07-05', '2024-10-20', 25.1, 3650.0, 'CIF', 'Le Havre', 'BIO, Rainforest', 'En transit', 'BL00124603'),
('CONT-2024-039', 39, '2024-07-08', NULL, 21.3, 3600.0, 'FOB', 'Douala', 'Fairtrade', 'Préparation', NULL), -- DateLivraison NULL
('CONT-2024-040', 40, '2024-07-10', '2024-10-30', 27.6, 3700.0, 'CIF', 'Anvers', 'BIO, UTZ', 'En attente', 'BL00124604'),
('CONT-2024-041', 41, '2024-07-12', '2024-11-05', 19.5, 3550.0, 'FOB', 'Douala', 'Organic', 'Livré', 'BL00124605'),
('CONT-2024-042', 42, '2024-07-15', '2024-11-10', 29.2, -3800.0, 'CIF', 'Rotterdam', 'BIO, Fairtrade', 'En transit', 'BL00124606'), -- Prix négatif
('CONT-2024-043', 43, '2024-07-18', '2024-11-15', 24.4, 3750.0, 'FOB', 'Douala', 'UTZ, Rainforest', 'Préparation', 'BL00124607'),
('CONT-2024-044', 44, '2024-07-20', '2024-11-20', 20.7, 3700.0, 'CIF', 'Hambourg', 'BIO', 'En attente', 'BL00124608'),
('CONT-2024-045', 45, '2024-07-22', '2024-11-25', 28.9, 3850.0, 'FOB', 'Douala', 'Fairtrade, Organic', 'Livré', 'BL00124609');
GO

-- 5. TABLE Clients (20 enregistrements supplémentaires)
INSERT INTO Clients (TypeClient, NomSociete, Pays, Contact, Email, Telephone, Adresse, Categorie, DatePremierAchat)
VALUES
('Exportateur', 'Cocoa Excellence Ltd', 'Royaume-Uni', 'Mr. Wilson', 'excellence@cocoa.uk', '+44 20 1234567', 'Cocoa Street 101, London', 'Premium', '2023-02-10'),
('Transformateur', 'ChocoCam Industries', 'Cameroun', 'M. Ndongo', 'industry@chococam.cm', '677889911', 'Zone Industrielle, Yaoundé', 'National', '2023-04-15'),
('Négociant', 'Global Cocoa Exchange', 'États-Unis', 'Mr. Taylor', 'exchange@globalcocoa.us', '+1 212 2345678', 'Trade Avenue 202, New York', 'Intermédiaire', '2023-06-20'),
('Exportateur', 'Dutch Cocoa Masters', 'Pays-Bas', 'Mr. De Vries', 'masters@dutchcocoa.nl', '+31 20 3456789', 'Cacaokade 303, Amsterdam', 'Grand compte', '2023-08-25'),
('Transformateur', 'Artisanal Chocolat CM', 'Cameroun', 'Mme Kenmogne', 'artisanal@chocolat.cm', '699112244', 'Marché Central, Douala', 'Local', '2023-10-30'),
('Négociant', 'African Cocoa Network', 'Afrique du Sud', 'Mr. Van Zyl', 'network@africocoa.za', '+27 11 4567890', 'Cocoa Road 404, Johannesburg', 'Intermédiaire', '2024-01-05'),
('Exportateur', 'Swiss Cocoa Premium', 'Suisse', 'Mr. Fischer', 'premium@swisscocoa.ch', '+41 22 5678901', 'Premium Street 505, Zurich', 'Premium', '2024-03-12'),
('Transformateur', 'Cacao du Littoral', 'Cameroun', 'M. Mballa', 'littoral@cacao.cm', '655778899', 'Rue du Port, Limbe', 'National', '2024-05-18'),
('Négociant', 'Euro African Cocoa', 'Belgique', 'Mr. Peeters', 'euroafrica@cocoa.be', '+32 2 6789012', 'Africa Avenue 606, Bruxelles', 'Intermédiaire', '2024-07-24'),
('Exportateur', 'Nordic Cocoa Quality', 'Norvège', 'Mr. Hansen', 'quality@nordiccocoa.no', '+47 22 7890123', 'Quality Street 707, Oslo', 'Premium', '2024-09-30'),
('Transformateur', 'Cacao Artisanal', 'Cameroun', 'Mme Tchinda', '', '677990022', 'Carrefour Marché, Bafoussam', 'Artisanal', '2023-11-15'), -- Email vide
('Négociant', 'Med Cocoa Traders', 'Italie', 'Mr. Bianchi', 'traders@medcocoa.it', '+39 06 8901234', 'Trade Street 808, Rome', 'Intermédiaire', '2024-02-20'),
('Exportateur', 'UK Fine Cocoa', 'Royaume-Uni', 'Mr. Davies', 'fine@ukcocoa.uk', '+44 20 9012345', 'Fine Avenue 909, Manchester', 'Grand compte', '2024-04-26'),
('Transformateur', 'Saveurs Camerounaises', 'Cameroun', 'M. Fotso', 'saveurs@cameroun.cm', '699223355', 'Quartier Gourmet, Yaoundé', 'Local', '2024-06-01'),
('Négociant', 'Cocoa Bridge International', 'Canada', 'Mr. Tremblay', 'bridge@cocoacan.ca', '+1 514 0123456', 'Bridge Road 1010, Montréal', 'Intermédiaire', '2024-08-07'),
('Exportateur', 'Premium Cocoa Germany', 'Allemagne', 'Herr Schulz', 'premium@cocoagermany.de', '+49 30 1234567', 'Premium Allee 1111, Berlin', 'Premium', '2024-10-13'),
('Transformateur', 'Chocolat Traditionnel', 'Cameroun', 'Mme Mbala', 'tradition@chocolat.cm', '655889900', 'Rue Ancestrale, Bamenda', 'Artisanal', '2024-12-19'),
('Négociant', 'World Cocoa Connection', 'Japon', 'Mr. Suzuki', 'connection@worldcocoa.jp', '+81 3 2345678', 'Connection Street 1212, Tokyo', 'Intermédiaire', '2025-02-25'),
('Exportateur', 'Excel', 'France', 'M. Dupont', 'excel@frenchcocoa.fr', '+33 1 3456789', 'Excel Avenue 1313, Paris', 'Grand compte', '2025-05-03'), -- NomSociete trop court
('Transformateur', '', 'Cameroun', 'M. Nji', 'info@local.cm', '677112233', 'Marché Villageois, Kumba', 'Local', '2025-07-09'); -- NomSociete vide
GO

-- 6. TABLE Cooperatives (10 enregistrements supplémentaires)
INSERT INTO Cooperatives (NomCooperative, Region, DateCreation, President, Telephone, Certifications)
VALUES
('Coopérative de Mbanga', 'Littoral', '2023-05-10', 'M. Kylian Mbappe', '677123456', 'Fairtrade, BIO'),
('Coopérative de Loum', 'Littoral', '2023-07-15', 'M. Erling Haaland', '699654321', 'UTZ'),
('Coopérative de Manjo', 'Littoral', '2023-09-20', 'Mme Sarah Mbele', '655789012', 'Rainforest Alliance'),
('Coopérative de Nkondjock', 'Littoral', '2023-11-25', 'M. Jacques Ndongo', '677890123', 'BIO, Organic'),
('Coopérative de Yabassi', 'Littoral', '2024-01-30', 'Mme Alice Fomena', '699901234', 'Fairtrade'),
('Coopérative de Melong', 'Littoral', NULL, 'M. Marc Tchakoute', '655012345', 'UTZ, BIO'), -- DateCreation NULL
('Coopérative de Penja', 'Littoral', '2024-05-15', 'Mme Julie Kwedi', '677123789', 'Rainforest Alliance, Fairtrade'),
('Coopérative de Ndom', 'Littoral', '2024-07-20', 'M. Georges Mballa', '699456012', 'BIO'),
('Coopérative de Dibombari', 'Littoral', '2024-09-25', 'Mme Sophie Dupont', '655789456', 'Organic'),
('Coopérative de Bonalea', 'Littoral', '2024-11-30', 'M. Luc Dupont', '677012789', 'Fairtrade, UTZ');
GO

-- 7. TABLE Parametres (données de référence supplémentaires)
INSERT INTO Parametres (CodeParametre, Categorie, Valeur, Description, DateEffet, DateExpiration)
VALUES
('SEUIL_STOCK_MAX', 'Stock', '5000', 'Seuil maximum stock fèves (kg)', '2024-01-01', NULL),
('TAUX_EXTRACTION_MIN', 'Qualite', '22', 'Taux d''extraction minimum acceptable', '2024-01-01', NULL),
('TAUX_EXTRACTION_MAX', 'Qualite', '28', 'Taux d''extraction maximum idéal', '2024-01-01', NULL),
('PRIX_URGENCE', 'Prix', '750', 'Prix d''achat urgence FCFA/kg', '2024-01-01', '2024-12-31'),
('DELAI_PAIEMENT_MAX', 'Paiement', '30', 'Délai maximum paiement (jours)', '2024-01-01', NULL),
('AGE_PLANTATION_MAX', 'Plantation', '30', 'Âge maximum plantation productive', '2024-01-01', NULL),
('DENSITE_ARBRES_MIN', 'Plantation', '150', 'Densité minimale arbres/hectare', '2024-01-01', NULL),
('DENSITE_ARBRES_MAX', 'Plantation', '250', 'Densité maximale arbres/hectare', '2024-01-01', NULL),
('TEMPS_FERMENTATION', 'Qualite', '5', 'Temps fermentation optimal (jours)', '2024-01-01', NULL),
('TEMPS_SECHAGE', 'Qualite', '7', 'Temps séchage optimal (jours)', '2024-01-01', NULL);
GO