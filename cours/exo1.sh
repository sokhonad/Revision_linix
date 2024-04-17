#!/bin

# Exercice 1 :

# 1. Affichez le répertoire de travail actuel.
pwd

# 2. Changez de répertoire vers votre répertoire personnel.
cd ~

# 3. Affichez le contenu du répertoire.
ls

# 4. Changez de répertoire vers le répertoire parent.
cd ..

# 5. Créez un nouveau répertoire appelé "test".
mkdir test

# 6. Déplacez-vous dans le répertoire "test".
cd test

# 7. Créez un fichier vide appelé "exemple.txt".
touch exemple.txt

# 8. Affichez le contenu du répertoire pour vérifier les changements.
ls

# 9. Manipuler des fichiers :

# 10. Copiez le fichier "exemple.txt" dans un nouveau fichier appelé "copie.txt".
cp exemple.txt copie.txt

# 11. Renommez le fichier "copie.txt" en "nouveau.txt".
mv copie.txt nouveau.txt

# 12. Déplacez le fichier "nouveau.txt" dans le répertoire parent.
mv nouveau.txt ..

# 13. Supprimez le répertoire "test" et son contenu.
rm -r test

# 14. Affichez le contenu du répertoire pour vérifier les changements.
ls

# 15. Rechercher et filtrer :

# 16. Créez un nouveau fichier appelé "liste.txt" contenant une liste de mots (un mot par ligne).
echo -e "chat\ndog\nchat\nrabbit\ndog" > liste.txt

# 17. Recherchez toutes les occurrences du mot "chat" dans le fichier "liste.txt".
grep "chat" liste.txt

# 18. Comptez le nombre de lignes dans le fichier "liste.txt" qui contiennent le mot "chien".
grep -c "dog" liste.txt

# 19. Triez les lignes du fichier "liste.txt" par ordre alphabétique.
sort liste.txt

# 20. Affichez les 10 premières lignes du fichier "liste.txt".
head liste.txt

# 21. Manipuler du texte :

# 22. Créez un nouveau fichier appelé "paragraphe.txt" contenant un paragraphe de texte.
echo -e "UNIX is an operating system.\nIt is used widely in server environments." > paragraphe.txt

# 23. Comptez le nombre total de mots dans le fichier "paragraphe.txt".
wc -w paragraphe.txt

# 24. Remplacez toutes les occurrences du mot "vieux" par "nouveau" dans le fichier "paragraphe.txt".
sed -i 's/vieux/nouveau/g' paragraphe.txt

# 25. Supprimez toutes les lignes vides du fichier "paragraphe.txt".
sed -i '/^$/d' paragraphe.txt

# 26. Affichez les lignes du fichier "paragraphe.txt" qui contiennent le mot "UNIX".
grep "UNIX" paragraphe.txt

# Exercice 2

# 1 script affichant " ^^ Bonjour tout le monde ^^ " à l'écran :

echo "^_^ Bonjour tout le monde ^_^"

# 2 script demandant le prénom et le nom de l'utilisateur, puis affichant un message de bienvenue personnalisé :

echo "Entrez votre prénom : "
read prenom
echo "Entrez votre nom : "
read nom
echo "Bonjour $prenom $nom, bienvenue !"

# 3 script vérifiant si un fichier existe dans un répertoire donné :

echo "Entrez le chemin complet du répertoire : "
read repertoire
echo "Entrez le nom du fichier à vérifier : "
read fichier
if [ -e "$repertoire/$fichier" ]; then
    echo "Le fichier existe"
else
    echo "Le fichier n'existe pas"
fi

# 4 script comptant le nombre de fichiers présents dans un répertoire donné :

echo "Entrez le chemin complet du répertoire : "
read repertoire
echo "Il y a $(find "$repertoire" -type f | wc -l) fichiers dans $repertoire"

# 5 script affichant les fichiers d'un répertoire donné et permettant à l'utilisateur de supprimer un fichier de son choix :

echo "Entrez le chemin complet du répertoire : "
read repertoire
echo "Liste des fichiers dans $repertoire :"
ls "$repertoire"
echo "Entrez le nom du fichier à supprimer : "
read fichier_a_supprimer
rm "$repertoire/$fichier_a_supprimer"
echo "$fichier_a_supprimer a été supprimé."

# 6 script renommant tous les fichiers d'un répertoire en leur ajoutant une extension spécifique :

echo "Entrez le chemin complet du répertoire : "
read repertoire
echo "Entrez l'extension à ajouter aux fichiers : "
read extension
cd "$repertoire" || exit
for fichier in *; do
    mv "$fichier" "$fichier.$extension"
done
echo "Tous les fichiers ont été renommés avec l'extension .$extension"

# 7 script lisant le contenu d'un fichier texte et comptant le nombre de mots :

echo "Entrez le chemin complet du fichier texte : "
read fichier_texte
nb_mots=$(wc -w < "$fichier_texte")
echo "Le fichier $fichier_texte contient $nb_mots mots."

# 8 script demandant à l'utilisateur de saisir un nombre et affichant s'il est pair ou impair :

echo "Entrez un nombre : "
read nombre
if (( nombre % 2 == 0 )); then
    echo "$nombre est pair."
else
    echo "$nombre est impair."
fi

# 9 script demandant à l'utilisateur de saisir deux nombres et affichant leur somme, leur différence et leur produit :

echo "Entrez le premier nombre : "
read nombre1
echo "Entrez le deuxième nombre : "
read nombre2
somme=$((nombre1 + nombre2))
difference=$((nombre1 - nombre2))
produit=$((nombre1 * nombre2))
echo "La somme des nombres est : $somme"
echo "La différence des nombres est : $difference"
echo "Le produit des nombres est : $produit"

# 10 script bouclant à travers tous les fichiers d'un répertoire et affichant uniquement les noms des fichiers (pas les répertoires) :

echo "Entrez le chemin complet du répertoire : "
read repertoire
echo "Liste des fichiers dans $repertoire :"
for fichier in "$repertoire"/*; do
    if [ -f "$fichier" ]; then
        echo "$(basename "$fichier")"
    fi
done


# TP LINUX

# A) Voici les étapes pour accomplir les tâches mentionnées :

# Se connecter à la VM Linux en tant que root et créer le compte "admin" :

# Connectez-vous en tant que root
su

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
