#!/bin/bash

# Affiche adresse IP reseau
echo "Interfaces réseau disponibles sur le système:"
ip link show | awk -F: '/^[0-9]+: /{print $2}' | tr -d ' '
ip address
