#!/bin/bash

# Script pour afficher la liste des fichiers dans le repertoire courant.

echo "Liste des fichiers dans le répertoire $(pwd):"

# Utilisation de la commande 'ls' ou 'll' pour lister les fichiers qui s'y retrouvent.
ls -l

3 Alternative pour n'afficher que les fichiers (sans repertoires)
# find . -maxdepth l -type f
