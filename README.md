# Gestionnaire de Tâches 

Ce script Bash est un gestionnaire de tâches qui permet à l'utilisateur de créer, mettre à jour, supprimer, et afficher des tâches qui sont dans un fichier texte.

## Fonctionnalités

- Créer une nouvelle tâche avec la commande ./HOMEWORK.sh -c : Ajoute une nouvelle tâche avec un titre, une description, un lieu, une date d'échéance et une heure d'échéance.
- Mettre à jour une tâche existante avec la commande ./HOMEWORK.sh -u : Permet de modifier les détails d'une tâche existante en utilisant son ID unique.
- Supprimer une tâche avec la commande ./HOMEWORK.sh -d : Supprime une tâche du fichier en utilisant son ID unique.
- Afficher toutes les informations sur une tâche avec la commande ./HOMEWORK.sh -s : Affiche les détails d'une tâche spécifique en utilisant son ID unique.
- Lister les tâches d'un jour donné avec la commande ./HOMEWORK.sh -l : Affiche toutes les tâches prévues pour une date spécifique.
- Rechercher une tâche par le titre avec la commande ./HOMEWORK.sh -f : Recherche et affiche les tâches qui correspondent au titre.
- Afficher l'aide avec la commande ./HOMEWORK.sh -h : Affiche les options d'utilisation du script.

## Prérequis

- Bash
- Un système d'exploitation compatible Unix (linux ou Ubuntu)

## Utilisation

Pour utiliser le script, vous pouvez utiliser la commandes(dans le terminal) :
./HOMEWORK.sh [option] [argument]
