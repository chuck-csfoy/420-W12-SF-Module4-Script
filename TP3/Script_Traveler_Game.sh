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
# Function validate 1st argument
validate_variable()
{
  local var="$1" 
  if [ -z "$var" ]; then
    echo "Please enter a valid value. The input cannot be empty."
    return 1 # Error code
    elif [[ "$var" =~ ^[0-9]+$ && "$var" -ge 300 && "$var" -le 1000 ]]; then
    return 0 # Valid user input entry: in between 0 and 9, no characters and between 300 and 1000.
    else
    echo "Invalid entry. Value must be a between number in between 300 and 1000."  
    return 1 # Error code
  fi
}

# Collect and validate the user input for the calculation of the distance of the three roads.
# The command read with option -p is shorter cmd but similar to echo + read
# Variable declaration
west_road=""

while true; do
read -p "Enter the distance for the west road: " west_road
   if validate_variable "$west_road"; then
      break
   fi
done

# Calculate the distance for the other roads using the user input value for the west road.
east_road=$((south_road + 300)) # East road is 300m longer than the south road.
south_road=$((west_road - 200)) # South road is 200 shorter than the west road.
north_road=$((south_road + east_road)) # North road is equal in distance to the sum of the two other roads.

echo ""
echo "The west road is blocked and unavaible... Ignore it."
echo ""

# Prompt user to chose a road. 
echo "Choose which road you wish to take to find your way out of the forest."
echo "1. South_road"
echo "2. East_road"
echo "3. North_road"

# Variable declaration
playerChoice_road=""

while true; do
   read -p "Enter your choice (1/2/3): " playerChoice_road
   if [[ "$playerChoice_road" =~ ^[1-3]$ ]]; then
     break
   else
     echo "Invalid choice. Please enter 1, 2 or 3 to make your selection."
     fi
done

# Determine the shortest road. Find the shortest route by comparaison and using the less than operator and with logical AND operator ampersand
# Variable declaration
shortest_road=""

if [[ $south_road -lt $east_road && $south_route -lt $north_road ]]; then
   shortest_road="1" # South_road
   echo "Take the south road. It is the shortest!"
elif [[ $east_route -lt $north_road && $east_road -lt $south_road ]]; then
   shortest_road="2" # East_road
   echo "Take the east road. It is the shortest!"
else
   shortest_road="3" # North_road
   echo "Take the north road. It is the shortest!"
fi

# Victory message when the shortest road is chosen.
if [ "$playerChoice_road" -eq "$shortest_road" ]; then 
  echo "Congratulations! You have found your way out of the forest!"
else
  echo "Wrong choice... You are lost!"
fi

