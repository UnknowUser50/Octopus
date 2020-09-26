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

bannerscreen() {

clear
printf "\n"
printf "$BLUE     .=====================================================.                     \n"
printf "$BLUE     ||                                                   ||                     \n"
printf "$BLUE     ||$RED   _   $RED    _--'$GREEN'--_                                $BLUE||           \n"
printf "$BLUE     ||$RED     ' $RED--''   |$GREEN    |  $RESETCOLOR .--.           |    ||      $BLUE||           \n" 
printf "$BLUE     ||$RED   ' .  $RED_|     |$GREEN    | $RESETCOLOR |    |          |    ||      $BLUE||           \n"
printf "$BLUE     ||$RED   _    $RED|  _--'$GREEN'--_| $RESETCOLOR |----| |.-  .-i |.-. ||      $BLUE||           \n"
printf "$BLUE     ||    ' $BLUE --''   |$YELLOW    |  |$RESETCOLOR   |  |   |  | |  |         $BLUE||         \n"
printf "$BLUE     ||   ' $BLUE. _|     |$YELLOW    |  |$RESETCOLOR   |  |    '-( |  | ()      $BLUE||         \n"
printf "$BLUE     ||    $BLUE_    |  _--'$YELLOW'--_| $RESETCOLOR            |  |              $BLUE||         \n"
printf "$BLUE     ||    $BLUE  ' --''                 $RESETCOLOR    '--'              $BLUE||                \n"
printf "$BLUE     ||                                                   ||                     \n"
printf "$BLUE     .=====================================================.                     \n"
printf "\n"
echo -e -n "     $BLUE[$GREEN!$BLUE] Enter current user : $RESETCOLOR"
read current_user
sleep 10

}

global_conf() {

# Editing .bashrc
nmap_WIN=`sudo cat .bashrc | grep -o "alias nmap='"/mnt/c/Program Files (x86)/Nmap/nmap.exe"'"`
nmap_WIN &>/dev/null
if [[ $? = 0 ]]; then
  printf "$BLUE [$GREEN!$BLUE] Configurations are already made $RESETCOLOR\n"
  sleep 1
else
  sudo alias nmap='"/mnt/c/Program Files (x86)/Nmap/nmap.exe"' >> /home/$current_user/.bashrc 
  printf " $BLUE [$GREEN!$BLUE] Configurations carried out ! $RESETCOLOR\"
  sleep 1
fi  

}

bannerscreen
global_conf
