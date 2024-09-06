# RecetteApp

## Description

RecetteApp est une application de gestion de recettes, développée avec Vue.js, Pinia et Vue Router. Cette application permet aux utilisateurs d'ajouter, modifier, supprimer et consulter des recettes de cuisine.

## Fonctionnalités

- **Ajouter une recette** : Formulaire pour ajouter de nouvelles recettes avec un titre, des ingrédients, un type, et une URL d'image.
- **Modifier une recette** : Modifier les détails d'une recette existante.
- **Supprimer une recette** : Supprimer une recette de la liste.
- **Consulter les détails** : Voir les détails d'une recette spécifique.
- **Liste des recettes** : Afficher toutes les recettes enregistrées.

## Technologies Utilisées

- **Vue.js:** Framework JavaScript progressif pour la création d'interfaces utilisateur.
- **Pinia:** Bibliothèque de gestion d'état pour Vue.js, offrant une alternative plus flexible à Vuex.
- **Vue Router:** Routeur officiel de Vue.js pour la gestion des navigations entre les différentes pages.

### Prérequis

Assurez-vous d'avoir [Node.js](https://nodejs.org/) installé sur votre machine.

## Installation

1. **Clonez le dépôt**

   ```bash
   git clone https://github.com/votre-nom-utilisateur/recetteapp.git
   cd recetteapp
   ```

### Installez les dépendances

```bash
npm install
```

### Démarrez l'application en mode développement

```bash
 npm run serve
```

Ouvrez votre navigateur et accédez à

- http://localhost:8080 pour voir l'application en action.

## Structure des Composants

- **Home.vue :** Page d'accueil avec un aperçu des recettes.
- **AjoutRecette.vue :** Formulaire pour ajouter une nouvelle recette.
- **ModifieRecette.vue :** Formulaire pour modifier une recette existante.
- **ListeRecette.vue :** Liste des recettes avec options pour consulter les détails, modifier ou supprimer une recette.
- **DetailRecette.vue :** Page affichant les détails d'une recette.

## Routes

- **/ :** Page d'accueil
- **/recette-list :** Liste des recettes
- **/recette/new :** Formulaire d'ajout d'une nouvelle recette -**/recette/edit/:id :** Formulaire de modification d'une recette
- **/recette/show/:id :** Détails d'une recette

## Store (Pinia)

Le store recetteStore gère l'état des recettes :

- **state :** Contient les recettes et les informations sur la recette en cours.
- **actions :** Méthodes pour ajouter, modifier, supprimer et récupérer des recettes.
