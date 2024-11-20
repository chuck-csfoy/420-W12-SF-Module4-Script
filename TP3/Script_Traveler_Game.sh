#!/bin/bash

read -p "Enter the distance for the south road: " south_road
read -p "Enter the distance for the east road which is 300m longer than the south road: " east_road
read -p "Enter the distance for the north road which is equal to the other roads: " north_road

# find the shortest route by comparaison and using the less than operator
if [[ $south_road -lt $east_road && $south_route -lt $north_road ]]; then
   echo "Take the south road. It is the shortest!"
elif [[ $east_route -lt $north_road && $east_road -lt $south_road ]]; then
   echo "Take the east road. It is the shortest!"
elif [[ $north_road -lt $east_road && $north_road -lt $south_road ]]; then
   echo "Take the north road. It is the shortest!"
else
   echo "All these roads have the same distances. Take whichever!"
fi

# Victory message when a road is chosen
echo "Congratulations!"
