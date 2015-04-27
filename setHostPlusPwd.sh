#!/bin/bash
# Changes host name and password 
# 
if (( $# != 2)); then
  echo "Usage: "
  echo $0 "<hostname> <ubuntu acct password>"
  exit 1
fi
# Change the host name in the file /etc/hostname
echo $1| sudo tee /etc/hostname
read -p "Press ENTER to continue"

# Need to set /etc/hosts
sudo vi /etc/hosts < `tty` > `tty`
read -p "Press ENTER to continue"

# Change password
sudo passwd ubuntu $2
echo "Remember to setup Wi-Fi!"
read -p "Press ENTER to continue"

# Restart
echo "Time to shutdown now!"
sudo shutdown -r now
