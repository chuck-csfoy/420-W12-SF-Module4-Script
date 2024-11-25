#!/bin/bash
echo "--------------------------------------------------"
echo "Welcome to the Traveler Game!"
echo "--------------------------------------------------"
echo "You are a trveler who has lost his wain a dense forest."
echo ""
echo "You come to an opening in the forest at a crossroad where you meet a freidn who is an experienced traveler."
echo ""
echo "You will need his help to find the right way out of the forest."
echo ""
echo "The experienced traveler gives you valuable information on the area as follow:"
echo ""
echo "1. The east road is 300 meters longer than the south road."
echo ""
echo "2. The south road is 200 meters shorter that the west road which is unavailable."
echo ""
echo "3. The north road is equal in distance to the two others."
echo ""
echo "Let say we understand that the distance we need to figure out is the the west road to find the other distances."
echo "--------------------------------------------------"

# prompt user input to initialize distances to variables
# Function validate variable to make sure the user input is valid for all variables.
validate_variable(){
  local var="$1" #function validate 1st argument
  if [ -z "$var" ]; then
    echo "Please enter a valid variable value"
    return 1
    elif [[ "$var" =~^[0-9]+$ && "$var" -ge 0 && "$var" -le 1000 ]]; then
    return 0
    else
    echo "Invalid entry. Value must be a between number in between 0 and 1000."  
    return 1
  fi
}

# Collect and validate the user input variables 
for i in 1 2 3; do
   while true; do
   # read -p is shorter cmd but similar to echo + read
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
