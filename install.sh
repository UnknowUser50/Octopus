#!/bin/bash

export BLUE='\033[1;94m'
export GREEN='\033[1;92m'
export RED='\033[1;91m'
export YELLOW='\033[1;93m'
export RESETCOLOR='\033[1;00m'
log_path='/var/log/Octopus-Logs/Octopus.log'

(( ${EUID} > "0" )) && echo -e "${RED}[${YELLOW}+${RED}] You must have root rights to run installation script ${RESETCOLOR}" ; exit 1

date=$(date +%c)
clear
printf "$BLUE _           _        _ _             \n"
printf "$BLUE(_)         | |      | | |            \n"
printf "$BLUE _ _ __  ___| |_ __ _| | | ___ _ __   \n"
printf "$BLUE| | '_ \/ __| __/ _' | | |/ _ \ '__|  \n"
printf "$BLUE| | | | \__ \ || (_| | | |  __/ |     \n"
printf "$BLUE|_|_| |_|___/\__\__,_|_|_|\___|_|     \n"
printf "\n"

echo -e -n "${BLUE}[${GREEN}+${BLUE}] Enter current user : " ; read current_user

# Log dir/file creation
if [ ! -d /var/log/Octopus-Logs/ ] && [ ! -e /var/log/Octopus-Logs/Octopus.log ]; then
	sudo mkdir /var/log/Octopus-Logs/ &>/dev/null ; touch /var/log/Octopus-Logs/Octopus.log &>/dev/null
	echo -e "${BLUE}[${GREEN}+${BLUE}] Log file & dir created ${RESETCOLOR}"
fi 
# end

# anim
text='[+] System update, please wait'
sleep='0.05'
printf '%0s'
for slide in $(seq 0 $(expr length "${text}")); do
	echo -e -n "${BLUE}${text}:${slide}:1"
	sleep ${sleep}
done
printf "\n\n"
sudo apt update &>/dev/null

# check dependencies
if [ ! -e /usr/bin/git ]; then
	echo -e "${BLUE}[${GREEN}+${BLUE}] Installed Git for you ${RESETCOLOR}" >> ${log_path}
	sudo apt install -y git &>/dev/null
	echo -e "${BLUE}[${GREEN}+${BLUE}] Git installed ${RESETCOLOR}" >> ${log_path}
fi

if [ ! -e /usr/bin/traceroute ]; then
	echo -e "${BLUE}[${GREEN}+${BLUE}] Installed Traceroute for you ${RESETCOLOR}" >> ${log_path}
	sudo apt install -y traceroute &>/dev/null
	echo -e "${BLUE}[${GREEN}+${BLUE}] Traceroute installed ${RESETCOLOR}" >> ${log_path}
fi

if [ ! -e /usr/bin/alien ]; then
	echo -e "${BLUE}[${GREEN}+${BLUE}] Installed Alien for you ${RESETCOLOR}" >> ${log_path}
	sudo apt install -y alien &>/dev/null
	echo -e "${BLUE}[${GREEN}+${BLUE}] Alien installed ${RESETCOLOR}" >> ${log_path}
fi

if [ ! -e /usr/bin/dpkg ]; then
	echo -e "${BLUE}[${GREEN}+${BLUE}] Installed DPKG for you ${RESETCOLOR}" >> ${log_path}
	sudo apt install -y dpkg &>/dev/null
	echo -e "${BLUE}[${GREEN}+${BLUE}] dpkg installed ${RESETCOLOR}" >> ${log_path}
fi

if [ ! -e /usr/bin/wget ]; then
	echo -e "${BLUE}[${GREEN}+${BLUE}] Installed Wget for you ${RESETCOLOR}" >> ${log_path}
	sudo apt install -y wget &>/dev/null
	echo -e "${BLUE}[${GREEN}+${BLUE}] Wget installed ${RESETCOLOR}" >> ${log_path}
fi

if [ ! -e /etc/default/ufw ]; then
	echo -e "${BLUE}[${GREEN}+${BLUE}] Installed UFW for you ${RESETCOLOR}" >> ${log_path}
	sudo apt install -y ufw &>/dev/null
	echo -e "${BLUE}[${GREEN}+${BLUE}] UFW installed ${RESETCOLOR}" >> ${log_path}
fi 

if [ ! -e /usr/bin/nmap ]; then
	echo -e "${BLUE}[${GREEN}+${BLUE}] Installed Nmap for you ${RESETCOLOR}" >> ${log_path}
	sudo apt install -y nmap &>/dev/null
	echo -e "${BLUE}[${GREEN}+${BLUE}] Nmap installed ${RESETCOLOR}" >> ${log_path}	
fi

# Making dir for Octopus script : 
if [ ! -d "{HOME}/Octopus/Network-Infos" ]; then
	mkdir ${HOME}/Octopus/Network-Infos &>/dev/null ; chown ${USER} ${HOME}/Octopus/Network-Infos &>/dev/null
else
	echo -e "${BLUE}[${GREEN}+${BLUE}] Network-Infos already exists ${RESETCOLOR}"
fi

if [ ! -d "${HOME}/Octopus/Network-Scan" ]; then
	mkdir ${HOME}/Octopus/Network-Scan &>/dev/null ; chown ${USER} ${HOME}/Octopus/Network-Scan &>/dev/null
else
	echo -e "${BLUE}[${GREEN}+${BLUE} Network-Scan already exists ${RESETCOLOR}"
fi

if [ ! -d "${HOME}/Octopus/Web-Scan" ]; then
	mkdir ${HOME}/Octopus/Web-Scan &>/dev/null ; chown ${USER} ${HOME}/Octopus/Web-Scan &>/dev/null
else
	echo -e "${BLUe}[${GREEN}+${BLUE}] Installation complete ! ${RESETCOLOR}"
fi					
