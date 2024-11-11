#!/bin/bash

# Script pour un nom de repertoire a l'utilisateur et creer automatiquement ce repertoire

# Demande a l'utilisateur de saisir un nom de repertoire
echo -n "Entrez le nom du répertoire à céer :"
read directory_name

# Verfier si l'entree est pas vide
if [-z "$directoy_name"]; then
	echo "Le nom du répertoire ne peut pas être vide."
	echo 1
fi

# Cree le repertoire
mkdir -p "$directory_name"

# Verifie si le repertoire a ete cree avec succes
if [$? -eq 0]; then 
	echo "Le répertoire '$directory_name' a été créé avec succès."
else
	echo "Une erreur est survenu lors de la création du répertoire."
fi
