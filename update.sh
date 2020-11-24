#!/bin/bash

export BLUE='\033[1;94m'
export GREEN='\033[1;92m'
export RED='\033[1;91m'
export YELLOW='\033[1;93m'
export RESETCOLOR='\033[1;00m'
path="/home/${USER}"
back_path="/home/${USER}/Backup-Octopus/"

preface() {

cd
if [[ -e /usr/bin/git ]]; then
	echo "" &>/dev/null
else
	sudo apt install -y git &>/dev/null
fi	

}

banner() {

clear
printf "$BLUE            _                   _       _         \n"
printf "$BLUE           | |                 | |     | |        \n"
printf "$BLUE  ___   ___| |_ _   _ _ __   __| | __ _| |_ ___   \n"
printf "$BLUE / _ \ / __| __| | | | '_ \ / _' |/ _' | __/ _ \  \n"
printf "$BLUE| (_) | (__| |_| |_| | |_) | (_| | (_| | ||  __/  \n"
printf "$BLUE \___/ \___|\__|\__,_| .__/ \__,_|\__,_|\__\___|  \n"
printf "$BLUE                     | |                          \n"
printf "$BLUE                     |_|                          \n"
printf "\n"
echo -e -n "${BLUE}[${GREEN}+${BLUE}] Enter current user :${RESETCOLOR} "
read current_user
path="/home/${current_user}"

}

backup() {

# Check backup dir.
if [ -d ${path}/Backup-Octopus ]; then
	echo -e "${RED}[${YELLOW}+${RED}] A backup directory already exist, the script will only moove file ... ${RESETCOLOR}"
	cd ${path}/Octopus/ &>/dev/null

	# Moove old files .txt to a backup directory
	cd ${path}/Octopus/ &>/dev/null
	mv *.txt ${path}/Backup-Octopus/ &>/dev/null

# Moove file(s) of Network-Infos
	if [ -d ${path}/Octopus/Network-Infos ]; then
		sudo cp -r Network-Infos ${path}/Backup-Octopus/
		cd && cd ${path}/Octopus/ &>/dev/null
	else
		echo -e "${RED}[${YELLOW}!${RED}] $basename$0 : internal error ! ${RESETCOLOR}" && exit 1
	fi

# Moove file(s) of Network-Scan
	if [ -d ${path}/Backup-Octopus/Network-Scan ]; then
		sudo cp -r Network-Scan ${path}/Backup-Octopus/ 
		cd && cd ${path}/Octopus/ &>/dev/null
	else
		echo -e "${RED}[${YELLOW}!${RED}] $basename$0 : internal error ! ${RESETCOLOR}" && exit 1
	fi

# Moove file(s) of Web-Scan
	if [ -d ${path}/Octopus/Web-Scan ]; then
		sudo cp -r Web-Scan ${path}/Backup-Octopus/
		cd
	else
		echo -e "${RED}[${YELLOW}!${RED}] $basename$0 : internal error ! ${RESETCOLOR}" && exit 1
	fi

else
	sudo mkdir ${path}/Backup-Octopus &>/dev/null && cd ${path}/
	cd Octopus/ ; sudo cp -r Network-Infos ${back_path} ; sudo cp -r Network-Scan ${back_path} ; sudo cp -r Web-Scan ${back_path}
	cd ${path}/ 
	
fi

}

update() {

cd ${path}/ &>/dev/null
if [ -d ${path}/Octopus ]; then
	printf "$RED[$YELLOW!$RED] An old version have been found, we will delete it ... \e[0m\n"
	sudo rm -rf Octopus/ &>/dev/null

	if [ -d ${path}/Octopus ]; then
		echo -e "${BLUE}[${GREEN}+${BLUE}] All files & directories saved ${RESETCOLOR}"
	else
		cho -e "${RED}[${YELLOW}!${RED}] $basename$0 : internal error ! ${RESETCOLOR}" && exit 1
	fi

	# Download from github
	git clone https://github.com/UnknowUser50/Octopus &>/dev/null
	cd ${path}/Octopus/ && chmod 755 * 
else
	echo -e "${RED}[${YELLOW}!${RED}] $basename$0 : internal error ! ${RESETCOLOR}" && exit 1
fi

}

banner
preface
backup
update

