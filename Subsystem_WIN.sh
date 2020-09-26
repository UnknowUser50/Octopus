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

printf "$BLUE     .=====================================================.                     \n"
printf "$BLUE     ||                                                   ||                     \n"
printf "$BLUE     ||   _   $RED    _--'$GREEN'--_                                ||           \n"
printf "$BLUE     ||     ' $RED--''   |$GREEN    |   .--.           |    ||      ||           \n" 
printf "$BLUE     ||   ' . $RED_|     |$GREEN    |  |    |          |    ||      ||           \n"
printf "$BLUE     ||   _    $RED|  _--'$GREEN'--_|  |----| |.-  .-i |.-. ||      ||           \n"
printf "$BLUE     ||     ' $BLUE--''   |$YELLOW    |  |    | |   |  | |  |         ||         \n"
printf "$BLUE     ||   ' $BLUE. _|     |$YELLOW    |  |    | |    '-( |  | ()      ||         \n"
printf "$BLUE     ||   $BLUE_    |  _--'$YELLOW'--_|             |  |              ||         \n"
printf "$BLUE     ||   $BLUE  ' --''                      '--'              ||                \n"
printf "$BLUE     ||                                                   ||                     \n"
printf "$BLUE     `=====================================================`                     \n"
sleep 10

}

bannerscreen
