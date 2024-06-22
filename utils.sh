#!/bin/bash

# Vérifie si un argument est passé
if [ -z "$1" ]; then
    echo "Usage: $0 <nom>"
    exit 1
fi

# Prend le premier argument comme nom
nom=$1

# Affiche le message
echo "Bonjour $nom, tu vas bien ?"


# Vérifie si trois arguments sont passés
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <prenom> <nom> <humeur>"
    exit 1
fi

# Prend les arguments
prenom=$1
nom=$2
humeur=$3

# Affiche le message
echo "Bonjour $prenom $nom, tu vas $humeur ?"

