#!/bin/bash

# Vérifier si les deux dossiers sont fournis en arguments
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 dossier1 dossier2"
  exit 1
fi

dossier1=$1
dossier2=$2

# Vérifier si les dossiers existent
if [ ! -d "$dossier1" ]; then
  echo "Le dossier $dossier1 n'existe pas."
  exit 1
fi

if [ ! -d "$dossier2" ]; then
  echo "Le dossier $dossier2 n'existe pas."
  exit 1
fi

# Comparer la structure des dossiers
echo "Comparaison de la structure des dossiers..."
diff -qr "$dossier1" "$dossier2"

# Comparer le contenu des fichiers
echo "Comparaison du contenu des fichiers..."
for fichier1 in $(find "$dossier1" -type f); do
  fichier2="${dossier2}${fichier1#$dossier1}"
  if [ -f "$fichier2" ]; then
    cmp -s "$fichier1" "$fichier2"
    if [ $? -ne 0 ]; then
      echo "Les fichiers diffèrent : $fichier1 et $fichier2"
    fi
  else
    echo "Le fichier $fichier2 n'existe pas dans $dossier2"
  fi
done

echo "Comparaison terminée."


