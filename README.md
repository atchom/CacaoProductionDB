# CacaoProductionDB
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Architecture ETL - Production de Cacao</title>
<div align="left">
  <img src="https://github.com/atchom/CacaoProductionDB/blob/75ea3ac240a84ca59c62fe951d09140c6587bf2c/asssets/images/CacaoPorduction_Architecture.png" alt="Bannière du projet" width="500" heigt="500" />
</div>
<h2>Schema ETL de la production de Cacao</h2>
 <img src="https://github.com/atchom/CacaoProductionDB/blob/3883244fe8d4518b31e78e5a9cd16a84806bad40/asssets/images/Schema%20ETL.png" alt="Bannière du projet" width="500" heigt="500" />

<style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
        }
        .presentation-container {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        .header {
            border-bottom: 3px solid #8B4513;
            padding-bottom: 15px;
            margin-bottom: 25px;
        }
        h1 {
            color: #5D4037;
            font-size: 28px;
            margin-bottom: 10px;
        }
        .subtitle {
            color: #8B4513;
            font-style: italic;
            margin-bottom: 5px;
        }
        .etl-section {
            margin-bottom: 25px;
            padding: 20px;
            border-left: 4px solid;
            background-color: #f5f5f5;
            border-radius: 0 8px 8px 0;
        }
        .extraction {
            border-left-color: #4CAF50;
        }
        .transformation {
            border-left-color: #2196F3;
        }
        .warehouse {
            border-left-color: #FF9800;
        }
        .conclusion {
            border-left-color: #9C27B0;
        }
        h2 {
            color: #5D4037;
            font-size: 22px;
            margin-top: 0;
            margin-bottom: 10px;
        }
        h3 {
            color: #5D4037;
            font-size: 18px;
            margin-bottom: 8px;
        }
        .highlight {
            background-color: #FFF3E0;
            padding: 15px;
            border-radius: 6px;
            margin: 20px 0;
            border: 1px solid #FFCC80;
        }
        .keywords {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 15px;
        }
        .keyword {
            background-color: #8B4513;
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 14px;
        }
        .footer {
            margin-top: 30px;
            text-align: center;
            font-size: 14px;
            color: #777;
            border-top: 1px solid #eee;
            padding-top: 15px;
        }
    </style>
</head>
<body>
    <div class="presentation-container">
        <div class="header">
            <h1>Architecture ETL de la Production de Cacao</h1>
            <p class="subtitle">Schéma d'intégration et de valorisation des données opérationnelles</p>
        </div>

        <div class="highlight">
            Le schéma ETL de cette entreprise de production de cacao illustre une architecture moderne et structurée pour la gestion des données opérationnelles et stratégiques. Il met en avant l'intégration de sources de données variées, telles que les bases SQL Server et les fichiers CSV, permettant de centraliser l'ensemble des informations relatives à la chaîne de production, de la plantation à la vente.
        </div>

        <div class="etl-section extraction">
            <h2>📥 Extraction</h2>
            <p>La partie <strong>Extraction</strong> assure la collecte automatisée et sécurisée des données issues des différents systèmes et fichiers, garantissant :</p>
            <ul>
                <li>La fraîcheur des informations</li>
                <li>La diversité des sources</li>
                <li>L'exhaustivité des données collectées</li>
            </ul>
        </div>

        <div class="etl-section transformation">
            <h2>⚙️ Transformation</h2>
            <p>La <strong>Transformation</strong> repose sur des processus rigoureux :</p>
            
            <h3>Nettoyage & Validation</h3>
            <p>Assurance de la qualité et de la cohérence des données.</p>
            
            <h3>Enrichissement & Agrégation</h3>
            <p>Amélioration de la pertinence et génération d'indicateurs clés pour :</p>
            <ul>
                <li>Le pilotage de la production</li>
                <li>L'optimisation des performances</li>
                <li>La prise de décision éclairée</li>
            </ul>
        </div>

        <div class="etl-section warehouse">
            <h2>📊 Entrepôt de Données</h2>
            <p>L'<strong>entrepôt de données</strong> constitue le socle analytique de l'entreprise :</p>
            <ul>
                <li>Centralisation des données structurées et historisées</li>
                <li>Organisation en tables de faits et de dimensions</li>
                <li>Accès facilité pour les équipes décisionnelles</li>
                <li>Garantie de traçabilité et conformité</li>
            </ul>
        </div>

        <div class="etl-section conclusion">
            <h2>🎯 Valeur Stratégique</h2>
            <p>Ce schéma ETL offre une base solide pour :</p>
            <ul>
                <li>Le développement d'outils de <strong>Business Intelligence</strong></li>
                <li>Le <strong>reporting avancé</strong> et analytique</li>
                <li>La <strong>prise de décision stratégique</strong></li>
                <li>La <strong>digitalisation</strong> des processus métiers</li>
                <li>L'amélioration de la <strong>compétitivité</strong> dans le secteur du cacao</li>
            </ul>
        </div>

        <div class="keywords">
            <span class="keyword">ETL</span>
            <span class="keyword">Data Warehouse</span>
            <span class="keyword">Business Intelligence</span>
            <span class="keyword">Transformation</span>
            <span class="keyword">Analytics</span>
            <span class="keyword">Cacao</span>
            <span class="keyword">Production</span>
            <span class="keyword">Data Quality</span>
        </div>

        <div class="footer">
            Architecture ETL | Production de Cacao | Présentation Professionnelle
        </div>
    </div>
