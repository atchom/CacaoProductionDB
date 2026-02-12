--1. TABLE fournisseurs – 5 enregistrements
INSERT INTO fournisseurs (nom_fournisseur, type_fournisseur, contact, telephone, email, adresse, pays, statut, note_credit, delai_livraison_moyen) VALUES
('CacaoMatériel SARL', 'Équipement', 'Jean-Pierre Mbarga', '+237 699 123 456', 'contact@cacaomateriel.cm', '123 Rue des Fermes, Yaoundé', 'Cameroun', 'actif', 2500000, 15),
('Agri-Intrants Cameroun', 'Intrants', 'Mme Esther Ngo', '+237 677 789 012', 'esther.ngo@agri-intrants.cm', '45 Avenue du Cacao, Douala', 'Cameroun', 'actif', 1800000, 10),
('Emballages LogBox', 'Emballage', 'Olivier Tchouala', '+237 699 456 789', 'olivier@logbox.cm', '78 Zone Industrielle, Bonabéri', 'Cameroun', 'actif', 950000, 7),
('LaboQualité Cacao', 'Laboratoire', 'Dr. Marie-Claire Abomo', '+237 655 111 333', 'mc.abomo@laboqualite.cm', '12 Cité Scientifique, Yaoundé', 'Cameroun', 'actif', 500000, 5),
('Equipements Agricoles SA', 'Équipement', 'Luc Fouda', '+237 699 888 777', 'l.fouda@equipagri.cm', '99 Boulevard du Paysan, Bafoussam', 'Cameroun', 'actif', 3200000, 20);

--TABLE categories_materiel – 5 enregistrements
INSERT INTO categories_materiel (categorie_id, code_categorie, nom_categorie, description) VALUES
(1, 'CAT-EQP-01', 'Équipement de traitement', 'Égreneuses, séchoirs, broyeurs'),
(2, 'CAT-INT-01', 'Intrants agricoles', 'Engrais, fongicides, insecticides'),
(3, 'CAT-AMB-02', 'Emballage stockage', 'Sacs jute, big bags, palettes'),
(4, 'CAT-LAB-03', 'Équipement laboratoire', 'Hygromètres, analyseurs humidité'),
(5, 'CAT-TRA-04', 'Matériel transport', 'Transpalettes, chariots élévateurs');


--3. TABLE commandes_fournisseurs – 10 enregistrements
-- 3. TABLE commandes_fournisseurs – 10 enregistrements
INSERT INTO commandes_fournisseurs (
    commande_id, date_commande, fournisseur_id, materiel, categorie_id,
    quantite, unite, prix_unitaire, devise, mode_livraison,
    date_livraison_prevue, date_livraison_reelle, statut,
    bon_commande, facture_numero, date_facture, date_paiement, mode_paiement, notes
) VALUES
-- Fournisseur 6 (CacaoMatériel SARL) - Catégorie 1: Équipement de traitement
('CMD-2025-001', '2025-06-01', 6, 'Égreneuse manuelle modèle EGM-200', 1, 5, 'unité', 450000, 'FCFA', 'Transport routier', '2025-06-15', '2025-06-14', 'Livré', 'BC-2025-045', 'FAC-2025-101', '2025-06-12', '2025-06-25', 'Virement', 'Livraison complète'),
('CMD-2025-007', '2025-06-18', 6, 'Séchoir solaire amélioré', 1, 2, 'unité', 890000, 'FCFA', 'Camion plateau', '2025-07-10', '2025-07-08', 'Livré', 'BC-2025-070', 'FAC-2025-140', '2025-07-01', '2025-07-15', 'Virement', 'Fabrication terminée'),

-- Fournisseur 7 (Agri-Intrants Cameroun) - Catégorie 2: Intrants agricoles
('CMD-2025-002', '2025-06-03', 7, 'Engrais NPK cacao 15-15-15', 2, 2000, 'kg', 600, 'FCFA', 'Camion plateau', '2025-06-18', '2025-06-20', 'Livré', 'BC-2025-048', 'FAC-2025-112', '2025-06-15', '2025-06-28', 'Chèque', 'Sac de 50kg'),
('CMD-2025-006', '2025-06-14', 7, 'Fongicide Cupravit', 2, 500, 'litre', 3500, 'FCFA', 'Camion frigorifique', '2025-06-28', '2025-06-27', 'Livré', 'BC-2025-062', 'FAC-2025-135', '2025-06-20', '2025-07-05', 'Virement', 'Produit sensible'),

-- Fournisseur 8 (Emballages LogBox) - Catégorie 3: Emballage stockage
('CMD-2025-003', '2025-06-05', 8, 'Sacs jute 60kg avec valve', 3, 5000, 'unité', 250, 'FCFA', 'Camion bâché', '2025-06-20', '2025-06-22', 'Livré', 'BC-2025-052', 'FAC-2025-118', '2025-06-17', '2025-07-01', 'Virement', 'Qualité standard'),
('CMD-2025-008', '2025-06-20', 8, 'Big bags 1.5T', 3, 100, 'unité', 1200, 'FCFA', 'Camion bâché', '2025-07-05', '2025-07-03', 'Livré', 'BC-2025-073', 'FAC-2025-145', '2025-06-28', '2025-07-12', 'Chèque', 'Avec renforts'),

-- Fournisseur 9 (LaboQualité Cacao) - Catégorie 4: Équipement laboratoire
('CMD-2025-004', '2025-06-10', 9, 'Hygromètre numérique', 4, 3, 'unité', 120000, 'FCFA', 'Express', '2025-06-17', '2025-06-16', 'Livré', 'BC-2025-055', 'FAC-2025-125', '2025-06-14', '2025-06-30', 'Carte bancaire', 'Calibration incluse'),
('CMD-2025-009', '2025-06-22', 9, 'Analyseur humidité grains', 4, 1, 'unité', 450000, 'FCFA', 'Express', '2025-06-30', '2025-06-29', 'Livré', 'BC-2025-075', 'FAC-2025-142', '2025-06-25', '2025-07-08', 'Virement', 'Certificat inclus'),

-- Fournisseur 10 (Equipements Agricoles...) - Catégorie 5: Matériel transport
('CMD-2025-005', '2025-06-12', 10, 'Chariot élévateur manuel 2.5T', 5, 2, 'unité', 650000, 'FCFA', 'Transport spécial', '2025-07-01', NULL, 'En transit', 'BC-2025-060', NULL, NULL, NULL, NULL, 'En attente facture'),
('CMD-2025-010', '2025-06-25', 10, 'Transpalette électrique', 5, 1, 'unité', 1250000, 'FCFA', 'Transport spécial', '2025-07-15', NULL, 'Commandé', 'BC-2025-080', NULL, NULL, NULL, NULL, 'Batterie lithium');

-- 4. TABLE inventaire_logistique – 10 enregistrements (fournisseur_id corrigés)
INSERT INTO inventaire_logistique (
    produit_code, produit_nom, categorie_id, fournisseur_id,
    quantite_stock, unite, seuil_min, seuil_max, cout_unitaire,
    lieu_stockage, specifications, date_derniere_entree, date_derniere_sortie, responsable, statut
) VALUES
('EGR-200-01', 'Égreneuse manuelle EGM-200', 1, 6, 3, 'unité', 2, 8, 445000, 'Entrepôt A1', '{"puissance": "5CV", "capacite": "200kg/h"}', '2025-06-14', '2025-06-20', 'Kouamé David', 'disponible'),
('ENG-NPK-01', 'Engrais NPK 15-15-15', 2, 7, 1250, 'kg', 500, 3000, 580, 'Magasin intrants', '{"conditionnement": "sac 50kg"}', '2025-06-20', '2025-06-25', 'Ngo B. Sylvie', 'disponible'),
('SAC-J60-01', 'Sac jute 60kg valve', 3, 8, 4200, 'unité', 1000, 6000, 240, 'Zone emballage', '{"matiere": "jute naturel"}', '2025-06-22', '2025-06-27', 'Tchinda Paul', 'disponible'),
('HYG-NUM-01', 'Hygromètre numérique', 4, 9, 2, 'unité', 1, 5, 118000, 'Laboratoire', '{"precision": "±0.5%"}', '2025-06-16', '2025-06-18', 'Dr. Abomo', 'disponible'),
('CH-MAN-01', 'Chariot manuel 2.5T', 5, 10, 1, 'unité', 1, 3, 645000, 'Quai chargement', '{"levage": "hydraulique"}', '2025-06-10', '2025-06-24', 'Mbarga Luc', 'disponible'),
('FONG-CU-01', 'Fongicide Cupravit', 2, 7, 480, 'litre', 100, 800, 3450, 'Magasin phytosanitaire', '{"type": "cuivrique"}', '2025-06-18', '2025-06-26', 'Mvondo Jean', 'disponible'),
('SEC-SOL-01', 'Séchoir solaire 10m²', 1, 6, 1, 'unité', 1, 3, 885000, 'Aire séchage', '{"bache": "polyethylene UV"}', '2025-06-05', NULL, 'Atangana Léon', 'disponible'),
('BIG-15-01', 'Big bag 1.5T', 3, 8, 95, 'unité', 20, 200, 1150, 'Stock vrac', '{"anneaux": "4 points"}', '2025-06-19', '2025-06-28', 'Fotso Célestin', 'disponible'),
('ANA-HUM-01', 'Analyseur humidité', 4, 9, 1, 'unité', 1, 2, 445000, 'Laboratoire', '{"marque": "Pfeuffer"}', '2025-06-29', NULL, 'Dr. Abomo', 'disponible'),
('TRANS-ELEC', 'Transpalette électrique', 5, 10, 0, 'unité', 1, 2, 1240000, 'Entrepôt B', '{"batterie": "Li-ion 24V"}', NULL, NULL, 'Mbarga Luc', 'en commande');

--Les mouvements avec commande_id qui commencent par 'CMD-2025-00X' existent bien (ce sont vos commandes fournisseurs)

--Les mouvements avec commande_id qui commencent par 'MVT-2025-20X' ne sont pas des commandes fournisseurs - ils devraient avoir commande_id = NULL car ce sont des mouvements internes (sorties, affectations)

--Solution : Mettre NULL pour les mouvements qui ne sont pas liés à une réception de commande fournisseur

--5. TABLE mouvements_stock – 10 enregistrements
INSERT INTO mouvements_stock (commande_id, produit_code, type_mouvement, quantite, motif, utilisateur, reference_document, lieu_origine, lieu_destination) VALUES
-- Mouvements d'ENTREE liés aux commandes fournisseurs (commande_id NON NULL)
('CMD-2025-001', 'EGR-200-01', 'ENTREE', 5, 'Réception commande', 'Kouamé David', 'BL-2025-101', 'Fournisseur', 'Entrepôt A1'),
('CMD-2025-002', 'ENG-NPK-01', 'ENTREE', 2000, 'Réception engrais', 'Ngo B. Sylvie', 'BL-2025-108', 'Fournisseur', 'Magasin intrants'),
('CMD-2025-003', 'SAC-J60-01', 'ENTREE', 5000, 'Réception sacs', 'Tchinda Paul', 'BL-2025-112', 'Fournisseur', 'Zone emballage'),
('CMD-2025-004', 'HYG-NUM-01', 'ENTREE', 3, 'Réception hygromètres', 'Dr. Abomo', 'BL-2025-115', 'Fournisseur', 'Laboratoire'),
('CMD-2025-005', 'CH-MAN-01', 'ENTREE', 2, 'Réception chariots', 'Mbarga Luc', 'BL-2025-118', 'Fournisseur', 'Quai chargement'),

-- Mouvements de SORTIE INTERNES (commande_id = NULL car pas liés à une commande fournisseur)
(NULL, 'EGR-200-01', 'SORTIE', 2, 'Affectation équipe séchage', 'Kouamé David', 'BS-2025-045', 'Entrepôt A1', 'Atelier'),
(NULL, 'ENG-NPK-01', 'SORTIE', 750, 'Distribution plantations', 'Ngo B. Sylvie', 'BS-2025-048', 'Magasin intrants', 'Coopérative Nkolmvolan'),
(NULL, 'SAC-J60-01', 'SORTIE', 800, 'Conditionnement récolte', 'Tchinda Paul', 'BS-2025-052', 'Zone emballage', 'Quai expédition'),
(NULL, 'FONG-CU-01', 'SORTIE', 20, 'Traitement phytosanitaire', 'Mvondo Jean', 'BS-2025-055', 'Magasin phytosanitaire', 'Plantation Mvog-Mbi'),
(NULL, 'BIG-15-01', 'SORTIE', 5, 'Préparation export', 'Fotso Célestin', 'BS-2025-060', 'Stock vrac', 'Zone transit');

--6. TABLE maintenance_equipements – 5 enregistrements
INSERT INTO maintenance_equipements 
    (equipement_id, type_maintenance, date_maintenance, cout_maintenance, 
     description_travaux, technicien, prochaine_maintenance, statut)
VALUES
    -- Égreneuse manuelle (ID existant = 2 par exemple)
    (2, 'Préventive',   '2025-05-10', 45000, 'Nettoyage et graissage égreneuse', 'Techni-Maintenance SARL', '2025-08-10', 'Effectuée'),
    (2, 'Corrective',   '2025-06-15', 12500, 'Remplacement courroie',            'Ets Fokou',               '2025-09-15', 'Effectuée'),

    -- Séchoir solaire (ID existant = 5)
    (5, 'Préventive',   '2025-06-20', 30000, 'Vérification bâche séchoir',       'Service interne',         '2025-09-20', 'Effectuée'),

    -- Hygromètre numérique (ID existant = 7)
    (7, 'Calibration',  '2025-06-18', 0,     'Calibration hygromètre',           'Dr. Abomo',               '2025-09-18', 'Effectuée'),

    -- Transpalette électrique (ID existant = 9)
    (9, 'Préventive',   '2025-07-01', 15000, 'Nettoyage transpalette',           'Mbarga Luc',              '2025-10-01', 'Planifiée');
