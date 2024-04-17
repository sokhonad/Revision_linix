#!/bin
# Création des dossiers max/ et elsa/
mkdir ~/max ~/elsa

# Suppression des dossiers max/ et elsa/
rm -r ~/max ~/elsa

# Création du dossier Formation_Ubuntu et des sous-dossiers Images et Audio
mkdir ~/Formation_Ubuntu ~/Formation_Ubuntu/Images ~/Formation_Ubuntu/Audio

# Téléchargement du podcast Franc-Inter et renommage
wget -O ~/Formation_Ubuntu/Audio/Qwant_Un_Moteur_Francais.mp3 https://cloud.mesdatas.org/s/5doB2Ft4aKKX293/download

# Téléchargement des images commençant par "ubuntu" dans le dossier Images
cd ~/Formation_Ubuntu/Images
wget -r -nd -A.png https://dane.ac-lyon.fr/spip/IMG/scenari/ubuntu/res/ --no-check-certificate

# Listing des images commençant par "ubuntu" et envoi dans un fichier liste_fichiers.txt
ls ubuntu* >> ~/Formation_Ubuntu/Images/liste_fichiers.txt

# Ajout des fichiers commençant par "x" à liste_fichiers.txt
ls x* >> ~/Formation_Ubuntu/Images/liste_fichiers.txt

# Suppression des images commençant par "L" en majuscule
rm L*.png

# Retour au dossier Audio et création du fichier liste-ogg.txt listant les fichiers OGG
cd ~/Formation_Ubuntu/Audio
find / -name "*.ogg" >> ~/Formation_Ubuntu/Audio/liste-ogg.txt

# Modification du nom du poste dans /etc/hostname et /etc/hosts
sudo sed -i 's/NOM_INITIAL/NOM_NOUVEAU/g' /etc/hostname
sudo sed -i 's/NOM_INITIAL/NOM_NOUVEAU/g' /etc/hosts

