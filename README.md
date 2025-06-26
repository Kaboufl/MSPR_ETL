### 1. Introduction

Cet ETL a pour objectif d’extraire les données brutes des épidémies de COVID-19 et de la fièvre du singe (Monkey Pox), de les transformer pour assurer la conformité avec le modèle de données établi pour l’API, et enfin de les charger dans les tables pandemic stats, locations, diseases et sources pour permettre l’analyse de l’évolution de ces épidémies via des tableaux de bord et de rendre publiquement accessible les données via une API.

### 2. Description Générale

Contexte Métier : Nous, l’entreprise AnalyzeIT, avons été missionnés par l’OMS en tant que prestataire de service pour répondre à un besoin de création d’une solution de traitement des données de pandémies afin de donner aux chercheurs une plateforme sur laquelle explorer les données de différentes épidémies afin de pouvoir mieux les étudier.

Dépendances : Cet ETL ne prend pas en charge la mise en place du modèle de données dans la base de données, le modèle doit déjà être mis en place et disponible pour le bon fonctionnement de l’ETL, se référer à la documentation de l’API. Pour l’exécuter, vous aurez besoin

### 3. Installation des dépendances

 - (Optionnel mais recommandé) Créer un environnement virtuel python
 - Installer les dépendances avec `pip install -r requirements.txt`
 - Exécuter le script bash `models.sh` pour télécharger et extraire les jeux de données
 - Créer un fichier `.env` avec les valeurs nécéssaires pour se connecter à votre base de données
   - `DB_HOST`
   - `DB_PORT`
   - `DB_DATABASE`
   - `DB_USERNAME`
   - `DB_PASSWORD`
 - Exécuter les cellules du script jupyter Notebook

### 4. Sources de Données (Extract)

Nom de la Source : 2 jeux de données issus de Kaggle

    https://www.kaggle.com/api/v1/datasets/download/imdevskp/corona-virus-report

    https://www.kaggle.com/api/v1/datasets/download/utkarshx27/mpox-monkeypox-data

Type de Source : 2 fichiers CSV

Chemin/Connexion : Base de données type SQL

### 5. Transformations (Transform)

Les pays : Les pays on fait l’objet d’une attention particulière car il n’étaient pas nommés de la même manière entre les deux jeux de données

Les dates : Les dates ont été formatées dans un format compatible avec le moteur SQL que nous avons choisi

### 6. Cibles de Données (Load)

La cible de l’ETL : une base de données PostgreSQL hébergée via le SaaS Supabase

Stratégie de Chargement : Nous avons adopté la stratégie full-load : au chargement des données dans une table, celle-ci est préalablement vidée (sauf dans le cas du chargement des deux maladies dans la table pandemic_stats.

Gestion des Clés : Les clés primaires sont créées automatiquement, et les clés étrangères sont trouvées via les requêtes SQL.

### 7. Performance

Temps d'Exécution Estimé : Environ 2 heures, du à la gestion des ressources et la protection antispam de l’infrastructure de supabase