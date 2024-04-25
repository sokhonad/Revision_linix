#!/bin/bash
# Créer le compte "admin"
useradd admin

# Définir un mot de passe pour le compte "admin"
# passwd admin
# Se connecter en tant que "admin" avec le chargement du .profil / $HOME :

# Connectez-vous en tant que "admin"
su - admin

# Créer le répertoire "SCRIPTS" dans /home/admin :

mkdir /home/admin/SCRIPTS

# Créer les répertoires demandés dans "/home/admin" :

mkdir /home/admin/app /home/admin/sauvegardes /home/admin/my_projects /home/admin/archives
# Créer un script nommé "create_directories.sh" dans le répertoire SCRIPTS et accorder les droits d'exécution pour le compte admin :

touch /home/admin/SCRIPTS/create_directories.sh
chmod +x /home/admin/SCRIPTS/create_directories.sh


#Création de l'utilisateur "admintech" :

sudo adduser admintech
sudo usermod -aG sudo admintech
echo "admintech:admintech" | sudo chpasswd
Script create_directories.sh :


# Définition des répertoires à créer

directories=("directory1" "directory2" "directory3")

# Création des répertoires avec une boucle for

for dir in "${directories[@]}"; do
    mkdir -p "/home/admintech/SCRIPTS/$dir"
    echo "$(date +"%Y-%m-%d %H:%M:%S"): Répertoire $dir créé." >> /home/admintech/SCRIPTS/create_directories.log
done

# Ajout des droits d'exécution au script pour l'utilisateur "admintech" :

sudo chown admintech:admintech /home/admintech/SCRIPTS/create_directories.sh
sudo chmod u+x /home/admintech/SCRIPTS/create_directories.sh

# Exécution du script et vérification :

sudo -u admintech /home/admintech/SCRIPTS/create_directories.sh
cat /home/admintech/SCRIPTS/create_directories.log

# Création de la tâche planifiée pour créer des fichiers dans le dossier "my_project" toutes les 2 minutes :

crontab -e

# Ajoutez la ligne suivante dans le fichier cron :


*/2 * * * * /bin/ /home/admintech/SCRIPTS/create_files.sh

#Création de la deuxième tâche planifiée pour vérifier les fichiers horodatés et les déplacer dans un dossier archivé :

crontab -e

# Ajoutez la ligne suivante dans le fichier cron :


0 0 * * * /bin/ /home/admintech/SCRIPTS/move_files.sh
# Exécution de la commande "sudo su" avec le compte "admintech" et tuer le processus avec une autre session :

#Dans une session :

sudo su -l admintech

# Dans une autre session, pour tuer le processus :


sudo pkill -u admintech sudo
