#!/bin/bash

set -ue

DEFAULT_GROUPS='audio,cdrom,plugdev,video,wheel'
DEFAULT_UID='1000'

echo 'Please create a default UNIX user account. The username does not need to match your Windows username.'
echo 'For more information visit: https://aka.ms/wslusers'

if getent passwd "$DEFAULT_UID" > /dev/null ; then
  echo 'User account already exists, skipping creation'
  exit 0
fi

while true; do
  # Prompt from the username
  read -p 'Enter new UNIX username: ' username

  # Create the user
  if /usr/bin/useradd --create-home --shell /bin/bash --uid "$DEFAULT_UID" --comment ''  "$username"; then
    if /usr/bin/usermod "$username" -aG "$DEFAULT_GROUPS"; then
      /usr/bin/passwd "$username"
      break
    else
      /usr/bin/userdel --remove "$username"
    fi
  fi
done
