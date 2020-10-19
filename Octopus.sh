#!/bin/bash

#######################################################
#
# @Coded by : UnknowUser50
#
# @Version : v1.3 
#
# @Multi-ToolBox --> Network Analyser, web scanner, connection support
#
# @Date of creation : July 2020
#
# @Github : https://github.com/UnknowUser50/Octopus
#
#######################################################

# Colors declaration
export BLUE='\033[1;94m'
export GREEN='\033[1;92m'
export RED='\033[1;91m'
export YELLOW='\033[1;93m'
export RESETCOLOR='\033[1;00m'
# Informations
IP=`wget -qO- https://api.myip.com | tr -d '{}"' | cut -d ',' -f 1 | cut -d ':' -f 2`
sys_name=$(uname -a | grep "Linux *" | cut -d# -f1)
hostname=$(hostname)
date=$(date +%c)
country=`wget -qO- https://api.myip.com/ | tr -d '{}"' | cut -d "," -f 2 |cut -d ":" -f2`

requirements() {

# Run this script as sudo or end 
if [[ $UID != 0 ]]; then
	printf "$YELLOW[$RED!$YELLOW] Please, run this script as $REDsudo$RESETCOLOR\n"
	printf "$YELLOW[$RED!$YELLOW] sudo $0 $*\n"
	# Exit error code
	exit 1
fi	
# Checking dependencies

#command -v zenmap > /dev/null 2>&1 || { echo >&2 "I requiere ZenMap but it's not installed. Install it."; exit 1; }
command -v wireshark > /dev/null 2>&1 || { echo -e >&2 "$RED [$YELLOW!$RED] Run the installation script ! Dependencies are not installed ! $RESETCOLOR"; exit 1; }
command -v ufw > /dev/null 2>&1 || { echo -e >&2 "$RED [$YELLOW!$RED] Run the installation script ! Dependencies are not installed ! $RESETCOLOR"; exit 1; }
command -v wget > /dev/null 2>&1 || { echo -e >&2 "$RED [$YELLOW!$RED] Run the installation script ! Dependencies are not installed ! $RESETCOLOR"; exit 1; }
command -v macchanger > /dev/null 2>&1 || { echo -e >&2 "$RED [$YELLOW!$RED] Run the installation script ! Dependencies are not installed ! $RESETCOLOR"; exit 1; }
command -v nmap > /dev/null 2>&1 || { echo -e >&2 "$RED [$YELLOW!$RED] Run the installation script ! Dependencies are not installed ! $RESETCOLOR"; exit 1; }

}

kill_app() {

clear
printf "\n"
printf "$BLUE                   [$GREEN!$BLUE] Dangerous Killer [$GREEN*$BLUE]         $RESETCOLOR \n\n"
printf "$BLUE -._    _.--''''--._    _.--''''--._    _.--''''--._    _                     $RESETCOLOR \n"
printf "$BLUE    '-:'.'|'|'':-.  '-:'.'|'|'':-.  '-:'.'|'|'':-.  '.' : '.                  $RESETCOLOR \n"
printf "$BLUE  '.  '.  | |  | |'.  '.  | |  | |'.  '.  | |  | |'.  '.:   '.  '.            $RESETCOLOR \n"
printf "$BLUE  : '.  '.| |  | |  '.  '.| |  | |  '.  '.| |  | |  '.  '.  : '.  '.          $RESETCOLOR \n"
printf "$BLUE  '   '.  '.:_ | :_.' '.  '.:_ | :_.' '.  '.:_ | :_.' '.  '.'   '.            $RESETCOLOR \n"
printf "$BLUE         '-..,..-'       '-..,..-'       '-..,..-'       '         '          $RESETCOLOR \n"
printf "\n\n"

# Killing applications 
echo -e -n "$BLUE [$GREEN*$BLUE] Killing dangerous application on your computer ... $RESETCOLOR \n"
sleep 1
sudo killall -q dropbox chrome thunderbird steam firefox xchat discord chromium &>/dev/null
sleep 1
echo -e -n "$BLUE [$GREEN*$BLUE] Dangerous application killed !$RESETCOLOR \n"
sleep 1

# Cleaning application cache
echo -e -n "$BLUE [$GREEN*$BLUE] Cleaning cache application ... $RESETCOLOR \n"
sleep 1
beachbit -c adobe_reader.cache chromium.cache thunderbird.cache firefox.cache xchat.cache dropbox.cache &>/dev/null
sleep 1
echo -e -n "$BLUE [$GREEN*$BLUE] Cache cleaned ! $RESETCOLOR \n"
sleep 1
echo -e -n "$BLUE [$GREEN*$BLUE] Starting Octopus ... $RESETCOLOR \n"
sleep 1

}

preface() {

# User identification
sudo apt-get update &>/dev/null
echo -e -n "$BLUE          [$GREEN+$BLUE] Enter current user : $RESETCOLOR"
read current_user
# Making directory Network-Infos/
if [ -d "/$current_user/Octopus/Network-Infos" ]; then
	echo -e "$RED[$YELLOW+$REd] The directory : Network-Infos already exists ! $RESETCOLOR" &>/dev/null
elif [ ! -d "/$current_user/Octopus/Network-Infos" ]; then
	sudo mkdir Network-Infos/ &>/dev/null
	sudo chown $current_user Network-Infos/
fi
# Making directory Network-Scan/
if [ -d "/$current_user/Octopus/Network-Scan" ]; then
	echo -e "$RED[$YELLOW+$RED] The directory : Network-Scan already exists ! $RESETCOLOR" &>/dev/null
elif [ ! -d "/$current_user/Ocotpus/Network-Scan" ]; then
	sudo mkdir Network-Scan/ &>/dev/null
	sudo chown $current_user Network-Scan/
fi
# Making directory Web-Scan
if [ -d "/$current_user/Octopus/Web-Scan" ];then
	echo -e "$RED[$YELLOW+$REd] The directory : Web-Scan already exists ! $RESETCOLOR" &>/dev/null
elif [ ! -d "/$current_user/Octopus/Web-scan" ];then
	sudo mkdir Web-Scan/ &>/dev/null
	sudo chown $current_user Web-Scan/
fi
requirements

}


bannerscreen() {

clear
printf "$BLUE                            ___                               \n"
printf "$BLUE                         .-'   ''.                            \n"
printf "$BLUE                        /         \                           \n"
printf "$BLUE                        |         |                           \n"
printf "$BLUE                        |         |           ___.--,         \n"
printf "$BLUE               _.._     |0) ~ (0) |    _.---''__.-( (_.       \n"
printf "$BLUE        __.--''_.. '.__.\    '--. \_.-' ,.--''     ''''       \n"
printf "$BLUE       ( ,.--''   ',__ /./;   ;, '.__.''    __                \n"
printf "$BLUE       _') )  .---.__.' / |   |\   \__..--''  '''--.,_        \n"
printf "$BLUE      '---' .'.''-._.-''_./  /\ '.  \ _.-~~~''''~~~-._'-.__.' \n"
printf "$GREEN     TOR$BLUE     | |  .' _.-' |  |  \  \  '.               '~---'  \n"
printf "$BLUE             \ \/ .'      \  \   '. '-._)             $GREEN WEB    \n"
printf "$BLUE              \/ /        \  \    '=.__'~-.                   \n"
printf "$BLUE              / /\         ') )    / / '''.'\                 \n"
printf "$BLUE        , _.-'.'\ \        / /    ( (     / /                 \n"
printf "$BLUE         '--~'   ) )    .-'.'      '.'.  | (                  \n"
printf "$BLUE                (/'    ( ('          ) )  '-;                 \n"
printf "$BLUE                 '      '-;         (-'                       \n"
printf "$BLUE $GREEN         NET-SCAN   $BLUE  _            $GREEN   NET-INFO           \n"
printf "$BLUE                      | |                                     \n"
printf "$BLUE             ___   ___| |_ ___  _ __  _   _ ___               \n"
printf "$BLUE            / _ \ / __| __/ _ \| '_ \| | | / __|              \n"
printf "$BLUE           | (_) | (__| || (_) | |_) | |_| \__ \              \n"
printf "$BLUE            \___/ \___|\__\___/| .__/ \__,_|___/              \n"
printf "$BLUE                               | |                            \n"
printf "$BLUE                               |_|                            \n"
printf "$BLUE								   \n"
printf "$BLUE          $GREEN[$BLUE Your IP $GREEN]$BLUE : $IP            \n"
printf "$BLUE	  $GREEN[$BLUE Country $GREEN]$BLUE : $country       \n"
printf "$BLUE          $GREEN[$BLUE Systeme name $GREEN]$BLUE : $sys_name \n"
printf "$BLUE          $GREEN[$BLUE Host name $GREEN]$BLUE : $hostname    \n"
printf "$BLUE          $GREEN[$BLUE Date $GREEN]$BLUE : $date		   \n"
printf "$BLUE	  $GREEN[$BLUE Lunched by $GREEN]$BLUE : $USER		   \n"
printf "                                                                    \n"
printf "          $RED{ \033[1;92mBy UnknowUser50 || version 1.3.0 || 2020 $RED}           \n\e[0m"
echo "                                                                       "

}

mainmenu() {

# Main var
ni=1000
ns=1001
ws=1010
oc=1011
doc=1100
ex=1111

clear
printf "$BLUE                     _                                          \n"
printf "$BLUE                    (_)                                         \n"
printf "$BLUE     _ __ ___   __ _ _ _ __  _ __ ___   ___ _ __  _   _         \n"
printf "$BLUE    | '_ ' _ \ / _' | | '_ \| '_ ' _ \ / _ \ '_ \| | | |        \n"
printf "$BLUE    | | | | | | (_| | | | | | | | | | |  __/ | | | |_| |        \n"
printf "$BLUE    |_| |_| |_|\__,_|_|_| |_|_| |_| |_|\___|_| |_|\__,_|        \n"
printf "                                                                      \n"
printf "$BLUE --------------------------------------------------- \E[0m      \n"
printf "$BLUE | Main menu                                         \E[0m      \n"
printf "$BLUE --------------------------------------------------- \E[0m      \n"
printf "$BLUE                                                     \E[0m      \n"
printf "$GREEN {1000}-- $BLUE Network information                        \E[0m      \n"
printf "$GREEN {1001}-- $BLUE Network scanning                           \E[0m      \n"
printf "$GREEN {1010}-- $BLUE Web scanning                               \E[0m      \n"
printf "$GREEN {1011}-- $BLUE Others connexion                           \E[0m      \n"
printf "$GREEN {1100}-- $BLUE Manual/Documentation                       \E[0m      \n"
printf "$BLUE                                                     \E[0m      \n"
printf "$RED {1111}-- Exit Octopus                               \E[0m      \n"
printf "                                                                      \n"
printf "$BLUE --------------------------------------------------- \E[0m      \n"
printf "                                                                      \n"
echo -e -n "$RED Octopus@MainMenu$BLUE:~$RESETCOLOR# "
read reponse

# Condition for select module
if [[ $reponse == $ni ]]; then
	sudo cd /Network-Infos/ &>/dev/null
	network-information
elif [[ $reponse == $ns ]]; then
	sudo cd Network-Scan/ &>/dev/null
	network-scan
elif [[ $reponse == $ws ]]; then
	sudo cd Web-Scan/ &>/dev/null
	web-scan
elif [[ $reponse ==  $oc ]]; then
	other-connexion
elif [[ $reponse == $doc ]]; then
	documentation
elif [[ $reponse == $ex ]]; then
	printf "$RED [+] Leaving Octopus ... \e[0m\n"
	sleep 2
exit
# If reponse = 0 || reponse != VAR
elif [[ -z $reponse ]]; then
	printf "$RED [+] You may choose at least one module ! $RESETCOLOR\n"
	sleep 3
	mainmenu
else
	mainmenu
fi

}

network-information() {

# Network var
nls=1
dg=2
who=3
trc=4
rc=5
ws=6
nint=7
quit=99

clear
printf "$BLUE              _                      _    _        __                 \n"
printf "$BLUE             | |                    | |  (_)      / _|                \n"
printf "$BLUE   _ __   ___| |___      _____  _ __| | ___ _ __ | |_ ___             \n"
printf "$BLUE  | '_ \ / _ \ __\ \ /\ / / _ \| '__| |/ / | '_ \|  _/ _ \            \n"
printf "$BLUE  | | | |  __/ |_ \ V  V / (_) | |  |   <| | | | | || (_) |           \n"
printf "$BLUE  |_| |_|\___|\__| \_/\_/ \___/|_|  |_|\_\_|_| |_|_| \___/            \n"
printf "                                                           \n"
printf "                                                           \n"
printf "$BLUE ---------------------------------------------------- \n\E[0m"
printf "$BLUE | Network information                                \n\E[0m"
printf "$BLUE ---------------------------------------------------- \n\E[0m"
printf "                                                           \n"
printf "$GREEN {1}-- $BLUE Use Nslookup                                   \n\E[0m"
printf "$GREEN {2}-- $BLUE Use Dig                                        \n\E[0m"
printf "$GREEN {3}-- $BLUE Use Whois                                      \n\E[0m"
printf "$GREEN {4}-- $BLUE Use Traceroute                                 \n\E[0m"
printf "$GREEN {5}-- $BLUE Use Recon-ng                                   \n\E[0m"
printf "$GREEN {6}-- $BLUE Use WireShark                                  \n\E[0m"
printf "$GREEN {7}-- $BLUE Edit network interfaces                        \n\E[0m"
printf "                                                           \n"
printf "$RED {99}-- Back                                          \n\E[0m"
printf "                                                           \n"
printf "$BLUE ---------------------------------------------------- \n\E[0m"
printf "                                                           \n"
echo -e -n "$RED Octopus@Net-Infos$BLUE:~$RESETCOLOR# "
read choix1

	if [ $choix1 == $nls ]; then
		echo -e -n "$BLUE [$GREEN+$BLUE] Enter a domain name : \E[0m"
		read domain
		date=$(date +%c)
		printf "\n" >> /home/$current_user/Octopus/Network-Infos/domain.txt
		echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Infos/domain.txt
		nslookup $domain && nslookup $domain >> /home/$current_user/Octopus/Network-Infos/domain.txt
		printf "\n\n\n" >> /home/$current_user/Octopus/Network-Infos/domain.txt
		printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Infos/domain.txt\e[0m\n"
		sleep 2
		sudo chown $current_user /home/$current_user/Octopus/Network-Infos/domain.txt
		printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
		sleep 2
		if [[ ! -s /home/$current_user/Octopus/Network-Infos/domain.txt ]]; then
			printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
			sleep 1
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c) 
				echo -e "Trying to start NSLOOKUP on $domain at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Trying to start NSLOOKUP on $domain at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus-Logs/subsystem.log
				sleep 1
			else 
				printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
				sleep 1
			fi	
			mainmenu
		else 	
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Lunch of NSLOOKUP on $domain at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log 
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Lunch of NSLOOKUP on $domain at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus-Logs/subsystem.log 
				sleep 1
			else 
				printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
				sleep 1
			fi
		fi	
		mainmenu

	elif [ $choix1 == $dg ]; then
		echo -e -n "$BLUE [$GREEN+$BLUE] Enter a domain name/IP : \e[0m"
		read dn_ip
		date=$(date +%c)
		printf "\n" >> /home/$current_user/Octopus/Network-Infos/dig.txt
		echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Infos/dig.txt
		dig $dn_ip && dig $dn_ip >> /home/$current_user/Octopus/Network-Infos/dig.txt
		printf "\n\n\n" >> /home/$current_user/Octopus/Network-Infos/dig.txt
		printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Infos/dig.txt \n \e[0m"
		sleep 2
		sudo chown $current_user /home/$current_user/Octopus/Network-Infos/dig.txt
		printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
		sleep 2
		if [[ ! -s /home/$current_user/Octopus/Network-Infos/dig.txt ]]; then
			printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
			sleep 1
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c) 
				echo -e "Trying to start Dig on $domain at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Trying to start Dig on $domain at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus-Logs/subsystem.log
				sleep 1
			else 
				printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
				sleep 1
			fi	
		else
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo "Lunch of Dig on $dn_ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo "Lunch of Dig on $dn_ip at $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
				sleep 1
			else
				printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
				sleep 1
			fi
		fi	
		mainmenu

	elif [ $choix1 == $who ]; then
		echo -e -n "$BLUE [$GREEN+$BLUE] Enter an IP address : \e[0m"
		read ip
		date=$(date +%c)
		printf "\n" >> /home/$current_user/Octopus/Network-Infos/whois.txt
		echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Infos/whois.txt
		whois $ip && whois $ip >> /home/$current_user/Octopus/Network-Infos/whois.txt
		printf "\n\n\n" >> /home/$current_user/Octopus/Network-Infos/whois.txt
		printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Infos/whois.txt \e[0m\n"
		sleep 2
		sudo chown $current_user /home/$current_user/Octopus/Network-Infos/whois.txt
		printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
		sleep 2
		if [[ ! -s /home/$current_user/Octopus/Network-Infos/whois.txt ]]; then
			printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
			sleep 1
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Trying to start Whois on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Trying to start Whois on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
				sleep 1
			else
				printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
				sleep 1
			fi		
		else	
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo "Lunch of Whois on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo "Lunch of Whois on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log 
				sleep 1
			else 
				printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			fi
		fi	
		mainmenu

	elif [ $choix1 == $trc ]; then
		echo -e -n "$BLUE [$GREEN+$BLUE] Enter a domain name/IP : \e[0m"
		read trc_dn_ip
		date=$(date +%c)
		printf "\n" >> /home/$current_user/Octopus/Network-Infos/traceroute.txt
		echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Infos/traceroute.txt
		traceroute $trc_dn_ip && traceroute $trc_dn_ip >> /home/$current_user/Octopus/Network-Infos/traceroute.txt
		printf "\n\n\n" >> /home/$current_user/Octopus/Network-Infos/traceroute.txt
		printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Infos/traceroute.txt \n \e[0m"
		sleep 2
		sudo chown $current_user /home/$current_user/Octopus/Network-Infos/traceroute.txt
		printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
		sleep 2
		if [[ ! -s /home/$current_user/Octopus/Network-Infos/traceroute.txt ]]; then
			printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
			sleep 1
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Trying to start traceroute on $trc_dn_ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Trying to start traceroute on $trc_dn_ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
				sleep 1
			else
				printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
				sleep 1
			fi
		else	
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo "Lunch of Traceroute on $trc_dn_ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo "Lunch of Traceroute on $trc_dn_ip at : $date -->$GREEN $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
				sleep 1
			else
				printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
				sleep 1
			fi
		fi	
		mainmenu

	elif [ $choix1 == $rc ]; then
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo "Lunch of Recon-NG at : $date" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[-e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo "Lunch of Recon-NG at : $date " >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi	
		printf "$GREEN [+] Thinks to load all modules or run this before $RED'marketplace install al' \e[0m\n"
		sleep 5
		sudo recon-ng
		sleep 1
		mainmenu

	elif [ $choix1 == $ws ]; then
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo "Lunch of WireShark at : $date" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo "Lunch of WireShark at : $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi	
		printf "$BLUE [$GREEN+$BLUE] Starting WireShark ... \e[0m\n"
		sleep 2
		sudo wireshark &>/dev/null
		sleep 1
		mainmenu

		elif [ $choix1 == $nint ]; then
			# Var
			vim=1
			nano=2
			printf "$BLUE [$GREEN+$BLUE] Go to /etc/newtork/interfaces \e[0m\n"
			sleep 1
			echo -e -n "$BLUE [$GREEN+$BLUE] Do you want to use vim(1) or nano (2) : \e[0m"
			read writter
				if [ $writter == $vim ]; then
					if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
						date=$(date +%c)
						echo "Editing the network card file with $writter at : $date" >> /var/log/Octopus-Logs/subsystem.log
						sleep 1
					elif [[-e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
						date=$(date +%c)
						echo "Editing the network card file with $writter at : $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
						sleep 1
					else
						printf "$RED [$YELLOW!$RED] An error as occured $RESETCOLOR \n"
						sleep 1
					fi	
					cd .. && vim /etc/network/interfaces
					sleep 1
					printf "$RED [+] Remember to reload your network interface $RED'sudo ifup {card}' $RESETCOLOR \e[0m\n"
					sleep 5
					mainmenu

				elif [ $writter == $nano ]; then
					if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
						date=$(date +%c)
						echo "Editing the network card file with $writter at : $date" >> /var/log/Octopus-Logs/subsystem.log
						sleep 1
					elif [[-e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
						date=$(date +%c)
						echo "Editing the network card file with $writter at : $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
						sleep 1
					else
						printf "$RED [$YELLOW!$RED] An error as occured $RESETCOLOR \n"
						sleep 1
					fi	
					cd .. && sudo nano /etc/network/interfaces
					sleep 1
					printf "$GREEN [+] Remember to reload your network interface $GREEN'sudo ifup {card}' \e[0m\n"
					sleep 5
					mainmenu

				elif [ -z $writter ]; then
					printf "$RED [+] You must choose at least 1 editor ! \e[0m\n"
					mainmenu
				fi

	elif [ $choix1 == $quit ]; then
		printf "$RED [+] Back to main menu ... \e[0m\n"
		sleep 2
		mainmenu

	elif [ -z $choix1 ]; then
		printf "$RED [$YELLOW+$RED] You must choose at least one module ! \e[0m\n"
		mainmenu

	fi
}

network-scan() {

# Network-scan Var
nse=7
zmp=8
ufw=9
ex=99

clear
printf "$BLUE              _                      _                                         \n"
printf "$BLUE             | |                    | |                                        \n"
printf "$BLUE   _ __   ___| |___      _____  _ __| | _____  ___ __ _ _ __                   \n"
printf "$BLUE  | '_ \ / _ \ __\ \ /\ / / _ \| '__| |/ / __|/ __/ _' | '_ \                  \n"
printf "$BLUE  | | | |  __/ |_ \ V  V / (_) | |  |   <\__ \ (_| (_| | | | |                 \n"
printf "$BLUE  |_| |_|\___|\__| \_/\_/ \___/|_|  |_|\_\___/\___\__,_|_| |_|                 \n"
printf "                                                               \n"
printf "                                                               \n"
printf "$BLUE ------------------------------------------------         \n\E[0m"
printf "$BLUE | Network scanning                                  \n\E[0m"
printf "$BLUE ------------------------------------------------         \n\E[0m"
printf "                                                               \n"
printf "$GREEN {7}-- $BLUE Use Nmap and NSE                              \n\E[0m"
printf "$GREEN {8}-- $BLUE Use ZenMap (Graphical Nmap)                   \n\E[0m"
printf "$GREEN {9}-- $BLUE Use Linux FireWall UFW                        \n\E[0m"
printf "                                                               \n"
printf "$RED {99}- Back                                 \n\E[0m"
printf "                                                               \n"
printf "$BLUE ------------------------------------------------         \n\E[0m"
printf "                                                               \n"
printf "                                                               \n"
echo -e -n "$RED Octopus@Net-Scan$BLUE:~$RESETCOLOR# "
read choix2

if [ $choix2 == $nse ]; then
	nmap-luncher

elif [ $choix2 == $zmp ]; then
	Oui=1
	Non=2
	# ZenMap installation
	echo -e -n "$BLUE [$GREEN+$BLUE] ZenMap is install ? (Y=1|N=2) \e[0m"
	read zenrsp
	if [ $zenrsp == $Oui ]; then
		printf "$BLUE [$GREEN+$BLUE] Starting ZenMap as root ... \e[0m\n"
		sudo zenmap
		sleep 2
		mainmenu

	elif [ $zenrsp == $Non ]; then
		# Writting installation in the log file
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Beginning of ZenMap installation at : $date" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Beginning of ZenMap installation at : $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] Error in log configuration ... $RESETCOLOR \n"
			sleep 1
		fi	
		# Getting data from nmap website
		printf "$BLUE [$GREEN+$BLUE] Starting installation ... \e[0m\n"
		sudo wget -q https://nmap.org/dist/zenmap-7.80-1.noarch.rpm &>/dev/null
		if [[ -e /home/$current_user/zenmap-* || -e /root/zenmap-* ]]; then
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Successful file recovery on $GREEN https://nmap.org/ $RESETCOLOR at : $date" >> /var/log/Octopus-Logs/subsystem.log
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Successful file recovery on $GREEN https://nmap.org/ $RESETCOLOR at : $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
				sleep 1
			else
				printf "$RED [$YELLOW!$RED] Error in log configuration ... $RESETCOLOR \n"
				sleep 1
			fi
		else
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Error in file recovery on $RED https://nmap.org/ $RESETCOLOR at : $date" >> /var/log/Octopus-Logs/subsystem.log
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Error in file recovery on $RED https://nmap.org/ $RESETCOLOR at : $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
				sleep 1
			else
				printf "$RED [$YELLOW!$RED] Error in log configuration ... $RESETCOLOR \n"
				sleep 1
			fi
		fi	
		printf "$GREEN [+] Receiving data from nmap.org ... \e[0m\n"
		if [[ -e /usr/bin/alien ]]; then
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Checking Alien ... Already installed on the system at : $date" >> /var/log/Octopus-Logs/subsystem.log
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e  "Checking Alien ... Already installed on the system at : $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
				sleep 1
			else
				printf "$RED [$YELLOW!$RED] Error in log configuration ... $RESETCOLOR \n"
				sleep 1
			fi
		elif [[ ! -e /usr/bin/alien ]]; then
			sudo apt-get install alien &>/dev/null
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Alien are not installed ... We install it for you at : $date" >> /var/log/Octopus-Logs/subsystem.log
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Alien are not installed ... We install it for you at : $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
				sleep 1
			else
				printf "$RED [$YELLOW!$RED] Error in log configuration ... $RESETCOLOR \n"
				sleep 1
			fi
		fi	
		printf "$GREEN [+] Install alien ... \e[0m\n"
		alien zenmap_7.80-1.noarch.rmp &>/dev/null
		dpkg -i zenmap_7.80-2_all.deb &>/dev/null
		printf "$BLUE [$GREEN+$BLUE] Unpacking of ZenMap ... soon finishied \e[0m\n"
		sleep 1
		if [[ -e /usr/bin/zenmap ]]; then
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "ZenMap is now$GREEN installed$RESETCOLOR at : $date" >> /var/log/Octopus-Logs/subsystem.log
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "ZenMap is now$GREEN installed$RESETCOLOR at : $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
				sleep 1
			else
				printf "$RED [$YELLOW!$RED] Error in log configuration ... $RESETCOLOR \n"
				sleep 1
			fi
		elif [[ ! -e /bin/user/zenmap ]]; then
			if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Error installing ZenMap,$RED are you on a subsystem ?$RESETCOLOR Error at : $date" >> /var/log/Octopus-Logs/subsystem.log
				sleep 1
			elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
				date=$(date +%c)
				echo -e "Error installing ZenMap,$RED are you on a subsystem ?$RESETCOLOR Error at : $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
				sleep 1
			else
				printf "$RED [$YELLOW!$RED] Error in log configuration ... $RESETCOLOR \n"
				sleep 1
			fi
		else
			printf "$RED [$YELLOW!$RED] ZenMap package cannot be found, move it to$YELLOW /usr/bin/ $RESETCOLOR \n"
			sleep 3
		fi	
		printf "$BLUE [$GREEN+$BLUE] Installation complete ... start-up ZenMap as root \e[0m\n"
		sudo zenmap 
		sleep 2
		mainmenu
	fi

elif [ $choix2 == $ufw ]; then
	# New options will be available soon 
	printf "$BLUE [$GREEN+$BLUE] Starting UFW-Firewall ... \e[0m\n"
		sudo ufw enable
		printf "$BLUE [$GREEN+$BLUE] UFW is now activated \e[0m"
		sleep 2
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo "Lunch of UFW at : $date" >> /var/log/Octopus-Logs/subsystem.log 
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo "Lunch of UFW at : $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else 
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi	
		mainmenu

elif [ $choix2 == $ex ]; then
	printf "$RED [$YELLOW+$RED] Back to main menu ... \e[0m\n"
	sleep 1
	mainmenu

elif [ -z $choix2 ]; then
	printf "$RED [$YELLOW+$RED] You may choose at least one module ...\e[0m\n"
	mainmenu

fi

}

nmap-luncher() {

# Nmap Var
fs=100
ps=101
ts=102
us=103
as=104
fls=105
vs=106
trace=107
osc=108
dos=109
bjnp=110
fuzz=111
la=112
sc_s=113
top_p=114
off_dns=115
os_serv=116
dos_atk=117
ex=999

clear
printf "$BLUE         ,-.                                                                    \n"
printf "$BLUE        / \  '.  __..-,O                                                        \n"
printf "$BLUE       :   \ --''_..-'.'                                                        \n"
printf "$BLUE       |    . .-' '. '.          $GREEN _                _                            \n"
printf "$BLUE       :     .     .'.'          $GREEN| |              | |                           \n"
printf "$BLUE        \     '.  /  ..          $GREEN| |__   __ _  ___| | __                        \n"
printf "$BLUE         \      '.   ' .         $GREEN| '_ \ / _' |/ __| |/ /                        \n"
printf "$BLUE          ',       '.   '        $GREEN| | | | (_| | (__|   |                         \n"
printf "$BLUE         ,|,'.        '-.\       $GREEN|_| |_|\_',_|\___|_|\_\                        \n"
printf "$BLUE        '.||  ''-...__..-'                                                      \n"
printf "$BLUE         |  |                                                                   \n"
printf "$BLUE         |__|                                                                   \n"
printf "$BLUE         /||\                                                                   \n"
printf "$BLUE        //||\\                                                                  \n"
printf "$BLUE       // || \\                                                                 \n"
printf "$BLUE    __//__||__\\__                                                              \n"
printf "$BLUE   '--------------'                                                             \n"
printf "                                                                                      \n"
printf "                                                                                      \n"
printf "$BLUE ----------------------------------------------- \n\E[0m"
printf "$BLUE | Nmap and NSE                                  \n\E[0m"
printf "$BLUE ----------------------------------------------- \n\E[0m"
printf "                                                 \n"
printf "$GREEN {100}-- $BLUE Furtive scan                                 $GREEN {113}--$BLUE Script scan \n\E[0m"
printf "$GREEN {101}-- $BLUE 1000 Ports scan                              $GREEN {114}--$BLUE Top ports scan \n\E[0m"
printf "$GREEN {102}-- $BLUE TCP scan                                     $GREEN {115}--$BLUE Disabling DNS name resolution \n\E[0m"
printf "$GREEN {103}-- $BLUE UDP scan                                     $GREEN {116}--$BLUE OS and services scan\n\E[0m"
printf "$GREEN {104}-- $BLUE Aggressive scan                         \n\E[0m"
printf "$GREEN {105}-- $BLUE Flags scan                                   $RED ATTACK - WARNING \n\E[0m"
printf "$GREEN {106}-- $BLUE Vulnerabilities scan                         $YELLOW {117}--$RED DOS attack\n\E[0m"
printf "$GREEN {107}-- $BLUE Trace scan                              \n\E[0m"
printf "$GREEN {108}-- $BLUE OS detection                            \n\E[0m"
printf "$GREEN {109}-- $BLUE Avahi DOS                               \n\E[0m"
printf "$GREEN {110}-- $BLUE Canon devices scan                      \n\E[0m"
printf "$GREEN {111]-- $BLUE DNS fuzzing attack                      \n\E[0m"
printf "$GREEN {112}-- $BLUE List all device 			       \n\E[0m"
printf "                                                 \n"
printf "$RED {999}-- Back                           \n\E[0m"
printf "                                                 \n"
printf "$BLUE ----------------------------------------------- \n\E[0m"
printf "                                                 \n"
echo -e -n "$RED Octopus@Nmap-Scan$BLUE:~$RESETCOLOR# "
read nnmap

cd Network-Scan/

if [ $nnmap == $fs ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to furtive scan, target : \e[0m"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/Furtive.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/Furtive.txt
	sudo nmap -sS $ip && sudo nmap -sS $ip >> /home/$current_user/Octopus/Network-Scan/Furtive.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/Furtive.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/Furtive.txt\e[0m"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/Furtive.txt
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/Furtive.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap (-sS) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap (-sS) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching an nmap scan with parameter(s) $RED -sS $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching an nmap scan with parameter(s) $RED -sS $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu

elif [ $nnmap == $ps ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to ports scan, target : \e[0m"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/Ports.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/Ports.txt
	sudo nmap -p 1-1000 $ip && sudo nmap -p 1-1000 $ip >> /home/$current_user/Octopus/Network-Scan/Ports.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/Ports.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/Ports.txt\e[0m"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/Ports.txt
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/Ports.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap (-p 1-1000) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap (-p 1-1000) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else 
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching an nmap scan with parameter(s) $RED -p 1-1000 $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching an nmap scan with parameter(s) $RED -p 1-1000 $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu

elif [ $nnmap == $ts ]; then
	echo -e -n "\$BLUE [$GREEN+$BLUE] Nmap set to TCP scan, target : \e[0m"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/TCP.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/TCP.txt
	sudo nmap -sT $ip && sudo nmap -sT $ip >> /home/$current_user/Octopus/Network-Scan/TCP.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/TCP.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Infos/TCP.txt\e[0m"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/TCP.txt
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/TCP.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (-sT) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (-sT) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -sT $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -sT $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu

elif [ $nnmap == $us ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to UDP scan, target : \e[0m"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/UDP.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/UDP.txt
	sudo nmap -sU $ip && sudo nmap -sU $ip >> /home/$current_user/Octopus/Network-Scan/UDP.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/UDP.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/UDP.txt\e[0m"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/UDP.txt
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/UDP.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (-sU) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (-sU) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -sU $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -sU $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu

elif [ $nnmap == $as ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap et to aggressive scan, target : \e[0m"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/aggressive.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/aggressive.txt
	sudo nmap -A $ip && sudo nmap -A $ip >> /home/$current_user/Octopus/Network-Scan/aggressive.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/aggressive.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/aggressive.txt\e[0m"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/aggressive.txt
	printf "$BLUE [$GREEN+$BLUE] Done !\e[0m\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/aggressive.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (-A) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (-A) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -A $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -A $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu

elif [ $nnmap == $fls ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to Flags scan, target : \e[0m"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/flags.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/flags.txt
	sudo nmap --script-banner $ip && sudo nmap --script banner $ip >> /home/$current_user/Octopus/Network-Scan/flags.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/flags.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/flags.txt\e[0m"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/flags.txt
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/flags.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (--script banner) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (--script banner) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --script banner $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED ---script banner $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu

elif [ $nnmap == $vs ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to vuln scan, target : \e[0m"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/vuln.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/vuln.txt
	sudo nmap --script-vuln $ip && sudo nmap --script vuln $ip >> /home/$current_user/Octopus/Network-Scan/vuln.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/vuln.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/vuln.txt\e[0m"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/vuln.txt
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/vuln.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (--script vuln) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (--script vuln) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --script vuln $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --script vuln $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu

elif [ $nnmap == $trace ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to trace scan, target : \e[0m"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/trace.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/trace.txt
	sudo nmap --script-trace $ip && sudo nmap --script-trace $ip >> /home/$current_user/Octopus/Network-Scan/trace.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/trace.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/trace.txt\e[0m"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/trace.txt
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/trace.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (--script-trace) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (--script-trace) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --script-trace $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --script-trace $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu

elif [ $nnmap == $osc ];  then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to OS detection, select OS tries (1-...(50 max)) : \e[0m"
	read os
	echo -e -n "$BLUE [$GREEN+$BLUE] Now select the target \e[0m"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/OS.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/OS.txt
	sudo nmap --max-os-tries $os $ip && sudo nmap --max-os-tries $os $ip >> /home/$current_user/Octopus/Network-Scan/OS.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/OS.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/OS.txt\e[0m"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/OS.txt
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/OS.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (--max-os-tries) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (--max-os-tries) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --max-os-tries $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --max-os-tries $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu

elif [ $nnmap == $dos ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to Avahi DOS detection, enter the target : \e[0m"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/DOS.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/DOS.txt
	sudo nmap --script=broadcast-avahi-dos $ip && sudo nmap --script=broadcast-avahi-dos $ip >> /home/$current_user/Octopus/Network-Scan/DOS.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/DOS.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/DOS.txt\e[0m"
	sleep 2
	sudo chow $current_user /home/$current_user/Octopus/Network-Scan/DOS.txt
	printf "$BLUE [$GREEN+$BLUE] Done ! e[0m\n"
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/DOS.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (--script=broadcast-avahi-dos) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (--script=broadcast-avahi-dos) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --script=broadcast-avahi-dos $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --script=broadcast-avahi-dos $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	sleep 2
	
	mainmenu

elif [ $nnmap == $bjnp ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to Canon device detection, enter the target : \e[0m"
	read ip
	date=$(date +%c)
	printf "\n" >> //home/$current_user/Octopus/Network-Scan/Canon-device.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/Canon-device.txt
	sudo nmap --script broadcast-bjnp-discover $ip && sudo nmap --script broadcast-bjnp-discover $ip >> /home/$current_user/Octopus/Network-Scan/Canon-device.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/Canon-device.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/Canon-device.txt\e[0m"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/Canon-device.txt
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/Canon-device.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (--script broadcast-bjnp-discover) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (--script broadcast-bjnp-discover) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --script broadcast-bjnp-avahi $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --script broadcast-bjnp-avahi $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu

elif [ $nnmap == $fuzz ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to DNS fuzzing attack, enter the target : \e[0m"
	read ip 
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/DNS-attack.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/DNS-attack.txt
	sudo nmap -sU --script dns-fuzz $ip && sudo nmap -sU --script dns-fuzz $ip >> /home/$current_user/Octopus/Network-Scan/DNS-attack.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/DNS-attack.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/DNS-attack.txt\e[0m"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/DNS-attack.txt
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/DNS-attack.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (--script dns-fuzz) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (--script dns-fuzz) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --script dns-fuzz $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --script dns-fuzz $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu 

elif [ $nnmap == $la ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to listing device, enter an IP range : \e[0m"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/Listing.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/Listing.txt
	sudo nmap -sL $ip | grep -v "for $ip*" && sudo nmap -sL $ip | grep -v "for $ip*" >> /home/$current_user/Octopus/Network-Scan/Listing.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/Listing.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/Listing.txt\e[0m"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/Listing.txt
	printf "$BLUE [$GREEN+$BLUE] Done !\e[0m"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/Listing.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (-sL) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (-sL) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -sL $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -sL $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu
	
elif [ $nnmap == $sc_s ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to script scan, enter an IP : $RESETCOLOR"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/Script_Scan.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/Script_Scan.txt
	sudo nmap -sC $ip && sudo nmap -sC $ip >> /home/$current_user/Octopus/Network-Scan/Script_Scan.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/Script_Scan.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Newtwork-Scan/Script_Scan.txt $RESETCOLOR\n"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/Script_Scan.txt
	printf "$BLUE [$GREEN+$BLUE] Done ! $RESETCOLOR\n"
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/Script_Scan.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (-sC) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (-sC) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -sC $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -sC $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	sleep 2
	mainmenu
	
elif [ $nnmap == $top_p ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to top-ports scan, enter number of port : $RESETCOLOR"
	read nb_p
	echo -e -n "$BLUE [$GREEN+$BLUE] Enter the target : $RESETCOLOR \n"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/top-ports.txt 
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/top-ports.txt 
	sudo nmap --top-ports $nb_p $ip && sudo nmap --top-ports $nb_p $ip >> /home/$current_user/Octopus/Network-Scan/top-ports.txt 
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/top-ports.txt 
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/top-ports.txt $RESETCOLOR\n"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/top-ports.txt &>/dev/null
	printf "$BLUE [$GREEN+$BLUE] Done ! $RESETCOLOR\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/top-ports ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (--top-ports $nb_p ) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (--top-ports $nb_p ) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --top-ports $nb_p $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED --top-ports $nb_p $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu
	
elif [ $nnmap == $off_dns ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap disabling dns name resolution ... enter the port to scan : $RESETCOLOR"
	read port
	echo -e -n "$BLUE [$GREEN+$BLUE] Enter the target : $RESETCOLOR"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/off_dns_resolv.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/off_dns_resolv.txt
	sudo nmap -p $port -n $ip && sudo nmap -p $port -n $target >> /home/$current_user/Octopus/Network-Scan/off_dns_resolv.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/off_dns_resolv.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/off_dns_resolv.txt $RESETCOLOR\n"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/off_dns_resolv.txt &>/dev/null
	printf "$BLUE [$GREEN+$BLUE] Done ! $RESETCOLOR\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/off_dns_resolv.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (-p $port -n) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (-p $port -n) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -p $port -n $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -p $port -n $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu
	
elif [ $nnmap == $os_serv ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to OS and services detection, enter the target : $RESETCOLOR"
	read ip
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Network-Scan/os_serv.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at :$GREEN $date $RESETCOLOR" >> /home/$current_user/Octopus/Network-Scan/os_serv.txt
	sudo nmap -A -T4 $ip && sudo nmap -A -T4 $ip >> /home/$current_user/Octopus/Network-Scan/os_serv.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Network-Scan/os_serv.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Network-Scan/os_serv.txt $RESETCOLOR\n"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Network-Scan/os_serv.txt &>/dev/null
	printf "$BLUE [$GREEN+$BLUE] Done ! $RESETCOLOR\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Network-Scan/os_serv.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nmap with (-A -T4) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c) 
			echo -e "Trying to use nmap with (-A -T4) on $ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -A -T4 $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nmap with parameter(s) $RED -A -T4 $RESETCOLOR on $ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	fi	
	mainmenu
	
elif [ $nnmap == $dos_atk ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Nmap set to DOS attack, enter target : $RESETCOLOR"
	read ip
	echo -e -n "$BLUE [$GREEN+$BLUE] Select the value of the max parallelism (recommanded value : $RED 800$BLUE ) : $RESETCOLOR"
	read para
	sudo nmap $ip -max-parallelism $para -Pn --script http-slowloris --script-args http-slowloris.runforever=true 
	sleep 1
	printf "$BLUE [$GREEN+$BLUE] Done ! $RESETCOLOR\n"
	sleep 2
	mainmenu

elif [ $nnmap == $ex ]; then
	printf "$RED [$YELLOW+$RED] Back to network-scan module ... \e[0m\n"
	sleep 1
	network-scan

elif [ -z $nnmap ]; then
	printf "$RED [$YELLOW+$RED] You may choose at least one module ... \e[0m\n"
	mainmenu

fi

}

web-scan() {

# Web-scan Var
nikto=10
maltego=11
zap=12
gobuster=13
dirbuster=14
legion=15
sql=16
ex=99

clear
printf "$BLUE                   _                                   \n"
printf "$BLUE                  | |                                  \n"
printf "$BLUE     __      _____| |__  ___  ___ __ _ _ __            \n"
printf "$BLUE     \ \ /\ / / _ \ '_ \/ __|/ __/ _' | '_ \           \n"
printf "$BLUE      \ V  V /  __/ |_) \__ \ (_| (_| | | | |          \n"
printf "$BLUE       \_/\_/ \___|_.__/|___/\___\__,_|_| |_|          \n"
printf "                                                             \n"
printf "                                                             \n"
printf "$BLUE ----------------------------------------------------- \n\E[0m"
printf "$BLUE | Web scanning                                        \n\E[0m"
printf "$BLUE ----------------------------------------------------- \n\E[0m"
printf "                                                             \n"
printf "$GREEN {10}-- $BLUE Use nikto                                      \n\E[0m"
printf "$GREEN {11}-- $BLUE Use Maltego                                    \n\E[0m"
printf "$GREEN {12}-- $BLUE Use ZAP                                        \n\E[0m"
printf "$GREEN {13}-- $BLUE Use Gobuster                                   \n\E[0m"
printf "$GREEN {14}-- $BLUE Use Dirbuster (Graphical GoBus.)               \n\E[0m"
printf "$GREEN {15}-- $BLUE Use Sparta/Legion                              \n\E[0m"
printf "$GREEN {16}-- $BLUE Use basic SQL injection                        \n\E[0m"
printf "                                                             \n"
printf "$RED {99}-- Back                                  \n\E[0m"
printf "                                                             \n"
printf "\E[34m ---------------------------------------------------- \n\E[0m"
printf "                                                             \n"
echo -e -n "$RED Octopus@Web-Scan$BLUE:~$RESETCOLOR# "
read choix3

if [ $choix3 == $nikto ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Starting nikto, target(IP/URL) : \e[0m"
	read url_ip
	printf "\n" >> /home/$current_user/Octopus/Web-Scan/nikto_results.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at : $date $RESETCOLOR" >> /home/$current_user/Octopus/Web-Scan/nikto_results.txt
	nikto -h $url_ip && nikto -h $url_ip >> /home/$current_user/Octopus/Web-Scan/nikto_results.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Web-Scan/nikto_results.txt
	sudo chown $current_user /home/$current_user/Octopus/Web-Scan/nikto-results.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Web-Scan/nikto_results.txt\e[0m"
	sleep 2
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
	sleep 2
	if [[ ! -s /home/$current_user/Octopus/Web-Scan/nikto_results.txt ]]; then
		printf "$RED [$YELLOW!$RED] Command error ... $RESETCOLOR \n"
		sleep 1
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nikto on $url_ip at : $date -->$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Trying to use nikto on $url_ip at : $date -->$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
		fi
	else 
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nikto on $url_ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			sleep 1
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Launching nikto on $url_ip at : $date -->$GREEN SUCCESS $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log 
			sleep 1
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi	
	fi		
	mainmenu

elif [ $choix3 == $maltego ]; then
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "Starting of Maltego at : $date" >> /var/log/Octopus-Logs/subsystem.log 
		sleep 1
	elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "Starting of Maltego at :$date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
		sleep 1
	else
		printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
		sleep 1
	fi	
	printf "$BLUE [$GREEN+$BLUE] Starting maltego ... \e[0m"
	maltego
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
	sleep 2
	mainmenu

elif [ $choix3 == $zap ]; then
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "Starting of OWASP-Zap at : $date" >> /var/log/Octopus-Logs/subsystem.log
		sleep 1
	elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "Starting of OWASP-Zap at :$date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
		sleep 1
	else
		printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
		sleep 1
	fi	
	printf "$BLUE [$GREEN+$BLUE] Starting OWASP-Zap \e[0m"
	owasp-zap 
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
	sleep 2
	mainmenu

elif [ $choix3 == $gobuster ];then
	echo -e -n "$BLUE [$GREEN+$BLUE] Choose the target URL : \e[0m"
	read url
	echo -e -n "$BLUE [$GREEN+$BLUE] Choose the path of your wordlist : \e[0m"
	read wl
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "Launching gobuster on $url with the WL $wl at : $date" >> /var/log/Octopus-Logs/subsystem.log
		sleep 1
	elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "Launching gobuster on $url with the WL $wl at :$date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
		sleep 1
	else
		printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
		sleep 1
	fi	
	date=$(date +%c)
	printf "\n" >> /home/$current_user/Octopus/Web-Scan/gobuster.txt
	echo -e "$BLUE [$GREEN*$BLUE]$RESETCOLOR Command at : $date" >> /home/$current_user/Octopus/Web-Scan/gobuster.txt
	sudo gobuster --url $url --wordlist $wl && sudo gobuster --url $url --wordlist $wl >> /home/$current_user/Octopus/Web-Scan/gobuster.txt
	printf "\n\n\n" >> /home/$current_user/Octopus/Web-Scan/gobuster.txt
	printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Web-Scan/gobuster.txt\e[0m"
	sleep 2
	sudo chown $current_user /home/$current_user/Octopus/Web-Scan/gobuster.txt
	printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
	sleep 2
	mainmenu

elif [ $choix3 == $dirbuster ]; then
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "Starting Dirbuster at : $date" >> /var/log/Octopus-Logs/subsystem.log
		sleep 1
	elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "Starting Dirbuster at : $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log 
		sleep 1
	else
		printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
		sleep 1
	fi	
	printf "$BLUE [$GREEN+$BLUE] Starting dirbuster \e[0m\n"
	sudo dirbuster 
	sleep 2
	mainmenu

elif [ $choix3 == $legion ]; then
	version1=1
	version2=2
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "Starting of Sparta/Legion at : $date" >> /var/log/Octopus-Logs/subsystem.log 
		sleep 1
	elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "Starting of Sparta/Legion at : $dare" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
		sleep 1
	else
		printf "$RED [$YELLOW!$RED] An erro as occured ... $RESETCOLOR \n"
		sleep 1
	fi	
	echo -e -n "$BLUE [$GREEN+$BLUE] Which version of Kali do you have ? (<=2019 --> 1 / >=2020 --> 2 ) : \e[0m"
	read version
		if [ $version == $version1 ]; then
			printf "$BLUE [$GREEN+$BLUE] Starting sparta \e[0m\n"
			sudo sparta &>/dev/null
			printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
			sleep 2
			mainmenu
		elif [ $version == $version2 ]; then
			printf "$BLUE [$GREEN+$BLUE] Starting legion \e[0m\n"
			sudo legion &>/dev/null
			sleep 1
			printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m\n"
			sleep 2
			mainmenu
		fi

elif [ $choix3 == $sql ]; then
	Yes=1
	no=2
	echo -e -n "$BLUE [$GREEN+$BLUE] Enter the url of the target : \e[0m"
	read target
	echo -e -n "$BLUE [$GREEN+$BLUE] Do you want to add cookies options ? (1/2) : "
	read resp_cook
	if [[ $resp_cook == $Yes ]]; then
		echo -n -e "$BLUE [$GREEN+$BLUE] Enter cookies here : \e[0m"
		read cookies
		sleep 2
		printf "$BLUE [$GREEN+$BLUE] SQL injection on $GREEN$target$BLUE with cookie : $GREEN$cookies$BLUE !\n"
		sleep 1
		sqlmap -u $target --cookie="$cookie" --dbs
		sleep 1
		printf "$BLUE [$GREEN+$BLUE] Done ! \e[0m"
	elif [[ $resp_cook == $no ]]; then
		printf "$BLUE [$GREEN+$BLUE] SQL injection without cookie on : $GREEN$target$BLUE\n"
		sudo sqlmap -u $target --dbs && sudo sqlmap --$target --dbs >> sql_results.txt
		printf "$BLUE [$GREEN+$BLUE] Your results have been saved here : $GREEN/home/$current_user/Octopus/Web-Scan/sql-results.txt\e[0m"
		sleep 2
		printf "$BLUE [$GREEN+$BLUE] Done !\e[0m\n"
		sleep 2
		mainmenu
	elif [[ -z $resp_cook ]]; then
		printf "$RED [+] You have to fill in the parameters !\e[0m\n"
		sleep 1
		mainmenu
	fi
	if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "Launching SqlMap on $target at : $date" >> /var/log/Octopus-Logs/subsystem.log
		sleep 1
	elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
		date=$(date +%c)
		echo -e "Launching SqlMap on $target at : $date" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
		sleep 1
	else
		printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
		sleep 1
	fi	
		

elif [ $choix3 == $ex ]; then
	printf "$RED [$YELLOW+$RED] Back to main menu ... \e[0m\n"
	sleep 1
	mainmenu

elif [ -z $choix3 ]; then
	printf "$RED [$YELLOW+$RED] You may choose at least one module ! \e[0m\n"
	mainmenu

fi

}

other-connexion() {

# Other-connexion Var
ssh=0
nc=1
op_nc=2
mc_ch=3
ex=9

clear
printf "$BLUE                                  _                   \n"
printf "$BLUE                                 (_)                  \n"
printf "$BLUE   ___ ___  _ __  _ __   _____  ___  ___  _ __        \n"
printf "$BLUE  / __/ _ \| '_ \| '_ \ / _ \ \/ / |/ _ \| '_ \       \n"
printf "$BLUE | (_| (_) | | | | | | |  __/>  <| | (_) | | | |      \n"
printf "$BLUE  \___\___/|_| |_|_| |_|\___/_/\_\_|\___/|_| |_|      \n"
printf "$BLUE                                                      \n"
printf "$BLUE ---------------------------------------------------- \n"
printf "$BLUE | SSH AND NETCAT CONNEXION\n"
printf "$BLUE ----------------------------------------------------- \n"
printf " \n"
printf "$GREEN {0}-- $BLUE SSH connexion \e[0m\n"
printf "$GREEN {1}-- $BLUE Netcat connexion \e[0m\n"
printf "$GREEN {2}-- $BLUE Opening & listening port with Netcat \e[0m\n"
printf "$GREEN {3}-- $BLUE Macchanger - Mac address changer randomly \e[0m\n"
printf " \n"
printf "$RED {9}-- Back \n"
printf "\n"
printf "$BLUE ----------------------------------------------------- \n"
printf "\n"
echo -e -n "$RED Octopus@Connection$BLUE:~$RESETCOLOR# "
read connexion

if [ $connexion == $ssh ]; then
	# Var for SSH status
	__status=$(ps aux | grep ssh)
	sudo service ssh start &>/dev/null
	if [[ $__status == true ]]; then
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "SSH service start at : $date by$GREEN $USER$RESETCOLOR --> Status :$GREEN RUNNING $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "SSH service start at : $date by$GREEN $USER$RESETCOLOR --> Status :$GREEN RUNNING $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
		fi
	else
		printf "$RED [$YELLOW!$RED] SSH service cannot start now, please retry later ... $RESETCOLOR \n"
		printf "$RED [$YELLOW!$RED] Stop SSH ... $RESETCOLOR \n"
		sleep 3
		sudo systemctl stop ssh &>/dev/null
		if [[ -e /var/log/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Attempting to start SSH services ... --> Status$RED FAILED $RESETCOLOR" >> /var/log/Octopus-Logs/subsystem.log
			mainmenu
		elif [[ -e /home/$current_user/Octopus/Octopus-Logs/subsystem.log ]]; then
			date=$(date +%c)
			echo -e "Attempting to start SSH services ... --> Status$RED FAILED $RESETCOLOR" >> /home/$current_user/Octopus/Octopus-Logs/subsystem.log
			mainmenu
		else
			printf "$RED [$YELLOW!$RED] An error as occured ... $RESETCOLOR \n"
			sleep 1
			mainmenu
		fi
	fi	
	printf "$BLUE [$GREEN+$BLUE] Starting SSH protocol on port 22 \e[0m\n"
	sleep 2
	echo -e -n "$BLUE [$GREEN+$BLUE] Choose the username : \e[0m"
	read username
	echo -e -n "$BLUE [$GRENN+$BLUE] Choose the IP address :\e[0m"
	read ip_net
	printf "$BLUE [$GREEN+$BLUE] Starting connexion on $username@$ip_net \e[0m\n"
	sudo ssh $username@$ip_net
	sleep 2
	printf "$BLUE [$GRENN+$BLUE] Thanks to uses Octopus \e[0m\n"
	sudo service ssh stop &>/dev/null
	mainmenu

elif [ $connexion == $nc ]; then
	# Netcat Var
	Yes=1
	No=2
	printf "$BLUE [$GREEN+$BLUE] Starting Netcat \e[0m\n"
	sleep 2
	echo -e -n "$BLUE [$GREEN+$BLUE] Enter the destination port : \e[0m\n"
	read port
	echo -e -n "$BLUE [$GREEN+$BLUE] Enter the IP address : \e[0m\n"
	read ip
	echo -e -n "$BLUE [$GREEN+$BLUE] Do you want to add an arguments ? (1/2) :\e[0m\n"
	read arg
		if [ $arg == $No ]; then
			printf "$BLUE [$GREEN+$BLUE] Start Netcat on $ip on port $port \e[0m\n"
			sleep 2
			sudo nc -nv $ip $port
			printf "$BLUE [$GREEN+$BLUE] Thanks to uses Octopus \e[0m\n"
			mainmenu

		elif [ $arg == $Yes ]; then
		echo -e -n "$BLUE [$GREEN+$BLUE] Enter your argument : \e[0m"
		read argument
		printf "$BLUE [$GREEN+$BLUE] Starting Netcat on port $GREEN $port on IP $GREEN $ip with $GREEN'$argument' \e[0m\n"
		sudo nc -nv $ip $port $argument
		printf "$BLUE [$GREEN+$BLUE] Thanks to uses Octopus \e[0m\n"
		mainmenu
	fi

elif [ $connexion == $op_nc ]; then
	echo -e -n "$BLUE [$GREEN+$BLUE] Which port do you want to open ? : \e[0m"
	read open_port
	printf "$RED [$YELLOW+$RED] WARNING ; WHEN LISTENING TO THE PORT, DO NOT CLOSE THE TAB OR COMMUNICATION WILL BE CUT OF !\e[0m\n"
	sleep 5 
	nc -l $open_port
	printf "$BLUE [$GREEN+$BLUE] End of listening, return to menu ... \e[0m\n"
	mainmenu

elif [ $connexion == $mc_ch ]; then
	# Fixed MAC ADDRESS before running
	echo -e -n "$BLUE [$GREEN+$BLUE] On which card do you want to change the MAC address ? \e[0m"
	read wifi_card
	sudo macchanger -p $wifi_card >> /home/$current_user/Octopus/Fixed_P_MAC.txt
	sleep 2
	echo -e -n "$BLUE [$GREEN+$BLUE] MAC address change frequency :\e[0m "
	read time
	printf "$BLUE [$GREEN+$BLUE] Start of macchanger, log file have been created at $GREEN/home/$current_user/Octopus/MAC_logs.txt\e[0m\n"
	cd /home/$current_user/Octopus &>/dev/null
	touch MAC_logs.txt 
	sleep 1
	sudo macchanger -r $wifi_card >> /home/$current_user/Octopus/MAC_logs.txt
	sleep $time
	sleep 1
	mainmenu

elif [ $connexion == $ex ]; then
	printf "$RED [$YELLOW+$RED] Back to main menu ... \e[0m\n"
	sleep 2
	mainmenu

elif [ -z $connexion ]; then
	printf "$RED [$YELLOW+$RED] You may choose at least one module ! \e[0m\n"
	sleep 5
	mainmenu

fi

}

documentation() {

# Documentation Var
manns=1
mandg=2
manwhois=3
manrecon=4
mannmap=5
manzen=6
manufw=7
mannikto=8
ex=99

clear
printf "$BLUE                                      _                        \n"
printf "$BLUE                                     | |                       \n"
printf "$BLUE    _ __ ___   __ _ _ __  _   _  __ _| |                       \n"
printf "$BLUE   | '_ ' _ \ / _' | '_ \| | | |/ _' | |                       \n"
printf "$BLUE   | | | | | | (_| | | | | |_| | (_| | |                       \n"
printf "$BLUE   |_| |_| |_|\__,_|_| |_|\__,_|\__,_|_|                       \n"
printf "                                                                     \n"
printf "$BLUE ------------------------------------------------------------- \n"
printf "$BLUE | Manual / Documentation                                      \n"
printf "$BLUE ------------------------------------------------------------- \n"
printf "                                                                     \n"
printf "$BLUE # Network Information manual (select number )                 \n"
printf "$GREEN {1}-- $BLUE Man nslookup                                            \n"
printf "$GREEN {2}-- $BLUE Man dig                                                 \n"
printf "$GREEN {3}-- $BLUE Man whois                                               \n"
printf "$GREEN {4}-- $BLUE Man recon-ng                                            \n"
printf "                                                                     \n"
printf "                                                                     \n"
printf "$BLUE # Network Scanning manual (select number )                    \n"
printf "$GREEN {5}-- $BLUE Man nmap                                                \n"
printf "$GREEN {6}-- $BLUE Man zenmap                                              \n"
printf "$GREEN {7}-- $BLUE Man ufw FireWall                                        \n"
printf "                                                                     \n"
printf "                                                                     \n"
printf "$BLUE # Web-Scanning mnual (select number )                         \n"
printf "$GREEN {8}-- $BLUE Man nikto                                               \n"
printf "                                                                     \n"
printf "$RED {99}-- Leave Octopus                                          \n"
printf "                                                                     \n"
echo -e -n "$RED Octopus@Manual$BLUE:~$RESETCOLOR# "
read mannu

if [ $mannu == $manns ]; then
	printf "$BLUE [$GREEN+$BLUE] Nslookup manual \e[0m\n"
	sleep 3
	sudo man nslookup
	mainmenu

elif [ $mannu == $mandg ]; then
	printf "$BLUE [$GREEN+$BLUE] Dig manual \e[0m\n"
	sleep 3
	sudo man dig
	mainmenu

elif [ $mannu == $manwhois ]; then
	printf "$BLUE [$GREEN+$BLUE] Whois manual \e[0m\n"
	sleep 3
	sudo man whois
	mainmenu

elif [ $mannu == $manrecon ]; then
	printf "$BLUE [$GREEN+$BLUE] Man recon-ng \e[0m\n"
	sleep 3
	sudo man recon-ng
	mainmenu

elif [ $mannu == $mannmap ]; then
	printf "$BLUE [$GREEN+$BLUE] Man Nmap \e[0m\n"
	sleep 3
	sudo man nmap
	mainmanu

elif [ $mannu == $manzen ]; then
	printf "$BLUE [$GREEN+$BLUE] Man ZenMap $RESETCOLOR\n"
	sleep 3
	sudo man zenmap
	mainmenu

elif [ $mannu == $manufw ]; then
	printf "$BLUE [$GREEN+$BLUE] Man UFW \e[0m\n"
	sleep 3
	sudo man ufw
	mainmenu

elif [ $mannu == $mannikto ]; then
	printf "$BLUE [$GREEN+$BLUE] Man Nikto \e[0m\n"
	sleep 3
	sudo man nikto
	mainmenu

elif [ $mannu == $ex ]; then
	printf "$RED [$YELLOW+$RED] Back to main menu ... \e[0m\n"
	sleep 3
	mainmenu

elif [ -z $mannu ]; then
	printf "$RED [$YELLOW+$RED] You may choose at least one module ! \e[0m\n"
	sleep 3
	mainmenu

fi

}

# Function for global script : DON'T TOUCH 
luncher () {

# Lunch control
kill_app
bannerscreen
preface
mainmenu

}

luncher
