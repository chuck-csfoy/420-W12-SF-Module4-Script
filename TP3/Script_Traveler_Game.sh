#!/bin/bash

# prompt user input to initialize distances to variables
# read -p is shorter cmd but similar to echo + read
# Function validate variable to make sure the user input is valid for all variables.
validate_variable(){
  local var="$1" #function validate 1st argument
  if [ -z "$var" ]; then
    echo "Please valide variable"
    return 1
    elif [[ $var =~ [0-9]+$ && $var -ge && $var -le 1000 ]]; then
    return 0
    else
    echo "Invalid entry. Value must be a between number in between 0 and 1000."  
    return 1
  fi
}

# Collect and validate the user input variables 
for i in 1 2 3; do
   while true; do
	read -p "Enter the distance for the south road $i: " south_road
	read -p "Enter the distance for the east road which is 300m longer than the south road $i : " east_road
	read -p "Enter the distance for the north road which is equal to the other roads $i : " north_road
	if validate_variable "$south_road", "$east_road", "$north_road"; then
	   eval "var$i=$south_road", "var$i=$east_road", "var$i=$north_road"
	   break
      fi
    done
done
echo "Don\'t worry about the ouest road it\'s blocked and unvaible..."
# find the shortest route by comparaison and using the less than operator and with logical AND operator ampersand

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
