#!/bin/bash

# Script pour calculer la somme de deux nombres

# Demande a lutilisateur de saisir le premier nombre
echo -n "Entrez le premier nombre: "
read nb1

# Demande a lutilisateur de saisir le deuxieme nombre
echo -n "Entrez le deuxième nombre: "
read nb2

# Calcule la somme des deux nombres
somme=$((nb1 + nb2))

# Affiche le resultat(somme)
echo "La somme de $nb1 plus $nb2 est: $somme" 
