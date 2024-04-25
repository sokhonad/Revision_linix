#!/bin/bash

# Fonction pour calculer le bénéfice pour un produit
calculer_benefice() {
    prix_achat=$1
    prix_vente=$2
    taxes=$3
    benefice=$(echo "scale=2; $prix_vente - $prix_achat - $taxes" | bc)
    echo $benefice
}

# Tableau contenant les données des produits
declare -A produits=(
    ["Produit1"]="100 150 15"
    ["Produit2"]="120 140 2"
    ["Produit3"]="95 130 7"
    ["Produit4"]="85 102 5"
    ["Produit5"]="40 45 5"
    ["Produit6"]="35 37 3"
    ["Produit7"]="114 118 1"
    ["Produit8"]="66 110 17"
)

# Calcul du bénéfice pour chaque produit et affichage
echo "Produit,Bénéfice"
for produit in "${!produits[@]}"; do
    data=(${produits[$produit]})
    benefice=$(calculer_benefice ${data[@]})
    echo "$produit,$benefice"
done

# Filtrage des produits dont le bénéfice est inférieur à 3 €
echo "Prix Achat,Prix Vente,Taxes,Bénéfice" > produit_risque_revente_a_perte.csv
for produit in "${!produits[@]}"; do
    data=(${produits[$produit]})
    benefice=$(calculer_benefice ${data[@]})
    if (( $(echo "$benefice < 3" | bc -l) )); then
        echo "${data[0]},${data[1]},${data[2]},$benefice" >> produit_risque_revente_a_perte.csv
    fi
done

