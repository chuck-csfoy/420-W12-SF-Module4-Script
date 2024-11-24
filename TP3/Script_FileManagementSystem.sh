#!/bin/bash

# This portion of the Script will create a new user using the cmd adduser.
# username variable declaration.
username=""

# Prompt user to ask a username input. read -p is used for this task and is similar to echo and read on two seperate lines.
read -p "Enter the username to be created." username

if [ -z "$username" ]; then
  echo "Error : No username entered. Username cannot be empty."
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

# This portion of the script is used to ask user to choose a name for a new directory name.
# directory name variable declaration.
directory_name=""

# Prompt user tp choose a directory name
read -p "Enter the directory name to be created." directory_name

# User input verification to check if entry is empty.
if [ -z "$directory_name" ]; then
  echo "Error : No directory name entered. Directory name cannot be empty."
fi

# Directory creation with option -p to check if the directory already exist. If so it won't be created.
mkdir -p "$directory_name"

# Directoy creation verification with option -eq (equal) that the operation was successful.
if [ $? -eq 0 ]; then
  echo "Directory '$directory_name' was created with success"
else
  echo "Error : An error occured during directory name creation"
fi
