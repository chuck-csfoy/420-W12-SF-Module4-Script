#!/bin/bash

# demande a lutilisateur dentrer un nom de fichier
echo "Entrez le nom du fichier : "

# lecture de lentree de donnees utilisateur a la console dans la variable filename
read filename 

if [ -e "$filename" ]; then
  echo "Le fichier existe."
else
  echo "Le fichier n'existe pas"

fi
