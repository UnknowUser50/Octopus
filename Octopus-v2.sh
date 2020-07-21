#!/bin/bash

#######################################################
#
# @Coded by : UnknowUser50
#
# @Version : v1.0 (reedited --> 1.2.0 )
#
# @Multi-ToolBox --> Network, Webscan, connexion
#
# @Date : July 2020
#
# @Github : https://github.com/UnknowUser50/Octopus-v2
#
#######################################################

requirements() {

#command -v zenmap > /dev/null 2>&1 || { echo >&2 "I requiere ZenMap but it's not installed. Install it."; exit 1; }
command -v wireshark > /dev/null 2>&1 || { echo >&2 "I requiere WireShark but it's not installed. Install it."; exit 1; }
#command -v ufw > /dev/null 2>&1 || { echo >&2 " I requiere ufw but it's not installed. Install it."; exit 1; }

}

preface() {
sudo apt-get update &>/dev/null
echo -e -n "\e[34m[+] Enter current user : \e[0m"
read current_user
# Making directory Network-Infos/
if [ -d "/$current_user/Octopus-v2/Network-Infos" ]; then
echo -e "\E[31m[+] The directory : Network-Infos already exists ! \e[0m" &>/dev/null
elif [ ! -d "/$current_user/Octopus-v2/Network-Infos" ]; then
sudo mkdir Network-Infos/ &>/dev/null
sudo chown $current_user Network-Infos/
fi
# Making directory Network-Scan/
if [ -d "/$current_user/Octopus-v2/Network-Scan" ]; then
echo -e "\E[31m[+] The directory : Network-Scan already exists ! \e[0m" &>/dev/null
elif [ ! -d "/$current_user/Ocotpus-v2/Network-Scan" ]; then
sudo mkdir Network-Scan/ &>/dev/null
sudo chown $current_user Network-Scan/
fi
# Making directory Web-Scan
if [ -d "/$current_user/Octopus-v2/Web-Scan" ];then
echo -e "\E[31m[+] The directory : Web-Scan already exists ! " &>/dev/null
elif [ ! -d "/$current_user/Octopus-v2/Web-scan" ];then
sudo mkdir Web-Scan/ &>/dev/null
sudo chown $current_user Web-Scan/
fi
requirements

}


bannerscreen() {

clear
printf "\E[34m                            ___                               \n"
printf "\E[34m                         .-'   ''.                            \n"
printf "\E[34m                        /         \                           \n"
printf "\E[34m                        |         ;                           \n"
printf "\E[34m                        |         |           ___.--,         \n"
printf "\E[34m               _.._     |0) ~ (0) |    _.---''__.-( (_.       \n"
printf "\E[34m        __.--''_.. '.__.\    '--. \_.-' ,.--''     ''''       \n"
printf "\E[34m       ( ,.--''   ',__ /./;   ;, '.__.''    __                \n"
printf "\E[34m       _') )  .---.__.' / |   |\   \__..--''  '''--.,_        \n"
printf "\E[34m      '---' .'.''-._.-''_./  /\ '.  \ _.-~~~''''~~~-._'-.__.' \n"
printf "\E[34m            | |  .' _.-' |  |  \  \  '.               '~---'  \n"
printf "\E[34m             \ \/ .'     \  \   '. '-._)                      \n"
printf "\E[34m              \/ /        \  \    '=.__'~-.                   \n"
printf "\E[34m              / /\         ') )    / / '''.'\                 \n"
printf "\E[34m        , _.-'.'\ \        / /    ( (     / /                 \n"
printf "\E[34m         '--~'   ) )    .-'.'      '.'.  | (                  \n"
printf "\E[34m                (/'    ( ('          ) )  '-;                 \n"
printf "\E[34m                 '      '-;         (-'                       \n"
printf "\E[34m                       _                                      \n"
printf "\E[34m                      | |                                     \n"
printf "\E[34m             ___   ___| |_ ___  _ __  _   _ ___               \n"
printf "\E[34m            / _ \ / __| __/ _ \| '_ \| | | / __|              \n"
printf "\E[34m           | (_) | (__| || (_) | |_) | |_| \__ \              \n"
printf "\E[34M            \___/ \___|\__\___/| .__/ \__,_|___/              \n"
printf "\E[34m                               | |                            \n"
printf "\E[34m                               |_|                            \n"
printf "                                                                    \n"
printf "\e[101m\e[1;77m          By UnknowUser50 || version 1.2.0 || 2020            \n\e[0m"
echo "                                                                       "
echo "                                                                       "
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
printf "\E[34m                     _                                          \n"
printf "\E[34m                    (_)                                         \n"
printf "\E[34m     _ __ ___   __ _ _ _ __  _ __ ___   ___ _ __  _   _         \n"
printf "\E[34m    | '_ ' _ \ / _' | | '_ \| '_ ' _ \ / _ \ '_ \| | | |        \n"
printf "\E[34m    | | | | | | (_| | | | | | | | | | |  __/ | | | |_| |        \n"
printf "\E[34m    |_| |_| |_|\__,_|_|_| |_|_| |_| |_|\___|_| |_|\__,_|        \n"
printf "                                                                      \n"
printf "\E[34m ################################################### \E[0m      \n"
printf "\E[34m # Main menu                                         \E[0m      \n"
printf "\E[34m ################################################### \E[0m      \n"
printf "\E[34m                                                     \E[0m      \n"
printf "\E[34m {1000}-- Network information                        \E[0m      \n"
printf "\E[34m {1001}-- Network scanning                           \E[0m      \n"
printf "\E[34m {1010}-- Web scanning                               \E[0m      \n"
printf "\E[34m {1011}-- Others connexion                           \E[0m      \n"
printf "\E[34m {1100}-- Manual/Documentation                       \E[0m      \n"
printf "\E[34m                                                     \E[0m      \n"
printf "\E[34m {1111}-- Exit Octopus                               \E[0m      \n"
printf "                                                                      \n"
printf "\E[34m ################################################### \E[0m      \n"
printf "                                                                      \n"
echo -e -n "\E[36m [+] Choose the main module : \E[0m"
read reponse

if [[ $reponse == $ni ]]; then
sudo cd Network-Infos/
network-information
elif [[ $reponse == $ns ]]; then
sudo cd Network-Scan/
network-scan
elif [[ $reponse == $ws ]]; then
sudo cd Web-Scan/
web-scan
elif [[ $reponse ==  $oc ]]; then
other-connexion
elif [[ $reponse == $doc ]]; then
documentation
elif [[ $reponse == $ex ]]; then
printf "\e[31m [+] Leaving Octopus ... \e[0m\n"
sleep 2
exit
elif [[ -z $reponse ]]; then
printf "\e[31m [+] You may choose at least one module ! \e[0m\n"
sleep 3
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
printf "\E[34m              _                      _    _        __                 \n"
printf "\E[34m             | |                    | |  (_)      / _|                \n"
printf "\E[34m   _ __   ___| |___      _____  _ __| | ___ _ __ | |_ ___             \n"
printf "\E[34m  | '_ \ / _ \ __\ \ /\ / / _ \| '__| |/ / | '_ \|  _/ _ \            \n"
printf "\E[34m  | | | |  __/ |_ \ V  V / (_) | |  |   <| | | | | || (_) |           \n"
printf "\E[34m  |_| |_|\___|\__| \_/\_/ \___/|_|  |_|\_\_|_| |_|_| \___/            \n"
printf "                                                           \n"
printf "                                                           \n"
printf "\E[34m #################################################### \n\E[0m"
printf "\E[34m # Network information                                \n\E[0m"
printf "\E[34m #################################################### \n\E[0m"
printf "                                                           \n"
printf "\E[34m {1}-- Use Nslookup                                   \n\E[0m"
printf "\E[34m {2}-- Use Dig                                        \n\E[0m"
printf "\E[34m {3}-- Use Whois                                      \n\E[0m"
printf "\E[34m {4}-- Use Traceroute                                 \n\E[0m"
printf "\E[34m {5}-- Use Recon-ng                                   \n\E[0m"
printf "\E[34m {6}-- Use WireShark                                  \n\E[0m"
printf "\E[34m {7}-- Edit network interfaces                        \n\E[0m"
printf "                                                           \n"
printf "\E[34m {99}-- Back                                          \n\E[0m"
printf "                                                           \n"
printf "\E[34m #################################################### \n\E[0m"
printf "                                                           \n"
echo -e -n "\e[36m [+] Choose a module : \e[0m"
read choix1

	if [ $choix1 == $nls ]; then
	echo -e -n "\E[36m [+] Enter a domain name : \E[0m"
	read domain
	nslookup $domain && nslookup $domain > domain.txt
	sudo chown $current_user domain.txt
	printf "\e[36m [+] Done ! \e[0m\n"
	sleep 2
	mainmenu

	elif [ $choix1 == $dg ]; then
	echo -e -n "\e[36m [+] Enter a domain name/IP : \e[0m"
	read dn_ip
	dig $dn_ip && dig $dn_ip > dig.txt
	sudo chown $current_user dig.txt
	printf "\e[36m [+] Done ! \e[0m\n"
	sleep 2
	mainmenu

	elif [ $choix1 == $who ]; then
	echo -e -n "\e[36m [+] Enter an IP address : \e[0m"
	read ip
	whois $ip && whois $ip > whois.txt
	sudo chown $current_user whois.txt
	printf "\e[36m [+] Done ! \e[0m\n"
	sleep 2
	mainmenu

	elif [ $choix1 == $trc ]; then
	echo -e -n "\e[36m [+] Enter a domain name/IP : \e[0m"
	read trc_dn_ip
	traceroute $trc_dn_ip && traceroute $trc_dn_ip > traceroute.txt
	sudo chown $current_user traceroute.txt
	printf "\e[36m [+] Done ! \e[0m\n"
	sleep 2
	mainmenu

	elif [ $choix1 == $rc ]; then
	printf "\e[31m [+] Thinks to load all modules or run this before \e[101m'marketplace install al' \e[0m\n"
	sleep 5
	sudo recon-ng
	sleep 1
	mainmenu

	elif [ $choix1 == $ws ]; then
	printf "\e[34m [+] Starting WireShark ... \e[0m\n"
	sleep 2
	sudo wireshark &>/dev/null
	sleep 1
	mainmenu

	elif [ $choix1 == $nint ]; then
	# Var
	vim=1
	nano=2
	printf "\e[34m [+] Go to /etc/newtork/interfaces \e[0m\n"
	sleep 1
	echo -e -n "\e[34m [+] Do you want to use vim(1) or nano (2) : \e[0m"
	read writter
		if [ $writter == $vim ]; then
		cd .. && vim /etc/network/interfaces
		sleep 1
		printf "\e[31m [+] Remember to reload your network interface 'sudo ifup {card}' \e[0m\n"
		sleep 5
		mainmenu

		elif [ $writter == $nano ]; then
		cd .. && sudo nano /etc/network/interfaces
		sleep 1
		printf "\e[31m [+] Remember to reload your network interface 'sudo ifup {card}' \e[0m\n"
		sleep 5
		mainmenu

		elif [ -z $writter ]; then
		printf "\e[31m [+] You must choose at least 1 module ! \e[0m\n"
		mainmenu
		fi

	elif [ $choix1 == $quit ]; then
	printf "\e[31m [+] Leaving Octopus ... \e[0m\n"
	sleep 2
	exit

	elif [ -z $choix1 ]; then
	printf "\e[31m [+] You must choose at least one module ! \e[0m\n"
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
printf "\E[34m              _                      _                                         \n"
printf "\E[34m             | |                    | |                                        \n"
printf "\E[34m   _ __   ___| |___      _____  _ __| | _____  ___ __ _ _ __                   \n"
printf "\E[34m  | '_ \ / _ \ __\ \ /\ / / _ \| '__| |/ / __|/ __/ _' | '_ \                  \n"
printf "\E[34m  | | | |  __/ |_ \ V  V / (_) | |  |   <\__ \ (_| (_| | | | |                 \n"
printf "\E[34m  |_| |_|\___|\__| \_/\_/ \___/|_|  |_|\_\___/\___\__,_|_| |_|                 \n"
printf "                                                               \n"
printf "                                                               \n"
printf "\E[34m ###########################################         \n\E[0m"
printf "\E[34m # Network scanning                                  \n\E[0m"
printf "\E[34m ###########################################         \n\E[0m"
printf "                                                               \n"
printf "\E[34m {7}-- Use Nmap and NSE                              \n\E[0m"
printf "\E[34m {8}-- Use ZenMap (Graphical Nmap)                   \n\E[0m"
printf "\E[34m {9}-- Use Linux FireWall UFW                        \n\E[0m"
printf "\E[34m {10}-- Lunch aircrack-ng                            \n\E[0m"
printf "                                                               \n"
printf "\E[34m {99}- Leave Octopus                                 \n\E[0m"
printf "                                                               \n"
printf "\E[34m ###########################################         \n\E[0m"
printf "                                                               \n"
printf "                                                               \n"
echo -e -n "\E[36m [+] Choose a module : \E[0m"
read choix2

if [ $choix2 == $nse ]; then
nmap-luncher

elif [ $choix2 == $zmp ]; then
Oui=1
Non=2
echo -e -n "\e[34m [+] ZenMap is install ? (Y=1|N=2) \e[0m"
read zenrsp
	if [ $zenrsp == $Oui ]; then
	printf "\e[34m [+] Starting ZenMap as root ... \e[0m\n"
	sudo zenmap
	sleep 2
	mainmenu

	elif [ $zenrsp == $Non ]; then
	printf "\e[31m [+] Starting installation ... \e[0m\n"
	sudo wget -q https://nmap.org/dist/zenmap-7.80-1.noarch.rpm &>/dev/null
	printf "\e[32m [+] Receiving data from nmap.org ... \e[0m\n"
	sudo apt-get install alien &>/dev/null
	printf "\e[32m [+] Install alien ... \e[0m\n"
	alien zenmap_7.80-1.noarch.rpm &>/dev/null
	dpkg -i zenmap_7.80-2_all.deb &>/dev/null
	printf "\e[32m [+] Unpacking of ZenMap ... soon finishied \e[0m\n"
	sleep 1
	printf "\e[32m [+] Installation complete ... start-up ZenMap as root \e[0m\n"
	sudo zenmap
	sleep 2
	mainmenu
	fi

elif [ $choix2 == $ufw ]; then
printf "\e[36m [+] Starting UFW-Firewall ... \e[0m\n"
	sudo apt-get install ufw &>/dev/null
	sudo ufw enable
	sleep 2
	mainmenu

elif [ $choix2 == $ex ]; then
printf "\e[31m [+] Leaving Octopus ... \e[0m\n"
sleep 1
exit

elif [ -z $choix2 ]; then
printf "\e[31m [+] You may choose at least one module ...\e[0m\n"
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
ex=999

clear
printf "\E[32m         ,-.                                                                    \n"
printf "\E[32m        / \  '.  __..-,O                                                        \n"
printf "\E[32m       :   \ --''_..-'.'                                                        \n"
printf "\E[32m       |    . .-' '. '.           _                _                            \n"
printf "\E[32m       :     .     .'.'          | |              | |                           \n"
printf "\E[32m        \     '.  /  ..          | |__   __ _  ___| | __                        \n"
printf "\E[32m         \      '.   ' .         | '_ \ / _' |/ __| |/ /                        \n"
printf "\E[32m          ',       '.   '        | | | | (_| | (__|   |                         \n"
printf "\E[32m         ,|,'.        '-.\       |_| |_|\_',_|\___|_|\_\                        \n"
printf "\E[32m        '.||  ''-...__..-'                                                      \n"
printf "\E[32m         |  |                                                                   \n"
printf "\E[32m         |__|                                                                   \n"
printf "\E[32m         /||\                                                                   \n"
printf "\E[32m        //||\\                                                                  \n"
printf "\E[32m       // || \\                                                                 \n"
printf "\E[32m    __//__||__\\__                                                              \n"
printf "\E[32m   '--------------'                                                             \n"
printf "                                                                                      \n"
printf "                                                                                      \n"
printf "\E[34m ############################################### \n\E[0m"
printf "\E[34m # Nmap and NSE                                  \n\E[0m"
printf "\E[34m ############################################### \n\E[0m"
printf "                                                 \n"
printf "\E[34m {100}-- Furtive scan                            \n\E[0m"
printf "\E[34m {101}-- 1000 Ports scan                         \n\E[0m"
printf "\E[34m {102}-- TCP scan                                \n\E[0m"
printf "\E[34m {103}-- UDP scan                                \n\E[0m"
printf "\E[34m {104}-- Aggressive scan                         \n\E[0m"
printf "\E[34m {105}-- Flags scan                              \n\E[0m"
printf "\E[34m {106}-- Vulnerabilities scan                    \n\E[0m"
printf "\E[34m {107}-- Trace scan                              \n\E[0m"
printf "\E[34m {108}-- OS detection                            \n\E[0m"
printf "\E[34m {109}-- Avahi DOS                               \n\E[0m"
printf "\E[34m {110}-- Canon devices scan                      \n\E[0m"
printf "\E[34m {111]-- DNS fuzzing attack                      \n\E[0m"
printf "                                                 \n"
printf "\E[34m {999}-- Leave Octopus                           \n\E[0m"
printf "                                                 \n"
printf "\E[34m ############################################### \n\E[0m"
printf "                                                 \n"
echo -e -n "\E[36m [+] Choose Nmap's modules : \E[0m"
read nnmap

if [ ! "/$current_user/Octopus-v2/Network-Scan/Nmap" ]; then
mkdir Nmap-results/ &>/dev/null
elif [ ! -d "/$current_user/Octopus-v2/Network-Scan/Nmap" ]; then
printf "\e[31m [+] Already exists ! \e[0m\n" &>/dev/null
fi

cd Nmap-results &>/dev/null

if [ $nnmap == $fs ]; then
echo -e -n "\e[36m [+] Nmap set to furtive scan, target : \e[0m"
read ip
sudo nmap -sS $ip && sudo nmap -sS $ip > Furtive.txt
sudo chown $current_user Furtive.txt
printf "\e[36m [+] Done ! \e[0m\n"
sleep 2
mainmenu

elif [ $nnmap == $ps ]; then
echo -e -n "\e[36m [+] Nmap set to ports scan, target : \e[0m"
read ip
sudo nmap -p 1-1000 $ip && sudo nmap -p 1-1000 $ip > Ports.txt
sudo chown $current_user Ports.txt
printf "\e[36m [+] Done ! \e[0m\n"
sleep 2
mainmenu

elif [ $nnmap == $ts ]; then
echo -e -n "\e[36m [+] Nmap set to TCP scan, target : \e[0m"
read ip
sudo nmap -sT $ip && sudo nmap -sT $ip > TCP.txt
sudo chown $current_user TCP.txt
printf "\e[36m [+] Done ! \e[0m\n"
sleep 2
mainmenu

elif [ $nnmap == $us ]; then
echo -e -n "\e[36m [+] Nmap set to UDP scan, target : \e[0m"
read ip
sudo nmap -sU $ip && sudo nmap -sU $ip > UDP.txt
sudo chown $current_user UDP.txt
printf "\e[36m [+] Done ! \e[0m\n"
sleep 2
mainmenu

elif [ $nnmap == $as ]; then
echo -e -n "\e[36m [+] Nmap et to aggressive scan, target : \e[0m"
read ip
sudo nmap -A $ip && sudo nmap -A $ip > aggressive.txt
sudo chown $current_user aggressive.txt
printf "\e[36m [+] Done !\e[0m\n"
sleep 2
mainmenu

elif [ $nnmap == $fls ]; then
echo -e -n "\e[36m [+] Nmap set to Flags scan, target : \e[0m"
read ip
sudo nmap --script-banner $ip && sudo nmap --script banner $ip > flags.txt
sudo chown $current_user flags.txt
printf "\e[36m [+] Done ! \e[0m\n"
sleep 2
mainmenu

elif [ $nnmap == $vs ]; then
echo -e -n "\e[36m [+] Nmap set to vuln scan, target : \e[0m"
read ip
sudo nmap --script-vuln $ip && sudo nmap --script vuln $ip > vuln.txt
sudo chown $current_user vuln.txt
printf "\e[36m [+] Done ! \e[0m\n"
sleep 2
mainmenu

elif [ $nnmap == $trace ]; then
echo -e -n "\e[36m [+] Nmap set to trace scan, target : \e[0m"
read ip
sudo nmap --script-trace $ip && sudo nmap --script-trace $ip > trace.txt
sudo chown $current_user trace.txt
printf "\e[36m [+] Done ! \e[0m\n"
sleep 2
mainmenu

elif [ $nnmap == $osc ];  then
echo -e -n "\e[36m [+] Nmap set to OS detection, select OS tries (1-...(50 max)) : \e[0m"
read os
echo -e -n "\e[36m [+] Now select the target \e[0m"
read ip
sudo nmap --max-os-tries $os $ip && sudo nmap --max-os-tries $os $ip > OS.txt
sudo chown $current_user OS.txt
printf "\e[36m [+] Done ! \e[0m\n"
sleep 2
mainmenu

elif [ $nnmap == $dos ]; then
echo -e -n "\e[36m [+] Nmap set to Avahi DOS detection, enter the target : \e[0m"
read ip
sudo nmap --script=broadcast-avahi-dos $ip && sudo nmap --script=broadcast-avahi-dos $ip > DOS.txt
sudo chow $current_user DOS.txt
printf "\e[36m [+] Done ! e[0m\n"
sleep 2
mainmenu

elif [ $nnmap == $bjnp ]; then
echo -e -n "\e[36m [+] Nmap set to Canon device detection, enter the target : \e[0m"
read ip
sudo nmap --script broadcast-bjnp-discover $ip && sudo nmap --script broadcast-bjnp-discover $ip > Canon-device.txt
sudo chown $current_user Canon-device.txt
printf "\e[36m [+] Done ! \e[0m\n"
sleep 2
mainmenu

elif [ $nnmap == $fuzz ]; then
echo -e -n "\e[36m [+] Nmap set to DNS fuzzing attack, enter the target : \e[0m"
read ip 
sudo nmap -sU --script dns-fuzz $ip && sudo nmap -sU --script dns-fuzz $ip > DNS-attack.txt 
sudo chown $current_user DNS-attack.txt
printf "\e[36m [+] Done ! \e[0m"
sleep 2
mainmenu 

elif [ $nnmap == $ex ]; then
printf "\e[31m [+] Leave Octopus ... \e[0m\n"
sleep 1
exit

elif [ -z $nnmap ]; then
printf "\e[31m [+] You may choose at least one module ... \e[0m\n"
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
printf "\E[34m                   _                                   \n"
printf "\E[34m                  | |                                  \n"
printf "\E[34m     __      _____| |__  ___  ___ __ _ _ __            \n"
printf "\E[34m     \ \ /\ / / _ \ '_ \/ __|/ __/ _' | '_ \           \n"
printf "\E[34m      \ V  V /  __/ |_) \__ \ (_| (_| | | | |          \n"
printf "\E[34m       \_/\_/ \___|_.__/|___/\___\__,_|_| |_|          \n"
printf "                                                             \n"
printf "                                                             \n"
printf "\E[34m ##################################################### \n\E[0m"
printf "\E[34m # Web scanning                                        \n\E[0m"
printf "\E[34m ##################################################### \n\E[0m"
printf "                                                             \n"
printf "\E[34m {10}-- Use nikto                                      \n\E[0m"
printf "\E[34m {11}-- Use Maltego                                    \n\E[0m"
printf "\E[34m {12}-- Use ZAP                                        \n\E[0m"
printf "\E[34m {13}-- Use Gobuster                                   \n\E[0m"
printf "\E[34m {14}-- Use Dirbuster (Graphical GoBus.)               \n\E[0m"
printf "\E[34m {15}-- Use Sparta/Legion                              \n\E[0m"
printf "\E[34m {16}-- Use basic SQL injection                        \n\E[0m"
printf "                                                             \n"
printf "\E[34m {99}-- Leave Octopus                                  \n\E[0m"
printf "                                                             \n"
printf "\E[34m ##################################################### \n\E[0m"
printf "                                                             \n"
echo -e -n "\E[36m [+] Choose a module : \E[0m"
read choix3

if [ $choix3 == $nikto ]; then
echo -e -n "\e[36m [+] Starting nikto, target(IP/URL) : \e[0m"
read url_ip
nikto -h $url_ip && nikto -h $url_ip > nikto_results.txt
sudo chown $current_user nikto-results.txt
sleep 1
printf "\e[36m [+] Done ! \e[0m\n"
sleep 2
mainmenu

elif [ $choix3 == $maltego ]; then
printf "\e[36m [+] Starting maltego ... \e[0m"
maltego
printf "\e[36m [+] Done ! \e[0m\n"
sleep 2
mainmenu

elif [ $choix3 == $zap ]; then
printf "\e[36m [+] Starting OWASP-Zap \e[0m"
owasp-zap &>/dev/null
printf "\e[36m [+] Done ! \e[0m\n"
sleep 2
mainmenu

elif [ $choix3 == $gobuster ];then
echo -e -n "\e[36m [+] Choose the target URL : \e[0m"
read url
echo -e -n "\e[36m [+] Choose the path of your wordlist : \e[0m"
read wl
sudo gobuster --url $url --wordlist $wl && sudo gobuster --url $url --wordlist $wl > gobuster.txt
sudo chown $current_user gobuster.txt
printf "\e[36m [+] Done ! \e[0m\n"
sleep 2
mainmenu

elif [ $choix3 == $dirbuster ]; then
printf "\e[36m [+] Starting dirbuster \e[0m\n"
sudo dirbuster &>/dev/null
sleep 2
mainmenu

elif [ $choix3 == $legion ]; then
version1=1
version2=2
echo -e -n "\e[36m [+] Which version of Kali do you have ? (<=2019 --> 1 / >=2020 --> 2 ) : \e[0m"
read version
	if [ $version == $version1 ]; then
	printf "\e[36m [+] Starting sparta \e[0m\n"
	sudo sparta &>/dev/null
	printf "\e[36m [+] Done ! \e[0m\n"
	sleep 2
	mainmenu
	elif [ $version == $version2 ]; then
	printf "\e[36m [+] Starting legion \e[0m\n"
	sudo legion &>/dev/null
	sleep 1
	printf "\e[36m [+] Done ! \e[0m\n"
	sleep 2
	mainmenu
	fi

elif [ $choix3 == $sql ]; then
printf "\e[36m [+] For the moment, it is a test module, it will be improved later ... \e[0m\n"
echo -e -n "\e[36m [+] Enter the url of the target : \e[0m"
read targt
sudo sqlmap --$target --dbs && sudo sqlmap --$target --dbs > sql-results.txt
printf "\e[36m [+] Done !\e[0m\n"
sleep 2
mainmenu

elif [ $choix3 == $ex ]; then
printf "\e[31m [+] Leave Octopus ... \e[0m\n"
sleep 1
exit

elif [ -z $choix3 ]; then
printf "\e[31m [+] You may choose at least one module ! \e[0m\n"
mainmenu

fi

}

other-connexion() {

# Other-connexion Var
ssh=0
nc=1
op_nc=3
ex=9

clear
printf "\E[34m                                  _                   \n"
printf "\E[34m                                 (_)                  \n"
printf "\E[34m   ___ ___  _ __  _ __   _____  ___  ___  _ __        \n"
printf "\E[34m  / __/ _ \| '_ \| '_ \ / _ \ \/ / |/ _ \| '_ \       \n"
printf "\E[34m | (_| (_) | | | | | | |  __/>  <| | (_) | | | |      \n"
printf "\E[34m  \___\___/|_| |_|_| |_|\___/_/\_\_|\___/|_| |_|      \n"
printf "\E[34m                                                      \n"
printf "\E[34m #################################################### \n"
printf "\E[34m [+] SSH AND NETCAT CONNEXION\n"
printf "\E[34m #################################################### \n"
printf " \n"
printf "\E[34m {0}-- SSH connexion \e[0m\n"
printf "\E[34m {1}-- Netcat connexion \e[0m\n"
printf "\e[34m {2}-- Opening & listening port with Netcat \e[0mn"
printf " \n"
printf "\E[34m {9}-- Leave Octopus \n"
printf "\n"
printf "\e[34m #################################################### \n"
printf "\n"
echo -e -n "\E[34m [+] Choose your connexion : "
read connexion

if [ $connexion == $ssh ]; then
sudo service ssh start &>/dev/null
printf "\e[34m [+] Starting SSH protocol on port 22 \e[0m\n"
sleep 2
echo -e -n "\e[34m [+] Choose the username : \e[0m"
read username
echo -e -n "\e[3'm [+] Choose the IP address :\e[0m"
read ip_net
printf "\e[34m [+] Starting connexion on $username@$ip_net \e[0m\n"
sudo ssh $username@$ip_net
sleep 2
printf "\e[34m [+] Thanks to uses Octopus \e[0m\n"
sudo service ssh stop &>/dev/null
mainmenu

elif [ $connexion == $nc ]; then
# Netcat Var
Yes=1
No=2
printf "\e[36m [+] Starting Netcat \e[0m\n"
sleep 2
echo -e -n "\e[36m [+] Enter the destination port : \e[0m\n"
read port
echo -e -n "\e[36m [+] Enter the IP address : \e[0m\n"
read ip
echo -e -n "\€[36m [+] Do you want to add an arguments ? (1/2) :\e[0m\n"
read arg
	if [ $arg == $No ]; then
	printf "\e[36m [+] Start Netcat on $ip on port $port \e[0m\n"
	sleep 2
	sudo nc -nv $ip $port
	printf "\e[34m [+] Thanks to uses Octopus \e[0m\n"
	mainmenu

	elif [ $arg == $Yes ]; then
	echo -e -n "\e[36m [+] Enter your argument : \e[0m"
	read argument
	printf "\e[36m [+] Starting Netcat on port $port on IP $ip with '$argument' \e[0m\n"
	sudo nc -nv $ip $port $argument
	printf "\e[34m [+] Thanks to uses Octopus \e[0m\n"
	mainmenu

	fi

elif [ $connexion == $op_nc ]; then
echo -e -n "\e[34m [+] Which port do you want to open ? : \e[0m"
read open_port
printf "\e[31m [+] WARNING ; WHEN LISTENING TO THE PORT, DO NOT CLOSE THE TAB OR COMMUNICATION WILL BE CUT OF !\e[0m\n"
sleep 5 
nc -l $open_port
printf "\e[34m [+] End of listening, return to menu ... \e[0m\n"
mainmenu

elif [ $connexion == $ex ]; then
printf "\e[31m [+] Leave Octopus ... \e[0m\n"
sleep 2
exit

elif [ -z $connexion ]; then
printf "\e[31 [+] You may choose at least one module ! \e[0m\n"
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
printf "\E[34m                                      _                        \n"
printf "\E[34m                                     | |                       \n"
printf "\E[34m    _ __ ___   __ _ _ __  _   _  __ _| |                       \n"
printf "\E[34m   | '_ ' _ \ / _' | '_ \| | | |/ _' | |                       \n"
printf "\E[34m   | | | | | | (_| | | | | |_| | (_| | |                       \n"
printf "\E[34m   |_| |_| |_|\__,_|_| |_|\__,_|\__,_|_|                       \n"
printf "                                                                     \n"
printf "\E[34m ############################################################# \n"
printf "\E[34m # Manual / Documentation                                      \n"
printf "\E[34m ############################################################# \n"
printf "                                                                     \n"
printf "\E[34m # Network Information manual (select number )                 \n"
printf "\E[34m {1}-- Man nslookup                                            \n"
printf "\E[34m {2}-- Man dig                                                 \n"
printf "\E[34m {3}-- Man whois                                               \n"
printf "\E[34m {4}-- Man recon-ng                                            \n"
printf "                                                                     \n"
printf "                                                                     \n"
printf "\E[34m # Network Scanning manual (select number )                    \n"
printf "\E[34M {5}-- Man nmap                                                \n"
printf "\E[34m {6}-- Man zenmap                                              \n"
printf "\E[34m {7}-- Man ufw FireWall                                        \n"
printf "                                                                     \n"
printf "                                                                     \n"
printf "\E[34m # Web-Scanning mnual (select number )                         \n"
printf "\E[34m {8}-- Man nikto                                               \n"
printf "                                                                     \n"
printf "\E[34m {99}-- Leave Octopus                                          \n"
printf "                                                                     \n"
echo -e -n " \E[31mOctopus@Manual\E[34m:~\E[0m# "
read mannu

if [ $mannu == $manns ]; then
printf "\e[34m [+] Nslookup manual \e[0m\n"
sleep 3
sudo man nslookup
mainmenu

elif [ $mannu == $mandg ]; then
printf "\e[34m [+] Dig manual \e[0m\n"
sleep 3
sudo man dig
mainmenu

elif [ $mannu == $manwhois ]; then
printf "\e[34m [+] Whois manual \e[0m\n"
sleep 3
sudo man whois
mainmenu

elif [ $mannu == $manrecon ]; then
printf "\e[34m [+] Man recon-ng \e[0m\n"
sleep 3
sudo man recon-ng
mainmenu

elif [ $mannu == $mannmap ]; then
printf "\e[34m [+] Man Nmap \e[0m\n"
sleep 3
sudo man nmap
mainmanu

elif [ $mannu == $manzen ]; then
printf "\e[34m [+] Man ZenMap \e[34m\n"
sleep 3
sudo man zenmap
mainmenu

elif [ $mannu == $manufw ]; then
printf "\e[34m [+] Man UFW \e[0m\n"
sleep 3
sudo man ufw
mainmenu

elif [ $mannu == $mannikto ]; then
printf "\e[34m [+] Man Nikto \e[0m\n"
sleep 3
sudo man nikto
mainmenu

elif [ $mannu == $ex ]; then
printf "\e[31mi [+] Leave Octopus ... \e[0m\n"
sleep 3
exit

elif [ -z $mannu ]; then
printf "\e[31m[+] You may choose at least one module ! \e[0m\n"
sleep 3
mainmenu

fi

}

# Function for global script : DON'T TOUCH 
luncher () {

# Lunch control 
bannerscreen
preface
mainmenu

}

luncher
