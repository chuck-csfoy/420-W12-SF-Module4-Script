#!/bin/bash

# utilisation du shebang pour declarer lutilisation langage bash selon son arborescence
# Declaration de la variable FICHIER et initialisation de la valeur.
FICHIER="espaceDisque.txt"

# La date commande date est utilisee et son contenu est ajoute a la variable FICHIER
# La commande df avec -H le format humain (le poids est converti en go ou ko au lieu 

date >> $FICHIER
df -H | grep /dev/sd >> $FICHIER
# Affiche a lecran console (STDOUT) le contenu de FICHIER
cat $FICHIER
