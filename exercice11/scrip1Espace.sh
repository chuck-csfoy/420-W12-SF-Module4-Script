#!/bin/bash
FICHIER="espaceDisque.txt"

date >> $FICHIER
df -H | grep /dev/sd >> $FICHIER

cat $FICHIER
