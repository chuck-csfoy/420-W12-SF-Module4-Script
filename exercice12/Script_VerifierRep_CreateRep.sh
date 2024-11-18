#!/bin/bash

#declaration de variables
dir_path=""
response=""

# Demande le nom du repertoire a verifier a l'utilisateur.
# read -p 'Entrez le nom du repertoire recherche: " dir_path serait une autre facon de proceder sur une seule ligne
echo "Entrez le nom du repertoire recherche: "
read dir_path

# Verifie si le repertoire existe
if [ ! -d "dir_path" ]; then
  echo "Le repertoire: '$dir_path' n'existe pas."

  # Demande a l'utilisateur sil souhaite creer le repertoire
  echo "Voulez-vous creer ce repertoire? (o/n) : "
  read respone
  # Verifie la reponse de l'utulisateur
  if [[ "$response" == "o" || "$response" == "O" ]]; then
     mkdir -p "$dir_path"
     if [ $? -eq 0 ]; then
	echo "Le repertoire: '$dir_path' a ete cree avec succes."
     else
      echo "Erreur survenu lors de la creation du repertoire '$dir_path'."
     fi
  else
    echo "Le repertoire n'a pas ete cree."
  fi
else 
  echo "Le repertoire '$dir_path' existe deja."
fi
if [ 
