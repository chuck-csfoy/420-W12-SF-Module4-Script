#!/bin/bash

dir_path=""

echo "Entrez le nom du repertoire a verifier sil est vide."
read dir_path

if [ "$(ls -A "$dir_path")" ]; then
  echo "Le repertoire n est pas vide."
else 
  echo "Le repertoire est vide."
fi
