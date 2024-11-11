#!/bin/bash

# Script pour demander le nom d'un fichier existant a lutilisateur et le supprime

# Demande a lutilsateur de saisir le nom du fichier quil souhaite supprimer
echo -n "Entrez le nom du fichier a supprimer: "
read file_name

# verifier si lentree nest pas vide
if [ -z "$file_name" ]; then
 echo "le nom du fichier ne peut pas être vide."
 exit 1
fi

# Verifie si le fichier existe
if [ -f "$file_name" ]; then
 # Demande confirmation avant de supprimer
 echo -n "Êtes-vous certain de vouloir supprimer ce fichier '$file_name' ? (y/n) ;"
 read confirmation
 if [ "$confirmation" = "y" ]; then
  rm "$file_name"
  if [ $? -eq 0 ]; then
   echo "Le fichier 'file_name' a été suprimé avec succès."
  else
   echo "Une erreur est survenue lors de la supression du fichier."
  fi
 else
  echo "Suppression annulée."
 fi
else
 echo  "le fichier '$file_name' n'existe pas."
fi
