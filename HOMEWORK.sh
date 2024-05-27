#!/bin/bash

TODO_FILE="todo_list.txt"


usage() {
   echo "usage: $0 [option] [argument]"
   echo "Options:"
   echo " -c, --create Creer une nouvelle tache."
   echo " -u, --update Mettre a jour une tache existante."
   echo " -d, --delete Supprimer une tache."
   echo " -s, --show Afficher toutes les informations sur une tache."
   echo " -l, --list Liste taches d'un jour donne."
   echo " -f, --find Rechercher une tache par le titre."
   echo " -h, --help Afficher l'aide."
   exit 1
}

# Créer une tâche
create_task() {
   local id=$(date +%s)
   read -p "Titre (obligatoire): " title
   if [[ -z "$title" ]]; then
       echo "Le titre est obligatoire." >&2
       return 1
   fi
   read -p "Lieu (optionnel): " location
   read -p "Description (optionnelle): " description
   read -p "Date d'échéance (YYYY-MM-DD obligatoire): " due_date
   if ! [[ $due_date =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
       echo "La date d'échéance est obligatoire et doit être au format YYYY-MM-DD." >&2
       return 1
   fi
   read -p "Heure d'échéance (HH:MM optionnel): " due_time
   if ! [[ $due_time =~ ^([0-1][0-9]|2[0-3]):[0-5][0-9]$ ]]; then
       due_time=""
   fi
   local completion_marker="non"
   echo "$id,$title,$description,$location,$due_date,$due_time,$completion_marker" >> "$TODO_FILE"
   echo "Tâche créée avec succès."
}

# Mettre à jour une tâche
update_task() {
   read -p "Entrez l'ID de la tâche à mettre à jour: " task_id
   local task_line=$(grep "^$task_id," "$TODO_FILE")
   if [[ -z "$task_line" ]]; then
       echo "Aucune tâche trouvée avec l'ID $task_id." >&2
       return 1
   fi
   echo "Mise à jour de la tâche: $task_line"
   # Supprimer l'ancienne tâche
   sed -i "/^$task_id,/d" "$TODO_FILE"
   # Créer une nouvelle tâche avec le même ID
   create_task
   sed -i "s/^.*,$title,$description,$location,$due_date,$due_time,$completion_marker$/$task_id,$title,$description,$location,$due_date,$due_time,$completion_marker/" "$TODO_FILE"
   echo "Tâche mise à jour avec succès."
}

# Supprimer une tâche
delete_task() {
   read -p "Entrez l'ID de la tâche à supprimer: " task_id
   if ! grep -q "^$task_id," "$TODO_FILE"; then
       echo "Aucune tâche trouvée avec l'ID $task_id." >&2
       return 1
   fi
   sed -i "/^$task_id,/d" "$TODO_FILE"
   echo "Tâche supprimée avec succès."
}

# Afficher toutes les informations sur une tâche
show_task() {
   read -p "Entrez l'ID de la tâche à afficher: " task_id
   local task_line=$(grep "^$task_id," "$TODO_FILE")
   if [[ -z "$task_line" ]]; then
       echo "Aucune tâche trouvée avec l'ID $task_id." >&2
       return 1
   fi
   echo "Informations sur la tâche: $task_line"
}

# Liste des tâches d'un jour donné
list_task() {
   read -p "Entrez la date (YYYY-MM-DD) pour lister les tâches: " date
   echo "Tâches pour $date:"
   grep ",$date," "$TODO_FILE"
}

# Rechercher une tâche par le titre
find_task() {
   read -p "Entrez le titre de la tâche à rechercher: " title
   grep ",$title," "$TODO_FILE"
}

# Afficher l'aide
help_task() {
   usage
}

# Vérifier si le fichier TODO existe, sinon le créer
if [[ ! -f "$TODO_FILE" ]]; then
    touch "$TODO_FILE"
fi

# Exécuter l'option choisie
case "$1" in 
    -c|--create)
        create_task
        ;;
    -u|--update)
        update_task
        ;;
    -d|--delete)
        delete_task
        ;; 
    -s|--show)
        show_task
        ;;
    -l|--list)
        list_task
        ;;
    -f|--find)
        find_task
        ;;
    -h|--help)
        help_task
        ;;
    *)
        usage
        ;;
esac
