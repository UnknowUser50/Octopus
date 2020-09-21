#!/bin/bash

# Run this script as sudo or end 
if [[ $UID != 0 ]]; then
	printf "\e[33m[\e[31m!\e[33m] Please, run this script as \e[31msudo\e[33m:\n"
	printf "\e[33m[\e[31m!\e[33m] sudo $0 $*\n"
	# Exit error code
	exit 1
fi	
date=$(date +%c)
clear
printf "\e[33m _           _        _ _             \n"
printf "\e[33m(_)         | |      | | |            \n"
printf "\e[33m _ _ __  ___| |_ __ _| | | ___ _ __   \n"
printf "\e[33m| | '_ \/ __| __/ _' | | |/ _ \ '__|  \n"
printf "\e[33m| | | | \__ \ || (_| | | |  __/ |     \n"
printf "\e[33m|_|_| |_|___/\__\__,_|_|_|\___|_|     \n"
printf "\n"

echo -e -n "\e[32m[\e[33m+\e[32m] Enter current user : \e[0m"
read current_user
echo -e "\e[33m----------------------------------------\e[0m"
sleep 1
printf "\e[32m[\e[33m*\e[32m] System update, please wait ... \e[0m\n"
sudo apt-get update &>/dev/null
echo -ne -e '\e[32m#####               (33%)\r\e[0m'
sleep 1
echo -ne -e '\e[32m###########         (66%)\r\e[0m'
sleep 1
echo -ne -e '\e[32m################## (100%)\r\e[0m\n'
sleep 1
printf "\e[32m[\e[33m!\e[32m] System update complete...\e[0m\n"
echo -e "\e[33m----------------------------------------\e[0m"

# Checking dependencies
printf "\e[32m[\e[33m*\e[32m] I requiere git ... dowloading\e[0m\n"
sudo apt-get install -y git &>/dev/null
echo -ne -e '\e[32m#####               (33%)\r\e[0m'
sleep 1
echo -ne -e '\e[32m###########         (66%)\r\e[0m'
sleep 1
echo -ne -e '\e[32m################## (100%)\r\e[0m\n'
sleep 1
printf "\e[32m[\e[33m!\e[32m] Git installed ! \e[0m\n"
echo -e "\e[33m----------------------------------------\e[0m"
sleep 2

printf"\e[32m[\e[33m*\e[32m] I requiere macchanger ... downloading\e[0m"
sudo apt-get install -y macchanger &>/dev/null
echo -ne -e '\e[32m#####               (33%)\r\e[0m'
sleep 1
echo -ne -e '\e[32m###########         (66%)\r\e[0m'
sleep 1
echo -ne -e '\e[32m################## (100%)\r\e[0m\n'
sleep 1
printf "\e[32m[\e[33m!\e[32m] Macchanger installed ! \e[0m\n"
echo -e "\e[33m----------------------------------------\e[0m"
sleep 2

printf "\e[32m[\e[33m*\e[32m] I requiere Wireshark ... dowloading\e[0m\n"
sudo apt-get install -y wireshark &>/dev/null
echo -ne -e '\e[32m#####               (33%)\r\e[0m'
sleep 1
echo -ne -e '\e[32m##########          (66%)\r\e[0m'
sleep 1
echo -ne -e '\e[32m################## (100%)\r\e[0m\n'
sleep 1
printf "\e[32m[\e[33m!\e[32m] Wireshark installed ! \e[0m\n"
echo -e "\e[33m----------------------------------------\e[0m"
sleep 2

printf "\e[32m[\e[33m*\e[32m] I requiere Alien ... downloading\e[0m\n"
sudo apt-get install -y alien &>/dev/null
echo -ne -e '\e[32m#####               (33%)\r\e[0m'
sleep 1
echo -ne -e '\e[32m##########          (66%)\r\e[0m'
sleep 1
echo -ne -e '\e[32m################## (100%)\r\e[0m\n'
sleep 1
printf "\e[32m[\e[33m!\e[32m] Alien installed ! \e[0m\n"
echo -e "\e[33m----------------------------------------\e[0m"
sleep 2

printf "\e[32m[\e[33m*\e[32m] I requiere UFW ... downloading\e[0m\n"
sudo apt-get install -y ufw &>/dev/null
echo -ne -e '\e[32m#####               (33%)\r\e[0m'
sleep 1
echo -ne -e '\e[32m##########          (66%)\r\e[0m'
sleep 1
echo -ne -e '\e[32m################## (100%)\r\e[0m\n'
sleep 1
printf "\e[32m[\e[33m!\e[32m] UFW installed ! \e[0m\n"
echo -e "\e[33m----------------------------------------\e[0m"
sleep 1
printf "\n"

# Making directories 
if [ -d /home/$current_user/Octopus/Network-Infos ]; then
printf "\e[31m[\e[33m!\e[31m] Directory \e[33m'Network-Infos'\e[31m already exist ! \e[0m\n"
else
printf "\e[32m[\e[33m*\e[32m] Making of \e[33m'Network-Infos'\e[32m ... \e[0m\n"
cd /home/$current_user/Octopus/ &>/dev/null
sudo mkdir Network-Infos/ &>/dev/null
sleep 1
printf "\e[32m[\e[33m!\e[32m] Done at $date \e[0m\n"
fi

if [ -d /home/$current_user/Octopus/Network-Scan ]; then
printf "\e[31m[\e[33m!\e[31m] Directory \e[33m'Network-Scan'\e[31m already exist ! \e[0m\n"
else
printf "\e[32m[\e[33m*\e[32m] Making of \e[33m'Network-Scan'\e[32m ...\e[0m\n"
cd /home/$current_user/Octopus/ &>/dev/null
sudo mkdir Network-Scan/ &>/dev/null
sleep 1
printf "\e[32m[\e[33m!\e[32m] Done at $date \e[0m\n"
fi

if [ -d /home/$current_user/Octopus/Web-Scan ]; then
printf "\e[31m[\e[33m!\e[31m] Directory \e[33m'Web-Scan'\e[31m already exist ! \e[0m\n"
else
printf "\e[32m[\e[33m*\e[32m] Making of \e[33m'Web-Scan'\e[32m ...\e[0m\n"
cd /home/$current_user/Octopus/ &>/dev/null
sudo mkdir Web-Scan/ &>/dev/null
sleep 1
printf "\e[32m[\e[33m!\e[32m] Done at $date \e[0m\n"
fi

sleep 2
printf "\e[32m[+] Installation complete ! \e[0m\n\n"

