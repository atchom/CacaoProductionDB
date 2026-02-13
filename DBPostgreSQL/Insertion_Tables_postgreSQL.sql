-- ============================================
-- INSERTION DES DONNÉES - VERSION CORRIGÉE
-- ============================================

-- 1. FOURNISSEURS (5 enregistrements)
INSERT INTO fournisseurs (nom_fournisseur, type_fournisseur, contact, telephone, email, adresse, pays, statut, note_credit, delai_livraison_moyen) VALUES
('CacaoMatériel SARL', 'Équipement', 'Jean-Pierre Mbarga', '+237 699 123 456', 'contact@cacaomateriel.cm', '123 Rue des Fermes, Yaoundé', 'Cameroun', 'actif', 2500000, 15),
('Agri-Intrants Cameroun', 'Intrants', 'Mme Esther Ngo', '+237 677 789 012', 'esther.ngo@agri-intrants.cm', '45 Avenue du Cacao, Douala', 'Cameroun', 'actif', 1800000, 10),
('Emballages LogBox', 'Emballage', 'Olivier Tchouala', '+237 699 456 789', 'olivier@logbox.cm', '78 Zone Industrielle, Bonabéri', 'Cameroun', 'actif', 950000, 7),
('LaboQualité Cacao', 'Laboratoire', 'Dr. Marie-Claire Abomo', '+237 655 111 333', 'mc.abomo@laboqualite.cm', '12 Cité Scientifique, Yaoundé', 'Cameroun', 'actif', 500000, 5),
('Equipements Agricoles SA', 'Équipement', 'Luc Fouda', '+237 699 888 777', 'l.fouda@equipagri.cm', '99 Boulevard du Paysan, Bafoussam', 'Cameroun', 'actif', 3200000, 20);

-- 2. CATEGORIES_MATERIEL (CORRIGÉE - SANS colonnes inutiles)
INSERT INTO categories_materiel (code_categorie, nom_categorie, description) VALUES
('CAT-EQP-01', 'Équipement de traitement', 'Égreneuses, séchoirs, broyeurs'),
('CAT-INT-01', 'Intrants agricoles', 'Engrais, fongicides, insecticides'),
('CAT-AMB-02', 'Emballage stockage', 'Sacs jute, big bags, palettes'),
('CAT-LAB-03', 'Équipement laboratoire', 'Hygromètres, analyseurs humidité'),
('CAT-TRA-04', 'Matériel transport', 'Transpalettes, chariots élévateurs');

-- 3. COMMANDES_FOURNISSEURS (10 enregistrements)
INSERT INTO commandes_fournisseurs (
    commande_id, date_commande, fournisseur_id, materiel, categorie_id,
    quantite, unite, prix_unitaire, devise, mode_livraison,
    date_livraison_prevue, date_livraison_reelle, statut,
    bon_commande, facture_numero, date_facture, date_paiement, mode_paiement, notes
) VALUES
-- Fournisseur 1 (CacaoMatériel SARL)
('CMD-2025-001', '2025-06-01', 1, 'Égreneuse manuelle modèle EGM-200', 1, 5, 'unité', 450000, 'FCFA', 'Transport routier', '2025-06-15', '2025-06-14', 'Livré', 'BC-2025-045', 'FAC-2025-101', '2025-06-12', '2025-06-25', 'Virement', 'Livraison complète'),
('CMD-2025-007', '2025-06-18', 1, 'Séchoir solaire amélioré', 1, 2, 'unité', 890000, 'FCFA', 'Camion plateau', '2025-07-10', '2025-07-08', 'Livré', 'BC-2025-070', 'FAC-2025-140', '2025-07-01', '2025-07-15', 'Virement', 'Fabrication terminée'),
-- Fournisseur 2 (Agri-Intrants Cameroun)
('CMD-2025-002', '2025-06-03', 2, 'Engrais NPK cacao 15-15-15', 2, 2000, 'kg', 600, 'FCFA', 'Camion plateau', '2025-06-18', '2025-06-20', 'Livré', 'BC-2025-048', 'FAC-2025-112', '2025-06-15', '2025-06-28', 'Chèque', 'Sac de 50kg'),
('CMD-2025-006', '2025-06-14', 2, 'Fongicide Cupravit', 2, 500, 'litre', 3500, 'FCFA', 'Camion frigorifique', '2025-06-28', '2025-06-27', 'Livré', 'BC-2025-062', 'FAC-2025-135', '2025-06-20', '2025-07-05', 'Virement', 'Produit sensible'),
-- Fournisseur 3 (Emballages LogBox)
('CMD-2025-003', '2025-06-05', 3, 'Sacs jute 60kg avec valve', 3, 5000, 'unité', 250, 'FCFA', 'Camion bâché', '2025-06-20', '2025-06-22', 'Livré', 'BC-2025-052', 'FAC-2025-118', '2025-06-17', '2025-07-01', 'Virement', 'Qualité standard'),
('CMD-2025-008', '2025-06-20', 3, 'Big bags 1.5T', 3, 100, 'unité', 1200, 'FCFA', 'Camion bâché', '2025-07-05', '2025-07-03', 'Livré', 'BC-2025-073', 'FAC-2025-145', '2025-06-28', '2025-07-12', 'Chèque', 'Avec renforts'),
-- Fournisseur 4 (LaboQualité Cacao)
('CMD-2025-004', '2025-06-10', 4, 'Hygromètre numérique', 4, 3, 'unité', 120000, 'FCFA', 'Express', '2025-06-17', '2025-06-16', 'Livré', 'BC-2025-055', 'FAC-2025-125', '2025-06-14', '2025-06-30', 'Carte bancaire', 'Calibration incluse'),
('CMD-2025-009', '2025-06-22', 4, 'Analyseur humidité grains', 4, 1, 'unité', 450000, 'FCFA', 'Express', '2025-06-30', '2025-06-29', 'Livré', 'BC-2025-075', 'FAC-2025-142', '2025-06-25', '2025-07-08', 'Virement', 'Certificat inclus'),
-- Fournisseur 5 (Equipements Agricoles SA)
('CMD-2025-005', '2025-06-12', 5, 'Chariot élévateur manuel 2.5T', 5, 2, 'unité', 650000, 'FCFA', 'Transport spécial', '2025-07-01', NULL, 'En transit', 'BC-2025-060', NULL, NULL, NULL, NULL, 'En attente facture'),
('CMD-2025-010', '2025-06-25', 5, 'Transpalette électrique', 5, 1, 'unité', 1250000, 'FCFA', 'Transport spécial', '2025-07-15', NULL, 'Commandé', 'BC-2025-080', NULL, NULL, NULL, NULL, 'Batterie lithium');

-- 4. INVENTAIRE_LOGISTIQUE (AVEC données d'amortissement)
INSERT INTO inventaire_logistique (
    produit_code, produit_nom, categorie_id, fournisseur_id,
    quantite_stock, unite, seuil_min, seuil_max, cout_unitaire,
    lieu_stockage, specifications,
    -- NOUVELLES COLONNES D'AMORTISSEMENT
    date_acquisition, valeur_achat, duree_amortissement_ans, methode_amortissement, valeur_residuelle,
    -- FIN
    date_derniere_entree, date_derniere_sortie, responsable, statut
) VALUES
('EGR-200-01', 'Égreneuse manuelle EGM-200', 1, 1, 3, 'unité', 2, 8, 445000,
 'Entrepôt A1', '{"puissance": "5CV", "capacite": "200kg/h"}',
 '2024-01-15', 2000000, 8, 'Linéaire', 200000,
 '2025-06-14', '2025-06-20', 'Kouamé David', 'disponible'),

('SEC-SOL-01', 'Séchoir solaire 10m²', 1, 1, 1, 'unité', 1, 3, 885000,
 'Aire séchage', '{"bache": "polyethylene UV"}',
 '2024-03-20', 1500000, 5, 'Linéaire', 150000,
 '2025-06-05', NULL, 'Atangana Léon', 'disponible'),

('ENG-NPK-01', 'Engrais NPK 15-15-15', 2, 2, 1250, 'kg', 500, 3000, 580,
 'Magasin intrants', '{"conditionnement": "sac 50kg"}',
 NULL, NULL, NULL, NULL, NULL,
 '2025-06-20', '2025-06-25', 'Ngo B. Sylvie', 'disponible'),

('FONG-CU-01', 'Fongicide Cupravit', 2, 2, 480, 'litre', 100, 800, 3450,
 'Magasin phytosanitaire', '{"type": "cuivrique"}',
 NULL, NULL, NULL, NULL, NULL,
 '2025-06-18', '2025-06-26', 'Mvondo Jean', 'disponible'),

('SAC-J60-01', 'Sac jute 60kg valve', 3, 3, 4200, 'unité', 1000, 6000, 240,
 'Zone emballage', '{"matiere": "jute naturel"}',
 NULL, NULL, NULL, NULL, NULL,
 '2025-06-22', '2025-06-27', 'Tchinda Paul', 'disponible'),

('BIG-15-01', 'Big bag 1.5T', 3, 3, 95, 'unité', 20, 200, 1150,
 'Stock vrac', '{"anneaux": "4 points"}',
 NULL, NULL, NULL, NULL, NULL,
 '2025-06-19', '2025-06-28', 'Fotso Célestin', 'disponible'),

('HYG-NUM-01', 'Hygromètre numérique', 4, 4, 2, 'unité', 1, 5, 118000,
 'Laboratoire', '{"precision": "±0.5%"}',
 '2024-09-10', 360000, 3, 'Linéaire', 36000,
 '2025-06-16', '2025-06-18', 'Dr. Abomo', 'disponible'),

('ANA-HUM-01', 'Analyseur humidité', 4, 4, 1, 'unité', 1, 2, 445000,
 'Laboratoire', '{"marque": "Pfeuffer"}',
 '2024-11-05', 1350000, 5, 'Linéaire', 135000,
 '2025-06-29', NULL, 'Dr. Abomo', 'disponible'),

('CH-MAN-01', 'Chariot manuel 2.5T', 5, 5, 1, 'unité', 1, 3, 645000,
 'Quai chargement', '{"levage": "hydraulique"}',
 '2024-05-12', 1300000, 10, 'Linéaire', 130000,
 '2025-06-10', '2025-06-24', 'Mbarga Luc', 'disponible'),

('TRANS-ELEC', 'Transpalette électrique', 5, 5, 0, 'unité', 1, 2, 1240000,
 'Entrepôt B', '{"batterie": "Li-ion 24V"}',
 '2025-07-20', 2500000, 8, 'Linéaire', 250000,
 NULL, NULL, 'Mbarga Luc', 'en commande');

-- 5. MOUVEMENTS_STOCK
INSERT INTO mouvements_stock (commande_id, produit_code, type_mouvement, quantite, motif, utilisateur, reference_document, lieu_origine, lieu_destination) VALUES
-- Entrées (commandes fournisseurs)
('CMD-2025-001', 'EGR-200-01', 'ENTREE', 5, 'Réception commande', 'Kouamé David', 'BL-2025-101', 'Fournisseur', 'Entrepôt A1'),
('CMD-2025-002', 'ENG-NPK-01', 'ENTREE', 2000, 'Réception engrais', 'Ngo B. Sylvie', 'BL-2025-108', 'Fournisseur', 'Magasin intrants'),
('CMD-2025-003', 'SAC-J60-01', 'ENTREE', 5000, 'Réception sacs', 'Tchinda Paul', 'BL-2025-112', 'Fournisseur', 'Zone emballage'),
('CMD-2025-004', 'HYG-NUM-01', 'ENTREE', 3, 'Réception hygromètres', 'Dr. Abomo', 'BL-2025-115', 'Fournisseur', 'Laboratoire'),
('CMD-2025-005', 'CH-MAN-01', 'ENTREE', 2, 'Réception chariots', 'Mbarga Luc', 'BL-2025-118', 'Fournisseur', 'Quai chargement'),
-- Sorties (internes)
(NULL, 'EGR-200-01', 'SORTIE', 2, 'Affectation équipe séchage', 'Kouamé David', 'BS-2025-045', 'Entrepôt A1', 'Atelier'),
(NULL, 'ENG-NPK-01', 'SORTIE', 750, 'Distribution plantations', 'Ngo B. Sylvie', 'BS-2025-048', 'Magasin intrants', 'Coopérative Nkolmvolan'),
(NULL, 'SAC-J60-01', 'SORTIE', 800, 'Conditionnement récolte', 'Tchinda Paul', 'BS-2025-052', 'Zone emballage', 'Quai expédition'),
(NULL, 'FONG-CU-01', 'SORTIE', 20, 'Traitement phytosanitaire', 'Mvondo Jean', 'BS-2025-055', 'Magasin phytosanitaire', 'Plantation Mvog-Mbi'),
(NULL, 'BIG-15-01', 'SORTIE', 5, 'Préparation export', 'Fotso Célestin', 'BS-2025-060', 'Stock vrac', 'Zone transit');

-- 6. MAINTENANCE_EQUIPEMENTS (AVEC priorité et durée)
INSERT INTO maintenance_equipements (
    equipement_id, type_maintenance, date_maintenance, cout_maintenance,
    description_travaux, technicien, prochaine_maintenance, statut,
    priorite, pieces_remplacees, duree_intervention_heures
) VALUES
-- Égreneuse manuelle (ID 1)
(1, 'Préventive', '2025-05-10', 45000, 'Nettoyage et graissage égreneuse', 
 'Techni-Maintenance SARL', '2025-08-10', 'Effectuée', 'Normale', 'Graisse, filtres', 3.5),
(1, 'Corrective', '2025-06-15', 12500, 'Remplacement courroie', 
 'Ets Fokou', '2025-09-15', 'Effectuée', 'Haute', 'Courroie trapézoïdale', 1.5),

-- Séchoir solaire (ID 2)
(2, 'Préventive', '2025-06-20', 30000, 'Vérification bâche séchoir', 
 'Service interne', '2025-09-20', 'Effectuée', 'Normale', 'Kit réparation bâche', 2.0),

-- Hygromètre numérique (ID 7)
(7, 'Calibration', '2025-06-18', 0, 'Calibration hygromètre', 
 'Dr. Abomo', '2025-09-18', 'Effectuée', 'Basse', NULL, 0.75),

-- Transpalette électrique (ID 10 - en commande mais maintenance planifiée)
(10, 'Préventive', '2025-07-01', 15000, 'Nettoyage transpalette', 
 'Mbarga Luc', '2025-10-01', 'Planifiée', 'Normale', NULL, 1.0);
