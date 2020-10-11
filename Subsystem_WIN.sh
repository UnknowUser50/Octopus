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

if [[ $UID != 0 ]]; then
	printf "$YELLOW[$RED!$YELLOW] Please, run this script as sudo $RESETCOLOR\n"
	exit 1
fi	

}

bannerscreen() {

clear
printf "\n"
printf "$BLUE     .=====================================================.                     \n"
printf "$BLUE     ||                                                   ||                     \n"
printf "$BLUE     ||$RED   _   $RED    _--'$GREEN'--_                                $BLUE||           \n"
printf "$BLUE     ||$RED     ' $RED--''   |$GREEN    |  $RESETCOLOR .--.           |    ||      $BLUE||           \n" 
printf "$BLUE     ||$RED   ' .  $RED_|     |$GREEN    | $RESETCOLOR |    |          |    ||      $BLUE||           \n"
printf "$BLUE     ||$RED   _    $RED|  _--'$GREEN'--_| $RESETCOLOR |----| |.-  .-i |.-. ||      $BLUE ||           \n"
printf "$BLUE     ||    ' $BLUE --''   |$YELLOW    |  |$RESETCOLOR    | |    |  | |  |       $BLUE ||         \n"
printf "$BLUE     ||   ' $BLUE. _|     |$YELLOW    |  |$RESETCOLOR    | |     '-( |  | ()    $BLUE ||         \n"
printf "$BLUE     ||    $BLUE_    |  _--'$YELLOW'--_| $RESETCOLOR              |  |           $BLUE||         \n"
printf "$BLUE     ||    $BLUE  ' --''                 $RESETCOLOR    '--'              $BLUE||                \n"
printf "$BLUE     ||                                                   ||                     \n"
printf "$BLUE     .=====================================================.                     \n"
printf "\n"
echo -e -n "     $BLUE[$GREEN!$BLUE] Enter current user : $RESETCOLOR"
read current_user
sleep 10

}

global_conf() {

printf "$BLUE     [$GREEN*$BLUE] Starting SSH on subsystem ... $RESETCOLOR \n"
sudo /etc/init.d/ssh start &>/dev/null
printf "$BLUE     [$GREEN*$BLUE] SSH service started at : $GREEN$date $RESETCOLOR \n"
sleep 1

# Nmap installation, checking in /bin
printf "$BLUE     [$GREEN*$BLUE] Installing NMAP for you $RESETCOLOR \n"
if [[ -e /bin/nmap ]]; then
  printf "$BLUE     [$GREEN!$BLUE] Nmap was already installed $RESETCOLOR \n"
  sleep 1
else
  sudo apt install -y nmap &>/dev/null
  printf "$BLUE     [$GREEN!$BLUE] Nmap is now installed $RESETCOLOR \n"
  sleep 1
fi  

# Wireshark installation, checking in /bin
printf "$BLUE     [$GREEN*$BLUE] Installing Wireshark for you $RESETCOLOR \n"
if [[ -e /bin/wireshark ]]; then
  printf "$BLUE     [$GREEN*$BLUE] WireShark was already installed $RESETCOLOR \n"
  sleep 1
else
  sudo apt install -y wireshark &>/dev/null
  printf "$BLUE    [$GREEN*$BLUE] Wireshark is now installed $RESETCOLOR \n"
  sleep 1
fi  

# SQLMAP installation, checking in /bin
printf "$BLUE     [$GREEN*$BLUE] Installing SqlMap for you  $RESETCOLOR \n"   
if [[ -e /bin/sqlmap && -e /bin/sqlmapapi ]]; then
  printf "$BLUE     [$GREEN*$BLUE] SqlMap was already installed $RESETCOLOR \n" 
  sleep 1
else
  sudo apt install -y sqlmap &>/dev/null
  printf "$BLUE   [$GREEN*$BLUE] SqlMap is now installed $RESETCOLOR \n"
  sleep 1
fi  
}

__ROOT
bannerscreen
global_conf

