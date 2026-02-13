-- PostgreSQL Database: CacaoLogistiqueDB

-- 1. TABLE: fournisseurs
CREATE TABLE fournisseurs (
    fournisseur_id SERIAL PRIMARY KEY,
    nom_fournisseur VARCHAR(200) UNIQUE NOT NULL,
    type_fournisseur VARCHAR(50), -- 'Équipement', 'Intrants', 'Emballage', 'Laboratoire'
    contact VARCHAR(100),
    telephone VARCHAR(20),
    email VARCHAR(100),
    adresse TEXT,
    pays VARCHAR(100) DEFAULT 'Cameroun',
    statut VARCHAR(20) DEFAULT 'actif',
    date_creation DATE DEFAULT CURRENT_DATE,
    note_credit DECIMAL(12,2) DEFAULT 0,
    delai_livraison_moyen INTEGER -- en jours
);

-- 2. TABLE: categories_materiel
CREATE TABLE categories_materiel (
    categorie_id SERIAL PRIMARY KEY,
    code_categorie VARCHAR(20) UNIQUE,
    nom_categorie VARCHAR(100) NOT NULL,
    description TEXT,
    responsable_maintenance VARCHAR(100),
    taux_amortissement DECIMAL(5,2) -- pour calcul de dépréciation
);
-- suppression de la colonne responsable_maintenance
ALTER TABLE public.categories_materiel 
DROP COLUMN responsable_maintenance;

-- 3. TABLE: commandes_fournisseurs
CREATE TABLE commandes_fournisseurs (
    commande_id VARCHAR(20) PRIMARY KEY,
    date_commande DATE NOT NULL,
    fournisseur_id INTEGER REFERENCES fournisseurs(fournisseur_id),
    materiel VARCHAR(200) NOT NULL,
    categorie_id INTEGER REFERENCES categories_materiel(categorie_id),
    quantite DECIMAL(10,2) NOT NULL CHECK (quantite > 0),
    unite VARCHAR(20) NOT NULL,
    prix_unitaire DECIMAL(12,2) NOT NULL CHECK (prix_unitaire > 0),
    devise VARCHAR(10) DEFAULT 'FCFA',
    total DECIMAL(12,2) GENERATED ALWAYS AS (quantite * prix_unitaire) STORED,
    mode_livraison VARCHAR(50),
    date_livraison_prevue DATE,
    date_livraison_reelle DATE,
    statut VARCHAR(30) CHECK (statut IN ('Commandé', 'En transit', 'Livré', 'Annulé', 'Retard')),
    bon_commande VARCHAR(50),
    facture_numero VARCHAR(50),
    date_facture DATE,
    date_paiement DATE,
    mode_paiement VARCHAR(30),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. TABLE: inventaire_logistique
CREATE TABLE inventaire_logistique (
    inventaire_id SERIAL PRIMARY KEY,
    produit_code VARCHAR(50) UNIQUE,
    produit_nom VARCHAR(200) NOT NULL,
    categorie_id INTEGER REFERENCES categories_materiel(categorie_id),
    fournisseur_id INTEGER REFERENCES fournisseurs(fournisseur_id),
    quantite_stock DECIMAL(10,2) NOT NULL DEFAULT 0,
    unite VARCHAR(20),
    seuil_min DECIMAL(10,2),
    seuil_max DECIMAL(10,2),
    cout_unitaire DECIMAL(12,2),
    valeur_stock DECIMAL(12,2) GENERATED ALWAYS AS (quantite_stock * cout_unitaire) STORED,
    lieu_stockage VARCHAR(100),
    specifications JSONB, -- Pour caractéristiques techniques
    date_derniere_entree DATE,
    date_derniere_sortie DATE,
    responsable VARCHAR(100),
    statut VARCHAR(20) DEFAULT 'disponible'
);

-- 5. TABLE: mouvements_stock
CREATE TABLE mouvements_stock (
    mouvement_id SERIAL PRIMARY KEY,
    commande_id VARCHAR(20) REFERENCES commandes_fournisseurs(commande_id),
    produit_code VARCHAR(50) REFERENCES inventaire_logistique(produit_code),
    type_mouvement VARCHAR(20) CHECK (type_mouvement IN ('ENTREE', 'SORTIE', 'TRANSFERT', 'AJUSTEMENT')),
    quantite DECIMAL(10,2),
    date_mouvement TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    motif VARCHAR(200),
    utilisateur VARCHAR(100),
    reference_document VARCHAR(50),
    lieu_origine VARCHAR(100),
    lieu_destination VARCHAR(100)
);

-- 6. TABLE: maintenance_equipements
CREATE TABLE maintenance_equipements (
    maintenance_id SERIAL PRIMARY KEY,
    equipement_id INTEGER REFERENCES inventaire_logistique(inventaire_id),
    type_maintenance VARCHAR(30) CHECK (type_maintenance IN ('Préventive', 'Corrective', 'Calibration')),
    date_maintenance DATE NOT NULL,
    cout_maintenance DECIMAL(10,2),
    description_travaux TEXT,
    technicien VARCHAR(100),
    prochaine_maintenance DATE,
    statut VARCHAR(20) DEFAULT 'Planifiée'
);
