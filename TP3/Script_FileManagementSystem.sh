#!/bin/bash

# This portion of the Script will create a new user using the cmd adduser.
# username variable declaration.
username=""

# Prompt user to ask a username input. read -p is used for this task and is similar to echo and read on two seperate lines.
read -p "Enter the username to be created" username

if [ -z "$username" ]; then
  echo "Error : No username entry. Username cannot be empty"
fi

# username creation user adduser.
  echo "username id creation '$username'..."
  sudo adduser "$username"

# username verification if it does not exist already.
if [[ id "$username" &>/dev/null ]]; then
  echo "Username '$username' was created with success."
  else
   echo "Error : Username '$username' already exist."
  fi
fi
