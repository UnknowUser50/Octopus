#!/bin/bash

daate=$(date +%c)
export BLUE='\033[1;94m'
export GREEN='\033[1;92m'
export RED='\033[1;91m'
export YELLOW='\033[1;93m'
export RESETCOLOR='\033[1;00m'

preface() {

cd
command -v git > /dev/null 2>&1 || { echo -e "$RED[$YELLOW!$RED] This script requieres git but it's not installed. Install it"; exit 1; }
echo -e -n "$BLUE[$GREEN*$BLUE] Enter current user : \e[0m"
read current_user

}

banner() {

clear
# Run this script as sudo or end 
if [[ $UID != 0 ]]; then
	printf "$RED[$YELLOW!$RED] Please, run this script as \e[31msudo\e[33m:\n"
	printf "$RED[$YELLOW!$RED] sudo $0 $*\n"
	# Exit error code
	exit 1
fi	
printf "$BLUE            _                   _       _         \n"
printf "$BLUE           | |                 | |     | |        \n"
printf "$BLUE  ___   ___| |_ _   _ _ __   __| | __ _| |_ ___   \n"
printf "$BLUE / _ \ / __| __| | | | '_ \ / _' |/ _' | __/ _ \  \n"
printf "$BLUE| (_) | (__| |_| |_| | |_) | (_| | (_| | ||  __/  \n"
printf "$BLUE \___/ \___|\__|\__,_| .__/ \__,_|\__,_|\__\___|  \n"
printf "$BLUE                     | |                          \n"
printf "$BLUE                     |_|                          \n"
printf "\n"

}

backup() {

if [ -d /home/$current_user/Backup-Octopus ]; then
printf "$RED[$YELLOW!$RED]$RED A backup directory already exist, the script will only moove file ... \e[0m\n"
cd /home/$current_user/Octopus/ &>/dev/null

# Moove old files to a backup directory
cd /home/$current_user/Octopus/ &>/dev/null
mv *.txt /home/$current_user/Backup-Octopus/ &>/dev/null
sleep 1
printf "$BLUE[$GREEN*$BLUE] External file(s) saved in $GREEN/home/$current_user/Backup-Octopus/$BLUE ...\e[0m\n"
sleep 1

# Moove file(s) of Network-Infos
if [ -d /home/$current_user/Octopus/Network-Infos ]; then
cd Network-Infos/ &>/dev/null
mv * /home/$current_user/Backup-Octopus/Network-Infos/ &>/dev/null
printf "$BLUE[$GREEN*$BLUE] File(s) of Network-infos are saved at $GREEN$daate$BLUE ...\n"
cd && cd /home/$current_user/Octopus/ &>/dev/null
else
printf "$RED[$YELLOW!$RED] Unknow directory or non-existant ...\n"
sleep 1
cd /home/$current_user/Octopus/ &>/dev/null
fi

# Moove file(s) of Network-Scan
if [ -d /home/$current_user/Backup-Octopus/Network-Scan ]; then
cd Network-Scan/ &>/dev/null
mv * /home/$current_user/Backup-Octopus/Network-Scan/ &>/dev/null
printf "$BLUE[$GREEN*$BLUE] File(s) of Network-Scan are saved at $GREEN$daate$BLUE ...\n"
cd && cd /home/$current_user/Octopus/ &>/dev/null
else
printf "$RED[$YELLOW!$RED] Unknow directory or non-existant ...\n"
sleep 1
cd /home/$current_user/Octopus/ &>/dev/null
fi

# Moove file(s) of Web-Scan
if [ -d /home/$current_user/Backup-Octopus/Web-Scan ]; then
cd Web-Scan/ &>/dev/null
mv * /home/$current_user/Backup-Octopus/Web-Scan/ &>/dev/null 
printf "$BLUE[$GREEN*$BLUE] File(s) of Web-Scan are saved at $GREEN$daate$BLUE ... \n"
cd
else
printf "$RED[$YELLOW!$RED] Unknow directory or non-existant ...\n"
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
printf "$BLUE[$GREEN*$BLUE] All directories and files have been saved in $GREEN/%s/Backup-Octopus/ \e[0m\n" $current_user
cd /home/$current_user &>/dev/null
fi

}

update() {

if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
	sudo echo " " > /var/log/Octopus-Logs/subsystem.log &>/dev/null
	printf "$BLUE [$GREEN*$BLUE] The log file have been cleaned $RESETCOLOR \n"
	sleep 1
elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
	sudo echo " " > /home/$current_user/Octopus-Logs/subsystem.log &>/dev/null
	printf "$BLUE [$GREEN*$BLUE] The log file have been cleaned $RESETCOLOR \n"
	sleep 1
else
	printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
	printf "$RED [$YELLOW!$RED] Check your log file in $RESETCOLOR /var/log/Octopus-Logs/ $RED or $RESETCOLOR /home/$current_user/Octopus/Octopus-Logs/ $RESETCOLOR \n"
	sleep 1
fi
	
if [ -d /home/$current_user/Octopus ]; then
printf "$RED[$YELLOW!$RED] An old version have been found, we will delete it ... \e[0m\n"
cd /home/$current_user/Octopus/
sudo rm -rf Octopus-v2.sh &>/dev/null
sudo rm -rf README.md &>/dev/null
sudo rm -rf update.sh &>/dev/nul
sudo rm -rf * &>/dev/null
cd /home/$current_user/
rm -r /home/$current_user/Octopus/ &>/dev/null

# If error -->
if [ -d /home/$current_user/Octopus ]; then
printf "$RED[$YELLOW!$RED] An error has occured, please restart the script ... \e[0m\n" 
sleep 1
exit

# Good
else
printf "$BLUE[$GREEN*$BLUE] All file(s) have been deleted ... \e[0m\n"
sleep 1
fi

# Download new version of Octopus
git clone https://github.com/UnknowUser50/Octopus &>/dev/null
cd /home/$current_user/Octopus/ &>/dev/null
chmod 755 * 
if [ -d /home/$current_user/Octopus ]; then
printf "$BLUE[$GREEN+$BLUE]$GREEN Update is complete : $BLUE$daate\e[0m\n"
exit
else
printf "$RED[$YELLOW!$RED] Downloading error, please restart the script ... \e[0m\n"
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

