#!/bin/bash

# Check if the script is run with sudo access.
# Root user has a UID of 0. If not equal 0. Exit script.
if [ "$(id -u)" -ne 0 ]; then
  echo "Error: This script must be run with sudo."
  exit 1
fi

# This portion of the Script will create a new user using the cmd adduser.
# username variable declaration.
username=""

# Prompt user to ask a username input. read -p is used for this task and is similar to echo and read on two seperate lines.
while true; do
  read -p "Enter the username to be created: " username
  if [ -z "$username" ]; then
    echo "Error : No username entered. Username cannot be empty."
  # username verification if it does not exist already.
  elif id "$username" &>/dev/null; then
    echo "Error : Username '$username' already exist."
  else
    # if the username does not exist, create it.
    break
  fi
done

# username creation user adduser.
echo "username id creation '$username'..."
useradd "$username"

echo "Username '$username' was created with success."

# This portion of the script is used to ask user to choose a name for a new directory name.
# directory name variable declaration.
directory_name=""

# Prompt user tp choose a directory name
while true; do
  read -p "Enter the directory name to be created: " directory_name
  # User input verification to check if entry is empty.
  if [ -z "$directory_name" ]; then
    echo "Error : No directory name entered. Directory name cannot be empty."
  else
    break
  fi
done

# Directory creation with option -p to check if the directory already exist. If so it won't be created.
# Verification with option -p is shorter but euqivalent to use if [ $? -eq 0 ]; then... -eq = (equal).
mkdir -p home/user/$username/"$directory_name"
# Prompt user that the operation was successful
echo "Directory '$directory_name' was created with success"

# Sticky bit is used on the user directory to ensure only the owner or Root can delete files.
chmod +t home/user/$username/"$directory_name"
# User permissions changed using chmod as per requirements so that only the directory owner has access.
chmod 700 home/user/$username/"$directory_name"

# Script to as user to select a new filename and to generate the new file if it does not exist already.
# varibale declaration for filename.
file_name=""

# Prompt user to choose a file name.
while true; do
  read -p "Enter a file name to be created: " file_name
  # User input verifiaction if entry is not empty.
  if [ -z "$file_name" ]; then
    echo "Error : No file name. File name cannot be empty."
  else
    break
  fi
done

# File creation with option -c to check if the file already exist. If so it won't be created.
touch -c home/user/$username/$directory_name/"$file_name"
# Similar to with mkdir p above. Verification with option c.
echo "File '$file_name' was created with success."

# Prompt user with welcome message.
echo "Welcome $username on your new workstation and in the BASH terminal $(hostname)!" > "$file_name"
echo "We are please to see that your machine $(hostname) is also doing well" >> "$file_name"
# Prompt to inform user on his permissions. ls : list short, -ld flag list the directory itself and not it's content(-l: detailled listing & -d shows only metadata of the directory)
# Pipe operator | is used to take the output of ls -ld to and passes it as input to the next command on the right side.
# awk cmd is used to extract and print the first column form the ls -ld output which is the persmissions of the directory.
# {prnt $1} is use to tell awk to print the first (1st) field wich is (drwxr-xr-x).
# Redirectin operator is used to add (append) the output of the cmd to a file.
echo "Your work directory is '$directory_name' has the following permissions: $(ls -ld "$directory_name" | awk '{print $1}')." >> "$file_name"
# hostname -I is used to display ip address with the same commands to add info to file.
echo "Your IP address is : $(hostname -I | awk '{print $1}')." >> "$file_name"

# Display file content on stdout (bash terminal)
cat "$file_name"