# Your car your way: PoC chat (OCR Projet 13)

## Introduction
Après avoir récupéré le projet sur GitHub, il faudra démarrer 2 éléments pour utiliser l'application:
- Le serveur backend (API)
- Le serveur frontend

## Pré-requis
Avant de récupérer le projet, il faudra avoir installé un certain nombre d'éléments au préablable:

### Apache Maven
Disponible à cette adresse:

`https://maven.apache.org/download.cgi`

### Java Development Kit (JDK), comprenant Java Runtime Environment (JRE)
Disponible à cette adresse:

`https://www.oracle.com/java/technologies/downloads/`

Ce projet utilise Java version 17 et Angular version 18.

### Node Package Manager (NPM)
Utiliser la commande `npm install` dans l'invite de commandes (cmd), en mode administrateur si besoin.

## Récupérer le projet
Pour récupérer le projet, il est possible de télécharger le projet sur GitHub en format compressé (.zip), ou de le récupérer en le clonant à l'aide de cette commande (à condition que Git soit installé sur votre poste):

`git clone https://github.com/Keijur0/YourCarYourWay-PoC-Chat.git`

Décompresser l'archive (.zip) à l'emplacement souhaité si besoin.

## Installation des dépendances

### Frontend
Placez vous dans le dossier `/front` du projet, exécutez la commande `npm install`.

### Backend
Placez vous dans le dossier `/back` du projet, exécutez la commande `mvn clean install`.

## Lancer le projet Java (API / Backend)
Pour lancer le projet Java, il vous faut d'abord créer les variables d'environnement pour Java et Maven, pointant vers leurs dossiers respectifs `/bin`.

Placez-vous dans le dossier `/back` du projet et tappez la commande:

`mvn spring-boot:run`

## Lancer le projet Angular (Frontend)
Pour lancer le projet Angular, placez-vous dans le dossier `/front` du projet et tappez la commande:

`npm run start` ou `ng serve`

## Utiliser l'application
Pour utiliser l'application, rendez vous à l'url suivante sur votre navigateur web:

`http://localhost:4200`

## Emplacement du script SQL pour mettre en place la structure de données de toute l'application (PostgreSQL)

`/resources`  
Nom du fichier: `script.sql`