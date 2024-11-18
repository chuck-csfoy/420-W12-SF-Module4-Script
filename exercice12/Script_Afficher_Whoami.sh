#!/bin/bash

# declaration de la variable DATE avec initialisation au parametres demandes.
# cmd date + les format control
DATE=$(date +"%A %d %B à %H:%M:%S")
# Script pour afficher un message de bienvenue avec le d'utilisateur et le nom de la machine

echo "Bien dans le terminal BASH $(whoami)!"
echo "Nous sommes heureux que votre machine $HOSTNAME se porte tres bien aussi!"

# Afficher date et heure actuelle.
echo "Date et heure actuelles: $DATE"
