#!/bin/bash

export BLUE='\033[1;94m'
export GREEN='\033[1;92m'
export RED='\033[1;91m'
export YELLOW='\033[1;93m'
export RESETCOLOR='\033[1;00m'

# S.U execution : 'sudo' 
(( ${EUID} > "0" )) && echo -e "${RED}[${YELLOW}!${RED}] You must have S.U rights to run Octopus" && exit 1

date=$(date +%c)
clear
printf "$BLUE _           _        _ _             \n"
printf "$BLUE(_)         | |      | | |            \n"
printf "$BLUE _ _ __  ___| |_ __ _| | | ___ _ __   \n"
printf "$BLUE| | '_ \/ __| __/ _' | | |/ _ \ '__|  \n"
printf "$BLUE| | | | \__ \ || (_| | | |  __/ |     \n"
printf "$BLUE|_|_| |_|___/\__\__,_|_|_|\___|_|     \n"
printf "\n"

echo -e -n "$BLUE[$GREEN+$BLUE] Enter current user : $RESETCOLOR"
read current_user

# alias 
alias Octopus="sudo bash /home/${current_user}/Octopus/Octopus.sh"
alias Octopus-Update="sudo bash /home/${current_user}/Octopus/update.sh"
alias Octopus-Install="sudo bash /home/${current_user}/Octopus/install.sh"

# Creation of the log directory & file.
if [[ -d /var/log/Octopus-Logs/ ]] && [[ -e /var/log/Octopus-Logs/Octopus.log ]]; then
	echo "" &>/dev/null
else 
	sudo mkdir /var/log/Octopus-Logs/ &>/dev/null
	printf "$BLUE[$GREEN*$BLUE] Log directory created $RESETCOLOR \n"
	sudo touch /var/log/Octopus-Logs/subsystem.log 
	printf "$BLUE[$GREEN*$BLUE] Log file created $RESETCOLOR \n"
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		printf "$BLUE[$GREEN*$BLUE] Log file already exist $RESETCOLOR \n"
	else
		printf "$RED[$YELLOW!$RED] Error in log file creation ... Placement in Octopus/ $RESETCOLOR \n"
		sudo mkdir /home/$current_user/Octopus/Octopus-Logs &>/dev/null
		sudo touch /home/$current_user/Octopus/Octopus-Logs/subsystem.log 
		printf "$BLUE[$GREEN*$BLUE] Directory and file created in$GREEN /home/$current_user/Octopus/Octopus-Logs/$RESETCOLOR \n"
	fi
fi	
# End of creation

# Rights placement
# - 'chown' : in order to be able to write in the file
# - 'chmod' : all for owner ; read only for other (group(s) & user(s))
sudo chown ${USER} /var/log/Octopus-Logs/subsystem.log && sudo chmod 744 /var/log/Octopus-Log/subsystem.log &>/dev/null

text='[+] System update, please wait'
sleep='0.05'
printf '%0s'
for slide in $(seq 0 $(expr length "${text}")); do
	echo -e -n "${BLUE}${text:$slide:1}"
	sleep ${sleep}
done
printf "\n\n"
sudo apt-get update &>/dev/null

# Checking dependencies
if [[ -e /usr/bin/git ]]; then
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking git in$GREEN /usr/bin$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
	elif [[	-e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking git in$GREEN /usr/bin$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
	else
		printf "$RED[$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
else 	
	printf "$BLUE[$GREEN!$BLUE] I requiere git ... dowloading $RESETCOLOR \n"
	sudo apt-get install -y git &>/dev/null
	printf "$BLUE[$GREEN*$BLUE] Git installed $RESETCOLOR \n"
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]GIT$GREEN installed$RESETCOLOR at $date" >> /var/log/Octopus-Logs/subsystem.log
	elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]GIT$GREEN installed$RESETCOLOR at $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
	else
		printf "$RED[$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
fi	

if [[ -e /usr/bin/traceroute ]]; then
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking traceroute in$GREEN /usr/bin$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
		printf "$BLUE[$GREEN*$BLUE] Traceroute already installed $RESETCOLOR \n"
	elif [[	-e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking traceroute in$GREEN /usr/bin$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
		printf "$BLUE[$GREEN*$BLUE] Traceroute already installed $RESETCOLOR \n"
	else
		printf "$RED[$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
else 	
printf "$BLUE[$GREEN!$BLUE] I requiere traceroute ... downloading $RESETCOLOR \n"
sudo apt-get install -y traceroute &>/dev/null
printf "$BLUE[$GREEN+$BLUE] Traceroute installed $RESETCOLOR \n"
if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Traceroute$GREEN installed$RESETCOLOR at $date" >> /var/log/Octopus-Logs/subsystem.log
	elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Traceroute$GREEN installed$RESETCOLOR at $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
	else
		printf "$RED[$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
fi	

if [[ -e /usr/bin/alien ]]; then
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking alien in$GREEN /usr/bin$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
		printf "$BLUE[$GREEN*$BLUE] Alien already installed $RESETCOLOR \n"
	elif [[	-e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking alien in$GREEN /usr/bin$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
		printf "$BLUE[$GREEN*$BLUE] Alien already installed $RESETCOLOR \n"
	else
		printf "$RED[$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
else 	
printf "$BLUE[$GREEN*$BLUE] I requiere Alien ... downloading$RESETCOLOR \n"
sudo apt-get install -y alien &>/dev/null
printf "$BLUE[$GREEN+$BLUE] Alien installed $RESETCOLOR \n"
if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Alien$GREEN installed$RESETCOLOR at $date" >> /var/log/Octopus-Logs/subsystem.log
	elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Alien$GREEN installed$RESETCOLOR at $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
	else
		printf "$RED[$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
fi	

if [[ -e /usr/bin/dpkg ]]; then
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking dpkg in$GREEN /usr/bin$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
		printf "$BLUE[$GREEN*$BLUE] Dpkg already installed $RESETCOLOR \n"
	elif [[	-e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking dpkg in$GREEN /usr/bin$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
		printf "$BLUE[$GREEN*$BLUE] Dpkg already installed $RESETCOLOR \n"
	else
		printf "$RED[$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
else 	
printf "$BLUE[$GREEN*$BLUE] I requiere Dpkg ... downloading\e[0m\n"
sudo apt-get install -y dpkg &>/dev/null
printf "$BLUE[$GREEN+$BLUE] DPKG installed $RESETCOLOR \n"
if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Dpkg$GREEN installed$RESETCOLOR at $date" >> /var/log/Octopus-Logs/subsystem.log
	elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Dpkg$GREEN installed$RESETCOLOR at $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
	else
		printf "$RED[$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
fi	

if [[ -e /usr/bin/wget ]]; then
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking wget in$GREEN /usr/bin$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
		printf "$BLUE[$GREEN*$BLUE] Wget already installed $RESETCOLOR \n"
	elif [[	-e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking wget in$GREEN /usr/bin$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
		printf "$BLUE[$GREEN*$BLUE] Wget already installed $RESETCOLOR \n"
	else
		printf "$RED[$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
else 	
printf "$BLUE[$GREEN*$BLUE] I requiere wget ... downloading $RESETCOLOR \n"
sudo apt-get install -y wget &>/dev/null
printf "$BLUE[$GREEN+$BLUE] WGET installed $RESETCOLOR \n"
if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Wget$GREEN installed$RESETCOLOR at $date" >> /var/log/Octopus-Logs/subsystem.log
	elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Wget$GREEN installed$RESETCOLOR at $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
	else
		printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
fi	

if [[ -e /etc/default/ufw ]]; then
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking ufw in$GREEN /etc/default/$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
		printf "$BLUE[$GREEN*$BLUE] Ufw already installed $RESETCOLOR \n"
	elif [[	-e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking ufw in$GREEN /etc/default/$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
		printf "$BLUE[$GREEN*$BLUE] Ufw already installed $RESETCOLOR \n"
	else
		printf "$RED[$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
else 	
printf "$BLUE[$GREEN*$BLUE] I requiere UFW ... downloading\e[0m\n"
sudo apt-get install -y ufw &>/dev/null
printf "$BLUE[$GREEN+$BLUE] UFW installed $RESETCOLOR \n"
if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Ufw$GREEN installed$RESETCOLOR at $date" >> /var/log/Octopus-Logs/subsystem.log
	elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Ufw$GREEN installed$RESETCOLOR at $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
	else
		printf "$RED[$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
fi	

if [[ -e /usr/bin/nmap ]]; then
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking nmap in$GREEN /usr/bin$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
		printf "$BLUE[$GREEN*$BLUE] Nmap already installed $RESETCOLOR \n"
	elif [[	-e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Checking nmap in$GREEN /usr/bin$RESETCOLOR at : $date -->$GREEN INSTALLED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
		printf "$BLUE[$GREEN*$BLUE] Nmap already installed $RESETCOLOR \n"
	else
		printf "$RED[$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
else 	
printf "$BLUE[$GREEN*$BLUE] I requiere Nmap ... downloading $RESETCOLOR \n"
sudo apt-get install -y nmap &>/dev/null
printf "$BLUE[$GREEN+$BLUE] Nmap installed $RESETCOLOR \n"
if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Nmap$GREEN installed$RESETCOLOR at $date" >> /var/log/Octopus-Logs/subsystem.log
	elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "[${GREEN}+${RESETCOLOR}]Nmap$GREEN installed$RESETCOLOR at $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
	else
		printf "$RED[$YELLOW!$RED] An error as occured ... $RESETCOLOR \n" && exit 1
	fi
fi	
printf "\n"

# Making directories 
if [ -d /home/$current_user/Octopus/Network-Infos ]; then
printf "$RED[$YELLOW!$RED] Directory $YELLOW'Network-Infos'$RED already exist ! $RESETCOLOR \n"
else
printf "$BLUE[$GREEN*$BLUE] Making of $GREEN'Network-Infos'$BLUE ... $RESETCOLOR \n"
cd /home/$current_user/Octopus/ &>/dev/null
sudo mkdir Network-Infos/ &>/dev/null
printf "$BLUE[$GREEN!$BLUE] Directory created : $date $RESETCOLOR \n"
fi

if [ -d /home/$current_user/Octopus/Network-Scan ]; then
printf "$RED[$YELLOW!$RED] Directory $YELLOW'Network-Scan'$RED already exist ! $RESETCOLOR \n"
else
printf "$BLUE[$GREEN*$BLUE] Making of $GREEN'Network-Scan'$BLUE ... $RESETCOLOR\n"
cd /home/$current_user/Octopus/ &>/dev/null
sudo mkdir Network-Scan/ &>/dev/null
printf "$BLUE[$GREEN!$BLUE] Directory created : $date $RESETCOLOR \n"
fi

if [ -d /home/$current_user/Octopus/Web-Scan ]; then
printf "$RED[$YELLOW!$RED] Directory $YELLOW'Web-Scan'$RED already exist ! $RESETCOLOR \n"
else
printf "$BLUE[$GREEN*$BLUE] Making of $GREEN'Web-Scan'$BLUE ... $RESETCOLOR\n"
cd /home/$current_user/Octopus/ &>/dev/null
sudo mkdir Web-Scan/ &>/dev/null
printf "$BLUE[$GREEN!$BLUE] Directory created : $date $RESETCOLOR \n"
fi
printf "$BLUE[$GREEN+$BLUE]$GREEN Installation complete ! $RESETCOLOR\n\n"
