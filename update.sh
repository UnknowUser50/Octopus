#!/bin/bash

preface() {

cd
command -v git > /dev/null 2>&1 || { echo -e "\e[31m[!] This script requieres git but it's not installed. Install it"; exit 1; }
echo -e -n "\e[32m[\e[33m*\e[32m] Enter current user : \e[0m"
read current_user

}

banner() {

clear
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

if [ -d /$current_user/Backup-Octopus ]; then
printf "\e[31m[\e[33m!\e[31m]\e[0m A backup directory already exist, the script will only moove file ... \e[0m\n"
cd /$current_user/Octopus/

# Moove file(s) of Network-Infos
if [ -d /$current_user/Octopus/Network-Infos ]; then
cd Network-Infos/
mv * /$current_user/Backup-Octopus/Network-Infos/ &>/dev/null
printf "\e[32m[\e[33m*\e[32m] File(s) of Network-infos are saved ...\n"
cd && cd /$current_user/Octopus/
else
printf "\e[31m[\e[33m!\e[31m] Unknow directory or non-existant ...\n"
sleep 1
cd /$current_user/Octopus/
fi

# Moove file(s) of Network-Scan
if [ -d /$current_user/Backup-Octopus/Network-Scan ]; then
cd Network-Scan/
mv * /$current_user/Backup-Octopus/Network-Scan/ &>/dev/null
printf "\e[32m[\e[33m*\e[32m] File(s) of Network-Scan are saved ...\n"
cd && cd /$current_user/Octopus/
else
printf "\e[31m[\e[33m!\e[31m] Unknow directory or non-existant ...\n"
sleep 1
cd /$current_user/Octopus/
fi

# Moove file(s) of Web-Scan
if [ -d /$current_user/Backup-Octopus/Web-Scan ]; then
cd Web-Scan/
mv * /$current_user/Backup-Octopus/Web-Scan/ &>/dev/null 
printf "\e[32m[\e[33m*\e[32m] File(s) of Web-Scan are saved ... \n"
cd
else
printf "\e[31m[\e533m!\e[31m] Unknow directory or non-existant ...\n"
sleep 1
cd
fi

else
mkdir /$current_user/Backup-Octopus
cd /$current_user/Octopus/
mv Network-Infos/ /$current_user/Backup-Octopus/ 
mv Network-Scan/ /$current_user/Backup-Octopus/
mv Web-Scan/ /$current_user/Backup-Octopus/
sleep 1
printf "\e[32m[\e[33m*\e[32m] All directories and files have been saved in \e[33m/%s/Backup-Octopus/ \e[0m\n" $current_user
cd /$current_user
fi

}

update() {

if [ -d /$current_user/Octopus ]; then
printf "\e[31m[\e[33m!\e[31m] An old version have been found, we will delete it ... \e[0m\n"
cd /$current_user/Octopus/
sudo rm Octopus-v2.sh &>/dev/null
sudo rm README.txt &>/dev/null
sudo rm update.sh
sudo rm -r &>/dev/null 
cd /$current_user/
rm -r /$current_user/Octopus/

if [ -d /$current_user/Octopus ]; then
printf "\e[31m[!] An error has occured, please restart the script ... \e[0m\n" 
sleep 1
exit

else
printf "\e[32m[\e[33m*\e[32m] All file(s) have been deleted ... \e[0m\n"
sleep 1
fi

# Download new version
git clone https://github.com/UnknowUser50/Octopus &>/dev/null
cd /$current_user/Octopus/
chmod 755 * 
if [ -d /$current_user/Octopus ]; then
printf "\e[32m[+] Update is complete ! \e[0m\n"
exit
else
printf "\e[31m[\e[33m!\e(31m] Downloading error, please restart the script ... \e[0m\n"
exit 
fi
fi
cd /$current_user/
rm -r Octopus/

}

banner
preface
backup
update

