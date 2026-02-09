# CacaoProductionDB

# 🍫 CacaoProductionDB | Architecture de Gestion des Données

## 📊 Vue d'Ensemble
Ce projet implémente une infrastructure complète de **collecte, transformation et analyse** des données pour une entreprise de production de cacao. L'architecture repose sur un pipeline **ETL (Extract, Transform, Load)** robuste qui transforme des données opérationnelles disparates en insights stratégiques via un entrepôt de données et des tableaux de bord BI.

---

## 🏗️ Architecture du Système

### Flux de Données Global
Le flux complet, des sources opérationnelles aux tableaux de bord décisionnels.

![Architecture Globale BI](https://github.com/atchom/CacaoProductionDB/blob/75ea3ac240a84ca59c62fe951d09140c6587bf2c/asssets/images/CacaoPorduction_Architecture.png)

| Composant | Rôle | Technologies Exemple |
|-----------|------|----------------------|
| **Sources de Données** | Collecte des données brutes (SQL Server, CSV) | SQL Server, fichiers plats |
| **Pipeline ETL** | Nettoyage, transformation et structuration | Apache Airflow, Python (Pandas), Talend |
| **Entrepôt de Données** | Stockage structuré pour l'analyse | PostgreSQL, Google BigQuery |
| **Couche Analytique** | Visualisation et reporting | Power BI, Tableau, Metabase |

### Pipeline ETL Détaillé
Schéma technique du processus de transformation des données.

![Schéma Technique ETL](https://github.com/atchom/CacaoProductionDB/blob/3883244fe8d4518b31e78e5a9cd16a84806bad40/asssets/images/Schema%20ETL.png)

## 🔄 Processus ETL - Phase par Phase

### 1️⃣ **Extraction (Collecte)**
**Objectif** : Ingestion fiable des données depuis toutes les sources.
- **Sources SQL Server** : Données transactionnelles structurées
- **Fichiers CSV** : Données des partenaires, logs, rapports externes
- **Domaines couverts** :
### 2️⃣ **Transformation (Valorisation)**
**Objectif** : Transformer les données brutes en informations fiables et exploitables.

| Étape | Processus | Résultat |
|-------|-----------|----------|
| **🧹 Nettoyage** | Correction des incohérences, suppression des doublons, gestion des valeurs manquantes | Données standardisées et fiables |
| **✓ Validation** | Contrôle des règles métier, validation des plages de valeurs, vérification des références | Données conformes aux exigences qualité |
| **✨ Enrichissement** | Jointure avec des référentiels, calcul de nouveaux indicateurs, géocodage | Données contextualisées et augmentées |
| **📊 Agrégation** | Calcul de KPI, consolidation temporelle (quotidienne/mensuelle), création de synthèses | Métriques prêtes à l'analyse |
| **🕰️ Historisation** | Versionnement des données, conservation des états précédents, traçabilité des modifications | Historique complet pour l'analyse temporelle |

### 3️⃣ **Chargement (Modélisation)**
**Objectif** : Structurer les données pour une analyse optimale dans un modèle en étoile classique.

```plaintext
📦 Entrepôt de Données
├── 📈 Tables de Fait (Faits)
│   ├── Fait_Ventes (montant, quantité, marge...)
│   ├── Fait_Production (volume, qualité, rendement...)
│   └── Fait_Export (tonnage, valeur, coûts...)
│
└── 📐 Tables de Dimension
  ├── Dim_Temps (date, semaine, mois, trimestre...)
  ├── Dim_Produit (type, grade, caractéristiques...)
  ├── Dim_Lieu (plantation, région, pays...)
  ├── Dim_Client (segment, région, taille...)
  └── Dim_Fournisseur (catégorie, fiabilité...)
