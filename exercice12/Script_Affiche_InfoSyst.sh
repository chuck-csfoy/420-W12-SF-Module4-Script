#!/bin/bash

# Script pour afficher linforation systeme

# Affiche le nom de lutilisateur
echo "Nom de l'ulisateur: $(whoami)"

# Affiche larchitecture du processeur
echo "Architecture du processeur: $(uname -m)"

# Affiche la quantite totale de memoire vive
echo "Mémoire vive totale: $(free -h | grep m | awk '{print $2}')"

# Affiche linformation systeme
echo "Système d'exploitation: $(lsb_release -d | cut -f2-)"
