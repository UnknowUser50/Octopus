#!/bin/bash

########################################################################################################################################
#
# This script is made for installing the dependencies necessary for Octopus for Windows systems which run Kali Linux from the subsystem.
#
# @Author : UnknowUser50
#
# @For : Octopus script
#
# @Release : September 2020
#
# WARNING ! Many tools are unstable on subsystem ! 
#
##########################################################################################################################################

# Colors declaration : 
export BLUE='\033[1;94m'
export RED='\033[1;91m'
export YELLOW='\033[1;93m'
export GREEN='\033[1;92m'
export RESETCOLOR='\033[1;00m'

# Informations :
sys_name=$(uname -a | grep "Linux *" | cut -d# -f1)
hostname=$(hostname)
date=$(date +%c)

__ROOT() {

(( ${EUID} > "0" )) && printf "$RED[$YELLOW!$RED] You must have S.U rights to run Octopus $RESETCOLOR\n" && exit 1

}

bannerscreen() {

clear
printf "\n"
printf "$RED      { WARNING : Many tools are unstable on Windows subsystem !! } $RESETCOLOR \n\n"
printf "$BLUE     .=====================================================.                     \n"
printf "$BLUE     ||                                                   ||                     \n"
printf "$BLUE     ||$RED   _   $RED    _--'$GREEN'--_                                $BLUE||           \n"
printf "$BLUE     ||$RED     ' $RED--''   |$GREEN    |  $RESETCOLOR .--.           |    ||      $BLUE||           \n" 
printf "$BLUE     ||$RED   ' .  $RED_|     |$GREEN    | $RESETCOLOR |    |          |    ||      $BLUE||           \n"
printf "$BLUE     ||$RED   _    $RED|  _--'$GREEN'--_| $RESETCOLOR |----| |.-  .-i |.-. ||      $BLUE||           \n"
printf "$BLUE     ||    ' $BLUE --''   |$YELLOW    |  |$RESETCOLOR    | |    |  | |  |       $BLUE ||         \n"
printf "$BLUE     ||   ' $BLUE. _|     |$YELLOW    |  |$RESETCOLOR    | |     '-( |  | ()    $BLUE ||         \n"
printf "$BLUE     ||    $BLUE_    |  _--'$YELLOW'--_| $RESETCOLOR              |  |           $BLUE ||         \n"
printf "$BLUE     ||    $BLUE  ' --''                 $RESETCOLOR    '--'              $BLUE||                \n"
printf "$BLUE     ||                                                   ||                     \n"
printf "$BLUE     .=====================================================.                     \n"
printf "\n"
echo -e -n "     $BLUE[$GREEN!$BLUE] Enter current user : $RESETCOLOR"
read current_user
printf "\n\n"
printf "$BLUE     [$GREEN*$BLUE] Making Logs directory in$GREEN /var/log/$BLUE ... $RESETCOLOR \n"
if [[ -d /var/log/Octopus-Logs ]]; then
	printf "$BLUE     [$GREEN*$BLUE] Directory already exist ! $RESETCOLOR \n"
else
	sudo mkdir /var/log/Octopus-Logs &>/dev/null
fi	
if [[ -d /var/log/Octopus-Logs ]]; then
	sudo touch /var/log/Octopus-Logs/subsystem.log
	sudo chown $current_user /var/log/Octopus-Logs/subsystem.log &>/dev/null
	date=$(date +%c)
	echo "Making of the main directory : $date" >> /var/log/Octopus-Logs/subsystem.log
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		printf "$BLUE     [$GREEN*$BLUE] The log file has been created $RESETCOLOR \n"
	else
		printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR\n"
	fi
else 
	echo -e -n "$RED [$YELLOW!$RED] An error as occured ... Do you want to place logs in Octopus directory ? ([Y]es/[n]o) $RESETCOLOR"
	read placement
	if [[ $placement == "Y" || $placement == "y" ]]; then
		printf "$BLUE [$GREEN*$BLUE] Creation of the directory in Octopus ..."
		cd /$current_user/Octopus/ &>/dev/null 
		sudo mkdir Octopus-Logs/ &>/dev/null
		printf "$BLUE [$GREEN*$BLUE] The directory has been created $RESETCOLOR \n"
		cd Octopus-Logs/ &>/dev/null
		sudo touch subsystem.log 
		date=$(date +%c)
		echo "Making of the main directory : $date" >> subsystem.log
	fi
fi	
}

global_conf() {

printf "$BLUE     [$GREEN*$BLUE] Starting SSH on subsystem ... $RESETCOLOR \n"
sudo /etc/init.d/ssh start &>/dev/null
printf "$BLUE     [$GREEN*$BLUE] SSH service started at : $GREEN$date $RESETCOLOR \n"
if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
	date=$(date +%c)
	echo "SSH service start at : $date" >> /var/log/Octopus-Logs/subsystem.log
else 
	date=$(date +%c)
	echo "SSH service start at : $date" >> /Octopus-Logs/subsystem.log
fi

# Nmap installation, checking in /bin
printf "$BLUE     [$GREEN*$BLUE] Installing NMAP for you $RESETCOLOR \n"
if [[ -e /bin/nmap ]]; then
  printf "$BLUE     [$GREEN*$BLUE] Nmap was already installed $RESETCOLOR \n"
else
  sudo apt install -y nmap &>/dev/null
  printf "$BLUE     [$GREEN*$BLUE] Nmap is now installed $RESETCOLOR \n"
  if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
  	if [[ -e /usr/bin/nmap ]]; then
		date=$(date +%c)
		echo "Nmap installed at : $date" >> /var/log/Octopus-Logs/subsystem.log
	else 
		printf "$RED     [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
	fi
  else
  	if [[ -e /usr/bin/nmap ]]; then
		date=$(date +%c)
		echo "Nmap installed at : $date" >> /Octopus-Logs/subsystem.log
	else
		printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
	fi
  fi	
fi  

# Wireshark installation, checking in /bin
printf "$BLUE     [$GREEN*$BLUE] Installing Wireshark for you $RESETCOLOR \n"
if [[ -e /bin/wireshark ]]; then
  printf "$BLUE     [$GREEN*$BLUE] WireShark was already installed $RESETCOLOR \n"
else
  sudo apt install -y wireshark &>/dev/null 
  printf "$BLUE     [$GREEN*$BLUE] Wireshark is now installed $RESETCOLOR \n"
  if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
  	if [[ -e /usr/bin/wireshark ]]; then
  		date=$(date +%c)
		echo "Wireshark installed at : $date" >> /var/log/Octopus-Logs/subsystem.log
	else
		printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
	fi
  else
  	if [[ -e /usr/bin/wiresark ]]; then
		date=$(date +%c)
		echo "Wireshark installed at : $date" >> /Octopus-Logs/subsystem.log
	else
		printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
	fi
  fi	
fi  

# SQLMAP installation, checking in /bin
printf "$BLUE     [$GREEN*$BLUE] Installing SqlMap for you  $RESETCOLOR \n"   
if [[ -e /bin/sqlmap && -e /bin/sqlmapapi ]]; then
  printf "$BLUE       [$GREEN*$BLUE] SqlMap was already installed $RESETCOLOR \n" 
  if [[ -e /var/log/Octopus-Logs/subsytem.log ]]; then
  	if [[ -e /bin/sqlmap && -e /bin/sqlmapapi ]]; then
		date=$(date +%c)
		echo "SqlMap installed at : $date" >> /var/log/Octopus-Logs/subsystem.log
	else 
		printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
	fi
   else
   	if [[ -e /bin/sqlmap && -e /bin/sqlmapapi ]]; then
		date=$(date +%c)
		echo "SqlMap installed at : $date" >> /var/log/Octopus-Logs/subsystem.log &>/dev/null
	else 
		printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
	fi
   fi	
else
  sudo apt install -y sqlmap &>/dev/null
  printf "$BLUE     [$GREEN*$BLUE] SqlMap is now installed $RESETCOLOR \n"
fi 

# Checking UFW in /bin
printf "$BLUE     [$GREEN*$BLUE] Installating UFW for you $RESETCOLOR \n"
if [[ -e /bin/ufw ]]; then
  printf "$BLUE [$GREEN*$BLUE] UFW was already installed $RESETCOLOR \n"
  if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
  	if [[ -e /bin/ufw ]]; then
		date=$(date +%c)
		echo "UFW installed at : $date" >> /var/log/Octopus-Logs/subsystem.log
	else 
		printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
	fi
   else
   	if [[ -e /bin/ufw ]]; then
		date=$(date +%c)
		echo "UFW installed at : $date" >> /Octopus-Logs/subsystem.log
	else
		printf "$RED [$YELLOW!$RED] An error as occured $RESETCOLOR \n"
	fi
   fi	
else
  sudo apt install -y ufw &>/dev/null 
  printf "$BLUE     [$GREEN*$BLUE] UFW is now installed $RESETCOLOR \n"
fi  

}

__ROOT
bannerscreen
global_conf

