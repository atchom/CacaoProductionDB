# CacaoProductionDB

# 🍫 CacaoProductionDB | Architecture de Gestion des Données Microsoft

## 📊 Vue d'Ensemble
Ce projet implémente une infrastructure de **collecte, transformation et analyse** des données pour une entreprise de production de cacao. L'architecture repose sur un pipeline **ETL** utilisant la stack **Microsoft SQL Server (SSIS, SSAS)** et **Power BI** pour transformer des données opérationnelles en insights stratégiques.

---

## 🏗️ Architecture du Système Microsoft

### Flux de Données Global
L'architecture complète, des sources opérationnelles aux tableaux de bord Power BI.

![Architecture Globale BI](https://github.com/atchom/CacaoProductionDB/blob/75ea3ac240a84ca59c62fe951d09140c6587bf2c/asssets/images/CacaoPorduction_Architecture.png)

| Composant | Rôle dans la Stack Microsoft | Outils & Technologies |
|-----------|-----------------------------|------------------------|
| **Sources de Données** | Fournit les données brutes des systèmes opérationnels. | **SQL Server** (bases transactionnelles), **Fichiers CSV** |
| **Pipeline ETL** | Orquestre le nettoyage, la transformation et le chargement des données. | **SQL Server Integration Services (SSIS)** |
| **Entrepôt & Modèle Analytique** | Stocke et structure les données pour une analyse optimale. | **SQL Server** (Entrepôt), **SQL Server Analysis Services (SSAS)** |
| **Couche de Visualisation** | Crée les rapports interactifs et les tableaux de bord métier. | **Power BI** (Desktop & Service) |

### Pipeline ETL Détaillé
Le schéma technique détaillant les étapes de transformation des données.

![Schéma Technique ETL](https://github.com/atchom/CacaoProductionDB/blob/3883244fe8d4518b31e78e5a9cd16a84806bad40/asssets/images/Schema%20ETL.png)

---

## 🔄 Processus ETL avec SSIS, SSAS & Power BI

### 1️⃣ **Extraction (Collecte)**
**Objectif** : Ingérer de manière fiable les données depuis SQL Server et les fichiers CSV via des **packages SSIS**.
- **Connexion SQL Server** : Utilisation de sources OLE DB ou ADO.NET dans un **Data Flow Task**.
- **Lecture des fichiers CSV** : Utilisation du composant **Flat File Source**.
- **Domaines de données couverts** :
- 
### 2️⃣ **Transformation (Valorisation)**
**Objectif** : Nettoyer, valider et enrichir les données dans le flux de données SSIS (**Data Flow**).

| Étape | Composants SSIS Clés | Description |
|-------|---------------------|-------------|
| **🧹 Nettoyage** | `Conditional Split`, `Derived Column`, `Data Conversion` | Standardisation des formats, gestion des valeurs nulles. |
| **✓ Validation** | `Lookup`, `Row Count`, Redirection des lignes d'erreur | Vérification de l'intégrité référentielle et des règles métier. |
| **✨ Enrichissement** | `Merge Join`, `Lookup` | Ajout d'informations à partir de tables de référence. |
| **📊 Agrégation** | `Aggregate`, `Sort` | Pré-calcul d'indicateurs et consolidation. |
| **🕰️ Historisation** | Logique de flux (UPSERT) | Gestion des inserts et mises à jour pour tracer l'historique. |

### 3️⃣ **Chargement et Modélisation**
**Objectif** : Charger les données transformées dans l'entrepôt SQL Server, puis les modéliser dans SSAS.

#### **Chargement (Load) vers SQL Server**
- **Destination** : Une base SQL Server dédiée fonctionnant comme l'**entrepôt de données**.
- **Méthode** : Utilisation du composant **OLE DB Destination** dans SSIS. Mise en œuvre possible de chargement **incrémental** pour l'efficacité.

#### **Modélisation avec SQL Server Analysis Services (SSAS)**
Les données de l'entrepôt sont modélisées dans **SSAS** pour des performances analytiques optimales.
- **Type de modèle** : Modèle **Tabulaire** (recommandé pour sa simplicité et sa performance avec Power BI).
- **Structure** : Création d'un **schéma en étoile** avec des **tables de faits** (mesures) et des **tables de dimensions** (descripteurs).
- **Langage** : Création de mesures avec **DAX** (Data Analysis Expressions), par exemple :
```DAX
Revenu Total = SUM(Fait_Ventes[Montant])
Taux Grade A = DIVIDE([Qte Grade A], [Qte Totale], 0)
