README


Le code est en Python. Il est structuré de cette manière :
-	Class Processus : Une classe définissant un objet de type processus qui stocke l’identifiant, le temps d’arrivée et le temps d’exécution.
-	Une fonction read_csv_file : Il prend en entrée le nom d’un fichier.txt contenant des informations sur les processus. Elle lit le fichier ligne par ligne, extrait les informations sur chaque processus et les stocke dans une liste d'objets Processus. Si une ligne du fichier est mal formatée, un message d'erreur est affiché.
-	Fonction choose_policy : Cette fonction permet à l'utilisateur de choisir une politique de planification parmi trois options : FCFS, SJF et STCF. Elle demande à l'utilisateur d'entrer le numéro correspondant à son choix et valide cette entrée.
-	Fonctions de planification (fcfs, sjf, stcf) : Chacune de ces fonctions prend en entrée une liste de processus et implémente une politique de planification spécifique. Elles trient les processus selon la politique de planification choisie, exécutent les processus dans cet ordre en calculant les temps de début et de fin d'exécution, puis affichent les résultats sous forme de tableau.
-	Fonction principale main : Cette fonction coordonne l'exécution du programme. Elle lit le fichier CSV, demande à l'utilisateur de choisir une politique de planification, puis applique la politique choisie en utilisant les fonctions de planification correspondantes.

Pour exécuter le code, il faut télécharger le fichier testlin.txt , Ensuite il faut remplacer le nom du fichier: r'C:\Users\hp\Desktop\1ere année de cycle ingé\testlin.txt'   dans le code par les références du fichier dans votre ordinateur. Enfin, exécuter le code




