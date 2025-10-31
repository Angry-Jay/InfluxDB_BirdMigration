# 🦅 Tutoriel NoSQL : InfluxDB & Migration des Oiseaux

[![InfluxDB](https://img.shields.io/badge/InfluxDB-2.0-22ADF6?logo=influxdb)](https://www.influxdata.com/)
[![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-F37626?logo=jupyter)](https://jupyter.org/)
[![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker)](https://www.docker.com/)
[![Python](https://img.shields.io/badge/Python-3.11-3776AB?logo=python)](https://www.python.org/)

## 📋 Description du Projet

Ce tutoriel interactif présente l'utilisation d'**InfluxDB**, une base de données NoSQL de type **time-series**, pour analyser et visualiser des données de migration d'oiseaux en temps réel. Le projet est entièrement conteneurisé avec Docker et utilise Jupyter Notebook pour une expérience d'apprentissage interactive.

### 🎯 Objectifs Pédagogiques

- Comprendre les bases de données NoSQL orientées séries temporelles
- Maîtriser l'insertion et la requête de données dans InfluxDB
- Manipuler des données géospatiales volumineuses
- Créer des visualisations interactives avec Plotly et Folium
- Utiliser Docker pour déployer une stack complète de data science

---

## 🗂️ Structure du Projet

```
InfluxDB_BirdMigration/
├── docker-compose.yml      # Orchestration des conteneurs
├── Dockerfile              # Image Jupyter personnalisée
├── requirements.txt        # Dépendances Python
├── tpLive.ipynb           # Notebook tutoriel principal
└── README.md              # Ce fichier
```

---

## 📊 Dataset Utilisé

**Source** : [Movebank Animal Tracking Dataset](https://www.kaggle.com/datasets/pulkit8595/movebank-animal-tracking) (Kaggle)

Le dataset contient des données de tracking GPS d'oiseaux migrateurs avec :
- **Coordonnées géographiques** (latitude, longitude, altitude)
- **Timestamps** précis des observations
- **Métadonnées** : espèces, identifiants individuels, types de capteurs
- **Données environnementales** : couverture végétale, température, etc.

**Taille** : ~50 000 observations de migration d'oiseaux à travers le monde

---

## 🚀 Installation et Démarrage

### Prérequis

- [Docker](https://www.docker.com/get-started) installé
- [Docker Compose](https://docs.docker.com/compose/install/) installé
- Connexion Internet (pour télécharger le dataset Kaggle)
- 4 GB de RAM minimum

### Étape 1 : Cloner le Dépôt

```bash
git clone https://github.com/Angry-Jay/InfluxDB_BirdMigration.git
cd InfluxDB_BirdMigration
```

### Étape 2 : Lancer l'Environnement Docker

```bash
docker-compose up -d
```

Cette commande va :
- Démarrer un conteneur **InfluxDB 2.0** (port 8086)
- Démarrer un conteneur **Jupyter Lab** (port 8888)
- Créer automatiquement l'organisation et le bucket InfluxDB

### Étape 3 : Vérifier les Conteneurs

```bash
docker-compose ps
```

Vous devriez voir deux conteneurs actifs :
- `influxdb` → http://localhost:8086
- `notebook` → http://localhost:8888

### Étape 4 : Accéder à Jupyter Lab

Ouvrez votre navigateur et accédez à :
```
http://localhost:8888
```

**Aucun token n'est requis** (configuration simplifiée pour le tutoriel).

---

## 📚 Contenu du Tutoriel

Le notebook `tpLive.ipynb` est organisé en plusieurs parties :

### **Partie 1 : Installation et Configuration (15 min)**
- Configuration de la connexion InfluxDB
- Importation des bibliothèques Python nécessaires
- Vérification de la connectivité

### **Partie 2 : Chargement et Exploration des Données**
- Téléchargement automatique du dataset Kaggle
- Exploration des données (statistiques descriptives, types de données)
- Analyse des valeurs manquantes

### **Partie 3 : Nettoyage des Données**
- Suppression des colonnes vides
- Préparation des données pour l'insertion

### **Partie 4 : Insertion dans InfluxDB**
- Définition des tags et des fields
- Écriture batch des données temporelles
- Vérification de l'insertion

### **Partie 5 : Requêtes et Analyses** *(à compléter)*
- Requêtes Flux pour extraire des données
- Analyses de patterns de migration
- Agrégations temporelles

### **Partie 6 : Visualisations** *(à compléter)*
- Cartes interactives avec Folium
- Graphiques temporels avec Plotly
- Heatmaps de densité de migration

---

## 🔧 Configuration InfluxDB

Le fichier `docker-compose.yml` configure automatiquement InfluxDB avec :

| Paramètre | Valeur |
|-----------|--------|
| **URL** | `http://influxdb2:8086` |
| **Organisation** | `fil-A3-back-bigData` |
| **Bucket** | `animal-tracking` |
| **Token** | `admin-token` |
| **Username** | `admin` |
| **Password** | `my-s0ecret-password` |

### Accéder à l'Interface Web InfluxDB

```
http://localhost:8086
```

Utilisez les identifiants ci-dessus pour vous connecter et explorer les données via l'interface Data Explorer.

---

## 🐍 Dépendances Python

Les principales bibliothèques utilisées :

```
pandas==2.2.3           # Manipulation de données
influxdb_client==1.35.0 # Client InfluxDB
kagglehub==0.3.13       # Téléchargement Kaggle
plotly==5.15.0          # Visualisations interactives
matplotlib==3.8.0       # Graphiques statiques
folium==0.14.0          # Cartes géographiques
```

Toutes les dépendances sont installées automatiquement dans le conteneur.

---

## 📈 Concepts NoSQL Abordés

### InfluxDB : Base de Données Time-Series

- **Mesure (Measurement)** : `BIRD-MIGRATION`
- **Tags** : Indexés pour requêtes rapides (espèce, identifiant, capteur)
- **Fields** : Valeurs mesurées (latitude, longitude, altitude)
- **Timestamp** : Horodatage précis de chaque observation

### Avantages d'InfluxDB pour ce Cas d'Usage

✅ Optimisé pour données temporelles (GPS tracking)  
✅ Compression efficace (séries temporelles)  
✅ Requêtes d'agrégation rapides  
✅ Rétention automatique des données  
✅ Visualisation native avec Grafana/Chronograf

---

## 🛑 Arrêt et Nettoyage

### Arrêter les Conteneurs

```bash
docker-compose down
```

### Supprimer les Volumes (⚠️ Efface les données)

```bash
docker-compose down -v
```

### Redémarrer depuis Zéro

```bash
docker-compose down -v
docker-compose up -d --build
```

---

## 🐛 Dépannage

### Problème : Jupyter ne démarre pas

**Solution** : Vérifiez les logs
```bash
docker-compose logs notebook
```

### Problème : InfluxDB inaccessible

**Solution** : Vérifiez le healthcheck
```bash
docker exec influxdb curl -f http://localhost:8086/ping
```

### Problème : Erreur d'import de bibliothèques

**Solution** : Reconstruisez l'image
```bash
docker-compose up -d --build
```

### Problème : Dataset Kaggle ne se télécharge pas

**Solution** : Vérifiez votre connexion Internet et réessayez. Le téléchargement peut prendre quelques minutes.

---

## 📖 Ressources Complémentaires

- [Documentation InfluxDB 2.0](https://docs.influxdata.com/influxdb/v2.0/)
- [InfluxDB Python Client](https://influxdb-client.readthedocs.io/)
- [Flux Query Language](https://docs.influxdata.com/influxdb/v2.0/query-data/get-started/)
- [Dataset Movebank](https://www.movebank.org/)

---

## 👥 Auteurs

**Projet réalisé dans le cadre du cours Big Data - IMT Nantes**  
*FIL A3 - 2025*
@Angry-Jay - [GitHub](https://github.com/Angry-Jay)
@h00dieB0y - [GitHub](https://github.com/h00dieB0y)
@NathanFouere - [GitHub](https://github.com/NathanFouere)

---

## 📝 Licence

Ce projet est à usage pédagogique. Le dataset provient de Kaggle et est soumis à sa propre licence.

---

**Bon tutoriel ! 🚀**
