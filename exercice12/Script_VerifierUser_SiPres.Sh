#!/bin/bash

username=""

echo "Entrez le nom dutilisateur: "
read username

if id "$username" &>/dev/null; then
  echo "Lutilisateur existe."
else
  echo "Lutilisateur nexiste pas."
fi
