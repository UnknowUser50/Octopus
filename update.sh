#!/bin/bash

preface() {

cd
command -v git > /dev/null 2>&1 || { echo -e "\e[31m[!] This script requieres git but it's not installed. Install it"; exit 1; }
echo -e -n "\e[32m[\e[33m*\e[32m] Enter current user : \e[0m"
read current_user

}

banner() {

clear
# Run this script as sudo or end 
if [[ $UID != 0 ]]; then
	printf "\e[33m[\e[31m!\e[33m] Please, run this script as \e[31msudo\e[33m:\n"
	printf "\e[33m[\e[31m!\e[33m] sudo $0 $*\n"
	# Exit error code
	exit 1
fi	
printf "\e[32m            _                   _       _         \n"
printf "\e[32m           | |                 | |     | |        \n"
printf "\e[32m  ___   ___| |_ _   _ _ __   __| | __ _| |_ ___   \n"
printf "\e[32m / _ \ / __| __| | | | '_ \ / _' |/ _' | __/ _ \  \n"
printf "\e[32m| (_) | (__| |_| |_| | |_) | (_| | (_| | ||  __/  \n"
printf "\e[32m \___/ \___|\__|\__,_| .__/ \__,_|\__,_|\__\___|  \n"
printf "\e[32m                     | |                          \n"
printf "\e[32m                     |_|                          \n"
printf "\n"

}

backup() {

if [ -d /home/$current_user/Backup-Octopus ]; then
printf "\e[31m[\e[33m!\e[31m]\e[0m A backup directory already exist, the script will only moove file ... \e[0m\n"
cd /home/$current_user/Octopus/ &>/dev/null

# Moove old files to a backup directory
cd /home/$current_user/Octopus/ &>/dev/null
mv *.txt /home/$current_user/Backup-Octopus/ &>/dev/null
sleep 1
printf "\e[32m[\e[33m*\e[32m] External file(s) saved ...\e[0m\n"
sleep 1

# Moove file(s) of Network-Infos
if [ -d /home/$current_user/Octopus/Network-Infos ]; then
cd Network-Infos/ &>/dev/null
mv * /home/$current_user/Backup-Octopus/Network-Infos/ &>/dev/null
printf "\e[32m[\e[33m*\e[32m] File(s) of Network-infos are saved ...\n"
cd && cd /home/$current_user/Octopus/ &>/dev/null
else
printf "\e[31m[\e[33m!\e[31m] Unknow directory or non-existant ...\n"
sleep 1
cd /home/$current_user/Octopus/ &>/dev/null
fi

# Moove file(s) of Network-Scan
if [ -d /home/$current_user/Backup-Octopus/Network-Scan ]; then
cd Network-Scan/ &>/dev/null
mv * /home/$current_user/Backup-Octopus/Network-Scan/ &>/dev/null
printf "\e[32m[\e[33m*\e[32m] File(s) of Network-Scan are saved ...\n"
cd && cd /home/$current_user/Octopus/ &>/dev/null
else
printf "\e[31m[\e[33m!\e[31m] Unknow directory or non-existant ...\n"
sleep 1
cd /home/$current_user/Octopus/ &>/dev/null
fi

# Moove file(s) of Web-Scan
if [ -d /home/$current_user/Backup-Octopus/Web-Scan ]; then
cd Web-Scan/ &>/dev/null
mv * /home/$current_user/Backup-Octopus/Web-Scan/ &>/dev/null 
printf "\e[32m[\e[33m*\e[32m] File(s) of Web-Scan are saved ... \n"
cd
else
printf "\e[31m[\e533m!\e[31m] Unknow directory or non-existant ...\n"
sleep 1
cd 
fi

else
mkdir /home/$current_user/Backup-Octopus &>/dev/null
cd /home/$current_user/Octopus/ &>/dev/null
mv Network-Infos/ /home/$current_user/Backup-Octopus/ &>/dev/null 
mv Network-Scan/ /home/$current_user/Backup-Octopus/ &>/dev/null
mv Web-Scan/ /home/$current_user/Backup-Octopus/ &>/dev/null
sleep 1
printf "\e[32m[\e[33m*\e[32m] All directories and files have been saved in \e[33m/%s/Backup-Octopus/ \e[0m\n" $current_user
cd /home/$current_user &>/dev/null
fi

}

update() {

if [ -d /home/$current_user/Octopus ]; then
printf "\e[31m[\e[33m!\e[31m] An old version have been found, we will delete it ... \e[0m\n"
cd /home/$current_user/Octopus/
sudo rm -rf Octopus-v2.sh &>/dev/null
sudo rm -rf README.md &>/dev/null
sudo rm -rf update.sh &>/dev/nul
sudo rm -rf * &>/dev/null
cd /home/$current_user/
rm -r /home/$current_user/Octopus/ &>/dev/null

# If error -->
if [ -d /home/$current_user/Octopus ]; then
printf "\e[31m[!] An error has occured, please restart the script ... \e[0m\n" 
sleep 1
exit

# Good
else
printf "\e[32m[\e[33m*\e[32m] All file(s) have been deleted ... \e[0m\n"
sleep 1
fi

# Download new version of Octopus
git clone https://github.com/UnknowUser50/Octopus &>/dev/null
cd /home/$current_user/Octopus/ &>/dev/null
chmod 755 * 
if [ -d /home/$current_user/Octopus ]; then
printf "\e[32m[+] Update is complete ! \e[0m\n"
exit
else
printf "\e[31m[\e[33m!\e(31m] Downloading error, please restart the script ... \e[0m\n"
exit 
fi
fi
cd /home/$current_user/
rm -r Octopus/
cd &>/dev/null
cd Octopus/ &>/dev/null

}

banner
preface
backup
update

