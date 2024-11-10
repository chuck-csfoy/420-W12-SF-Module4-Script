#!/bin/bash

FICHIER="usagerGroup.txt"

date >> $FICHIER
ls -l | tail /etc/passwd && /etc/group >> $FICHIER

cat $FICHIER

