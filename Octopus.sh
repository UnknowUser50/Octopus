#!/bin/bash

##########################################################################
#
# Octopus : Networking ToolBox
#
# Octopus version : 1.1.1
#
# June 2020 --> UnknowUser50
#
# https://github.com/UnknowUser50/Octopus
#
##########################################################################

clear
echo -e "\E[34m                            ___                               "
echo -e "\E[34m                         .-'   ''.                            "
echo -e "\E[34m                        /         \                           "
echo -e "\E[34m                        |         ;                           "
echo -e "\E[34m                        |         |           ___.--,         "
echo -e "\E[34m               _.._     |0) ~ (0) |    _.---''__.-( (_.       "
echo -e "\E[34m        __.--''_.. '.__.\    '--. \_.-' ,.--''     ''''       "
echo -e "\E[34m       ( ,.--''   ',__ /./;   ;, '.__.''    __                "
echo -e "\E[34m       _') )  .---.__.' / |   |\   \__..--''  '''--.,_        "
echo -e "\E[34m      '---' .'.''-._.-''_./  /\ '.  \ _.-~~~''''~~~-._'-.__.' "
echo -e "\E[34m            | |  .' _.-' |  |  \  \  '.               '~---'  "
echo -e "\E[34m             \ \/ .'     \  \   '. '-._)                      "
echo -e "\E[34m              \/ /        \  \    '=.__'~-.                   "
echo -e "\E[34m              / /\         ') )    / / '''.'\                "
echo -e "\E[34m        , _.-'.'\ \        / /    ( (     / /                 "
echo -e "\E[34m         '--~'   ) )    .-'.'      '.'.  | (                  "
echo -e "\E[34m                (/'    ( ('          ) )  '-;                 "
echo -e "\E[34m                 '      '-;         (-'                       "
echo -e "\E[34m                       _                                      "
echo -e "\E[34m                      | |                                     "
echo -e "\E[34m             ___   ___| |_ ___  _ __  _   _ ___               "
echo -e "\E[34m            / _ \ / __| __/ _ \| '_ \| | | / __|              "
echo -e "\E[34m           | (_) | (__| || (_) | |_) | |_| \__ \              "
echo -e "\E[34M            \___/ \___|\__\___/| .__/ \__,_|___/              "
echo -e "\E[34m                               | |                            "
echo -e "\E[34m                               |_|                            "
echo "                                                                       "
echo -e "\E[34m          By UnknowUser50 || version 1.1.1 || 2020            "
echo "                                                                       "
echo "                                                                       "
echo "                                                                       "
echo -e "\E[36m [+] Loading Octopus ... \E[0m"
sleep 2
# IP and MAC address
#mac=$(ifconfig | grep -v "inet" | grep -v "inet6" | grep -v "127.0.0.1" | grep "ether" | grep  "08:00:27:74:b6:e1" | tr -s " " | cut -d " " -f 3)
#ip=$(ifconfig | grep "inet" | grep -v "inet6" | grep -v "127.0.0.1" | tr -s " " | cut -d " " -f 3)
# Upgrade check
sudo apt-get update &>/dev/null
# Creation dir
sudo mkdir Network-Infos/ &>/dev/null
echo -e "\E[36m [+] Octopus/Network-Infos are create ! \E[0m"
sudo mkdir Network-Scan/ &>/dev/null
echo -e "\E[36m [+] Octopus/Network-Scan are create ! \E[0m"
sudo mkdir Web-Scan/ &>/dev/null
echo -e "\E[36m [+] Octopus/Web-Scan are create ! \E[0m"
echo "                                                                   "
# Printf address
#echo -e "\E[36m [+] Your mac address is : \E[31m $mac "
#echo -e "\E[36m [+] Your IP address is : \E[31m $ip "
# Changing Right
echo -e -n "\E[31m [+] Enter current user : \E[0m"
read user
sudo chown $user Network-Infos/
sudo chown $user Network-Scan/
sudo chown $user Web-Scan/

# Main menu
ni=1000
ns=1001
ws=1010
doc=1011
airc=1100 #Next-Update for Aircrack-NG 
ex=1111

# User While 
while [ $ex != 0 ]
do	
clear
# Print main menu
echo -e "\E[34m                     _                                           "
echo -e "\E[34m                    (_)                                          "
echo -e "\E[34m     _ __ ___   __ _ _ _ __  _ __ ___   ___ _ __  _   _          "
echo -e "\E[34m    | '_ ' _ \ / _' | | '_ \| '_ ' _ \ / _ \ '_ \| | | |         "
echo -e "\E[34m    | | | | | | (_| | | | | | | | | | |  __/ | | | |_| |         "
echo -e "\E[34m    |_| |_| |_|\__,_|_|_| |_|_| |_| |_|\___|_| |_|\__,_|         "
echo "                                                                          "
echo -e "\E[34m ################################################### \E[0m       "
echo -e "\E[34m # Main menu                                         \E[0m       "
echo -e "\E[34m ################################################### \E[0m       "
echo -e "\E[34m                                                     \E[0m       "
echo -e "\E[34m {1000}-- Network information                        \E[0m       "
echo -e "\E[34m {1001}-- Network scanning                           \E[0m       "
echo -e "\E[34m {1010}-- Web scanning                               \E[0m       "
echo -e "\E[34m {1011}-- Manual/Documentation                       \E[0m       "
echo -e "\E[34m                                                     \E[0m       "
echo -e "\E[34m {1111}-- Exit Octopus                               \E[0m       "
echo "                                                                          "
echo -e "\E[34m ################################################### \E[0m       "
echo "                                                                          "
echo -n -e "\E[36m [+] Choose the main module : \E[0m"
read reponse

if [ $reponse = $ni ]
then

	# Information 
	nls=1
	dg=2
	who=3
	trc=4
	rc=5
	ws=6
	nint=7
	quit=99
	# End

	clear
	echo -e "\E[34m              _                      _    _        __                 "
	echo -e "\E[34m             | |                    | |  (_)      / _|                "
	echo -e "\E[34m   _ __   ___| |___      _____  _ __| | ___ _ __ | |_ ___             "
	echo -e "\E[34m  | '_ \ / _ \ __\ \ /\ / / _ \| '__| |/ / | '_ \|  _/ _ \            "
	echo -e "\E[34m  | | | |  __/ |_ \ V  V / (_) | |  |   <| | | | | || (_) |           "
	echo -e "\E[34m  |_| |_|\___|\__| \_/\_/ \___/|_|  |_|\_\_|_| |_|_| \___/            "
	echo "                                                           "
	echo "                                                           "
	echo -e "\E[34m #################################################### \E[0m"
	echo -e "\E[34m # Network information                                \E[0m"
	echo -e "\E[34m #################################################### \E[0m"
	echo "                                                           "
	echo -e "\E[34m {1}-- Use Nslookup                                   \E[0m"
	echo -e "\E[34m {2}-- Use Dig                                        \E[0m"
	echo -e "\E[34m {3}-- Use Whois                                      \E[0m"
	echo -e "\E[34m {4}-- Use Traceroute                                 \E[0m"
	echo -e "\E[34m {5}-- Use Recon-ng                                   \E[0m"
	echo -e "\E[34m {6}-- Use WireShark                                  \E[0m"
	echo -e "\E[34m {7}-- Edit network interfaces                        \E[0m"
	echo "                                                           "
	echo -e "\E[34m {99}-- Exit Octopus                                  \E[0m"
	echo "                                                           "
	echo -e "\E[34m #################################################### \E[0m"
        echo "                                                           "
	echo -n -e "\E[36m [+] Choose a module : \E[0m"
	read choix1
	cd Network-Infos/

	if [ $choix1 = $nls ]
	then

		echo -n -e "\E[36m [+] Enter a domain name here : \E[0m"
		read domain
		sleep 2 
		nslookup $domain && nslookup $domain > domain.txt
		sudo chown $user domain.txt
		sleep 1 
		echo -e "\E[36m [+] Done !! \E[0m"

	elif [ $choix1 = $dg ]
	then

		echo -n -e "\E[36m [+] Enter a domain name/IP : \E[0m"
		read doip
		sleep 2
		dig $dg && dig $dg > dig.txt
	        sudo chown $user dig.txt	
		sleep 1
		echo -e "\E[36m [+] Done !! \E[0m"

	elif [ $choix1 = $who ]
	then

		echo -n -e "\E[36m [+] Enter an IP address : \E[0m"
		read ip 
		whois $ip && whois $ip > whois.txt
		sudo chown $user whois.txt
		sleep 1
		echo -e "\E[36m [+] Done !! \E[0m"

	elif [ $choix1 = $trc ]
	then
		
		echo -n -e "\E[36m [+] Enter a domain name/IP : \E[0m"
		read trcip
		traceroute $trcip && traceroute $trcip > traceroute.txt
		sudo chown $user traceroute.txt
		sleep 1
		echo -e "\E[36m [+] Done !! \E(0m"

	elif [ $choix1 = $rc ]
	then

		echo -e "\E[31m [+] Thinks to load all modules or run this 'marketplace install all' \E[0m"
		sleep 5 
		recon-ng
	        sleep 1	

	elif [ $choix1 = $ws ]
	then

		echo -e "\E[34m [+] Starting WireShark ... please wait \E[0m"
		sleep 1
		sudo wireshark &>/dev/null 
		sleep 1

	elif [ $choix1 = $nint ]
	then

		vim=1
		nano=2
		echo -e "\E[34m [+] Go to /etc/newtork/interfaces ... \E[0m"
		sleep 1
		echo -e -n "\E[34m [+] Use vim or nano ? (1=vim | 2=nano) : "
		read writer

			if [ $writer = $vim ]
			then
				
				sleep 1
				sudo vim /etc/network/interfaces
				sleep 1 
				echo -e "\E[31m [+] REMEMBER TO RELOAD THE NETWORK INTERFACES THAT HAVE BEEN MODIFIED !!! \E[0m"
				sleep 4

			elif [ $writer = $nano ]
			then

				sleep 1
				sudo nano /etc/network/interfaces
				sleep 1
				echo -e "\E[31m [+] REMEMBER TO RELOAD THE NETWORK INTERFACES THAT HAVE BEEN MODIFIED !!! \E[0m"
				sleep 4
			
			fi	
		sleep 1 	

	elif [ $choix1 = $ex ]
	then

		echo -e "\E[31m [+] Leave Octopus ... please wait ... \E[0m"
		sleep 2 
		exit

	elif [ -z $choix1 ]
	then
		
		echo -e "\E[31m [+] You must choose at least 1 module ! Leave Octopus \E[0m"
		sleep 1
		exit
		cd -
		sudo rmdir Network-Infos/ &>/dev/null
		sudo rmdir Network-Scan/ &>/dev/null
		sudo rmdir Web-Scan/ &>/dev/null

	fi	

elif [ $reponse = $ns ]
then
	
	# Scanning
	nse=7
	zmp=8
	ufw=9
	ex=99
	# End

	# Network scanning
	clear

		echo -e "\E[34m              _                      _                                         "
		echo -e "\E[34m             | |                    | |                                        "
		echo -e "\E[34m   _ __   ___| |___      _____  _ __| | _____  ___ __ _ _ __                   "
		echo -e "\E[34m  | '_ \ / _ \ __\ \ /\ / / _ \| '__| |/ / __|/ __/ _' | '_ \                  "
		echo -e "\E[34m  | | | |  __/ |_ \ V  V / (_) | |  |   <\__ \ (_| (_| | | | |                 "
		echo -e "\E[34m  |_| |_|\___|\__| \_/\_/ \___/|_|  |_|\_\___/\___\__,_|_| |_|                 "
		echo "                                                               "
		echo "                                                               "
   		echo -e "\E[34m ###########################################         \E[0m"
		echo -e "\E[34m # Network scanning               	            \E[0m"
		echo -e "\E[34m ###########################################         \E[0m"
		echo "                                                               "
		echo -e "\E[34m {7}-- Use Nmap and NSE                              \E[0m"
		echo -e "\E[34m {8}-- Use ZenMap (Graphical Nmap)                   \E[0m"
		echo -e "\E[34m {9}-- Use Linux FireWall UFW                        \E[0m"
		echo "                                                               "
		echo -e "\E[34m {99}- Leave Octopus                                 \E[0m"
		echo "                                                               "
		echo -e "\E[34m ###########################################         \E[0m"
		echo "                                                               "
		echo "                                                               "
		echo -e -n "\E[36m [+] Choose a module : \E[0m"
		read choix2
		cd Network-Scan/

		if [ $choix2 = $nse ]
		then

			# NSE
			fs=100
			ps=101
			ts=102
			us=103
			as=104
			fls=105
			vs=106
			trace=107
			osc=108
			ex=999
			# End
		        clear	
                        echo -e "\E[32m         ,-.                                                                    "
			echo -e "\E[32m        / \  '.  __..-,O                                                        "
			echo -e "\E[32m       :   \ --''_..-'.'                                                        "
			echo -e "\E[32m       |    . .-' '. '.		 _                _                           "
			echo -e "\E[32m       :     .     .'.'		| |              | |                          "
			echo -e "\E[32m        \     '.  /  ..		| |__   __ _  ___| | __                       "
			echo -e "\E[32m         \      '.   ' .	| '_ \ / _' |/ __| |/ /                       "
			echo -e "\E[32m          ',       '.   '	| | | | (_| | (__|   |                        "
			echo -e "\E[32m         ,|,'.        '-.\	|_| |_|\_',_|\___|_|\_\                       "
			echo -e "\E[32m        '.||  ''-...__..-'                                                      "
			echo -e "\E[32m         |  |                                                                   "
			echo -e "\E[32m         |__|                                                                   "
			echo -e "\E[32m         /||\                                                                   "
			echo -e "\E[32m        //||\\                                                                  "
			echo -e "\E[32m       // || \\                                                                 "
			echo -e "\E[32m    __//__||__\\__                                                              "
			echo -e "\E[32m   '--------------'                                                             "
			echo "                                                                                         "
			echo "                                                 "
			echo -e "\E[34m ############################################### \E[0m"
			echo -e "\E[34m # Nmap and NSE                                  \E[0m"
			echo -e "\E[34m ############################################### \E[0m"
			echo "                                                 "
			echo -e "\E[34m {100}-- Furtive scan                            \E[0m"
			echo -e "\E[34m {101}-- 1000 Ports scan                         \E[0m"
			echo -e "\E[34m {102}-- TCP scan                                \E[0m"
			echo -e "\E[34m {103}-- UDP scan                                \E[0m"
			echo -e "\E[34m {104}-- Aggressive scan                         \E[0m"
			echo -e "\E[34m {105}-- Flags scan                              \E[0m"
			echo -e "\E[34m {106}-- Vulnerabilities scan                    \E[0m"
			echo -e "\E[34m {107}-- Trace scan                              \E[0m"
			echo -e "\E[34m {108}-- OS detection                            \E[0m"
			echo "                                                 "
			echo -e "\E[34m {999}-- Leave Octopus                           \E[0m"
			echo "                                                 "
			echo -e "\E[34m ############################################### \E[0m"
			echo "                                                 "
			echo -n -e "\E[36m [+] Choose Nmap's modules : \E[0m"
			read nnmap
			sudo mkdir Nmap &>/dev/null
			sudo chown $user Nmap/
			cd Nmap/

			if [ $nnmap = $fs ]
			then

				echo -n -e "\E[36m [+] Nmap set to furtive scan, target : \E[0m"
				read iipp
				sudo nmap -sS $iipp && sudo nmap -sS $iipp > Furtive.txt
				sudo chown $user Furtive.txt
				sleep 1
				echo -e "\E[36m [+] Done !! \E[0m"

			elif [ $nnmap = $ps ]
			then

				echo -n -e "\E[36m [+] Nmap set to ports scan, target : \E[0m"
				read iipp
				sudo nmap -p 1-1000 $iipp && sudo nmap -p 1-1000 $iipp > 1000ports.txt
				sudo chown $user 1000Ports.txt
				sleep 1
				echo "\E[36m [+] Done !! \E[0m"

			elif [ $nnmap = $ts ]
			then

				echo -n -e "\E[36m [+] Nmap set to TCP scan, target : \E[0m"
				read iipp
				sudo nmap -sT $iipp && sudo nmap -sT $iipp > TCPScan.txt
				sudo chown $user TCPScan.txt
				sleep 1
				echo "\E[36m [+] Done !! \E[0m"

			elif [ $nnmap = $us ]
			then

				echo -n -e "\E[36m [+] Nmap set to UDP scan, target : \E[0m"
				read iipp
				sudo nmap -sU $iipp && sudo nmap -sU $iipp > UDPScan.txt
				sudo chown $user UDPScan.txt
				sleep 1
				echo "\E[36m [+] Done !! \E[0m"

			elif [ $nnmap = $as ]
			then

				echo -n -e "\E[36m [+] Nmap set to Aggressive scan, target : \E[0m" 
				read iipp
				sudo nmap -A $iipp && sudo nmap -A $iipp > Aggressive.txt
				sudo chown $user Agressive.txt	
				sleep 1
				echo "\E[36m [+] Done !! \E[0m"

			elif [ $nnmap = $fls ]
			then

				echo -n -e "\E[36m [+] Nmap set to Flags scan, target : \E[0m"
				read iipp 
				sudo nmap --script banner $iipp && sudo nmap --script banner $iipp > Flags.txt
				sudo chown $user Flags.txt
				sleep 1 
				echo "\E[36m [+] Done !! \E[0m"

			elif [ $nnmap = $vs ]
			then

				echo -n -e "\E[36m [+] Nmap set to Vuln scan, target : \E[0m"
				read iipp
				sudo nmap --script vuln $iipp && sudo nmap --script vuln $iipp > Vuln.txt	
				sudo chown $user Vuln.txt
				sleep 1
				echo "\E[36m [+] Done !! \E[0m"

			elif [ $nnmap = $trace ]
			then

				echo -n -e "\E[36m [+] Nmap set to Trace scan, target : \E[0m"
				read iipp
				sudo nmap --script-trace $iipp && sudo nmap --script-trace $iipp > Trace.txt
				sudo chown $user Trace.txt
				sleep 1
				echo -e "\E[36m [+] Done !! \E[0m"	
			
			elif [ $nnmap = $osc ]
			then

				echo -n -e "\E[36m [+] Nmap set to OS detection, select OS tries (1-...(50 max)) : \E[0m"
				read os
				echo -n -e "\E[36m [+] Now, select the target : \E[0m"
				read iipp
				sudo nmap --max-os-tries $os $target && sudo nmap --max-os-tries $os $target > OS.txt
				sudo chown $user OS.txt
				sleep 1
				echo -e "\E[36m [+] Done !! \E[0m"	

			elif [ $nnmap = $ex ]
			then

				echo -e "\E[31m [+] Leave Octopus ... please wait ... \E[0m"
				sleep 1
				exit

			elif [ -z $nnmap ]
			then

				echo -e "\E[31m [+] You must choose at least one module ... \E[0m" 
				cd 
			       	sudo rmdir Octopus/Network-Infos/
				sudo rmdir Octopus/Network-Scan/
				sudo rmdir Octopus/Web-Scan/
				exit

				fi

			elif [ $choix2 = $zmp ]
			then
				Oui=Y
				Non=n

				echo -e -n "\E[34m [+] ZenMap is install ? (Y/n) : \E[0m"
				read zenrsp

				if [ $zenrsp = $Oui ]
				then	

					echo -e  "\E[32m [+] Starting ZenMap as root  ... \E[0m"
					sudo zenmap

				elif [ $zenrsp = $Non ]
				then	

					echo " [+] Starting installation ... "
					sudo wget -q https://nmap.org/dist/zenmap-7.80-1.noarch.rpm &>/dev/null
					echo -e "\E[32m [+] Receiving data from nmap.org ... \E[0m"
					sudo apt-get install alien &>/dev/null
					echo -e "\E[32m [+] Install alien ... \E[0m"
					alien zenmap-7.80-1.noarch.rpm &>/dev/null
					dpkg -i zenmap_7.80-2_all.deb &>/dev/null
					echo -e "\E[32m [+] Unpacking of Zenmap ... Soon finished \E[0m"
					sleep 1
					echo -e "\E[32m [+] Installation complete ... start-up ZenMap as root "
					sudo zenmap
						
				fi

			elif [ $choix2 = $ufw ]
			then

				echo -e "\E[36m [+] Starting UFW - Firewall ... please wait \E[0m"
				sudo apt-get install ufw &>/dev/null
				sudo ufw enable 

			elif [ $choix2 = $ex ]
			then

				echo -e "\E[31m [+] Leave Octopus ... please wait ... \E[0m "
				sleep 1
				exit

			elif [ -z $choix2 ]
			then

				echo -e "\E[31m [+] You must choose at least one module ... \E[0m "
				sleep 1
				exit
				cd - 
				sudo rmdir Network-Infos/
				sudo rmdir Network-Scan/
				sudo rmdir Web-Scan/

			fi

elif [ $reponse = $ws ]
then

	# Web
	nikto=10
	maltego=11
	zap=12
	gobuster=13
	dirbuster=14
	legion=15
	ex=99
	# End

	# Web
	clear
	echo -e "\E[34m                   _                                   "
	echo -e "\E[34m                  | |                                  "
	echo -e "\E[34m     __      _____| |__  ___  ___ __ _ _ __            "
	echo -e "\E[34m     \ \ /\ / / _ \ '_ \/ __|/ __/ _' | '_ \           "
	echo -e "\E[34m      \ V  V /  __/ |_) \__ \ (_| (_| | | | |          "
	echo -e "\E[34m       \_/\_/ \___|_.__/|___/\___\__,_|_| |_|          "
	echo "                                                                "
	echo "                                                                "
	echo -e "\E[34m ##################################################### \E[0m"
	echo -e "\E[34m # Web scanning                                        \E[0m"
	echo -e "\E[34m ##################################################### \E[0m"
	echo "                                                       "
	echo -e "\E[34m {10}-- Use nikto                                      \E[0m"
	echo -e "\E[34m {11}-- Use Maltego                                    \E[0m"
	echo -e "\E[34m {12}-- Use ZAP                                        \E[0m"
	echo -e "\E[34m {13}-- Use Gobuster                                   \E[0m"
	echo -e "\E[34m {14}-- Use Dirbuster (Graphical GoBus.)               \E[0m"
	echo -e "\E[34m {15}-- Use Sparta/Legion                              \E[0m"
	echo "                                                       "
	echo -e "\E[34m {99}-- Leave Octopus                                  \E[0m"
	echo "                                                       "
	echo -e "\E[34m ##################################################### \E[0m"
	echo "                                                       "
	echo -e -n "\E[36m [+] Choose a module : \E[0m"
	read choix3
	cd Web-Scan/

	if [ $choix3 = $nikto ]
	then

		echo -n -e "\E[36m [+] Starting nikto ... target (IP/URL) : \E[0m"
		read url
		sleep 1
		nikto -h $url && nikto -h $url > nikto-results.txt
		sudo chown $user nikto-results.txt
		sleep 1
		echo -e "\E[36m [+] Done !! \E[0m"

	elif [ $choix3 = $maltego ]
	then

		echo -e "\E[36m [+] Starting maltego ... please wait ... \E[0m "
		sleep 1
		maltego
		sleep 1

	elif [ $choix3 = $zap ]
	then

		echo -e "\E[36m [+] Starting OWASP-Zap ... please wait ... \E[0m"
		sleep 1
		owasp-zap &>/dev/null 
		sleep 1

	elif [ $choix3 = $gobuster ]
	then

		echo -n	-e "\E[36m [+] Choose the URL target : \E[0m"
		read url
		echo -n -e "\E[36m [+] Choose the path of your wordlist : \E[0m"
	       	read wl
		sudo gobuster --url $url dir --wordlist $wl && sudo gobuster --url $url dir --wordlist $wl > gobuster.txt
		sudo chown $user gobuster.txt
		sleep 1
		echo -e "\E[36m [+] Done !! \E[0m"

	elif [ $choix3 = $dirbuster ]
	then

		echo -e "\E[36m [+] Starting Dirbuster  ... please wait  ... \E[0m"
		sleep 1
		dirbuster
		sleep 1

	elif [ $choix3 = $legion ]
	then
		
		Version1=a
		Version2=b

		echo -e -n "\E[36m [+] What version of Kali do you have (<=2019 = a/>=2020 = b) : "
		read version
		sleep 1

		if [ $version = $Version1 ]
		then
			
			echo -e "\E[36m [+] Starting sparta ... please wait ... \E[0m"
			sudo sparta &>/dev/null
			sleep 1
			exit

		elif [ $version = $Version2 ]
		then

			echo -e "\E[36m [+] Starting legion ... please wait ... \E[0m"
			sudo legion &>/dev/null
			sleep 1 
			exit

		fi

	elif [ $choix3 = $ex ]
	then

		echo -e "\E[31m [+] Leave Octopus ... \E[0m"
		sleep 1
		exit

	elif [ -z $choix3 ]
	then

		echo -e "\E[31m [+] You must choose at least one module ! \E[0m"
		sleep 1
		cd - 
		sudo rmdir Network-Infos/
		sudo rmdir Network-Scan/
		sudo rmdir Web-Scan/
		exit

	fi	

elif [ $reponse = $doc ]
then
	# Var
	manns=1
	mandig=2
	manwhois=3
	manrecon=4
	mannmap=5
	manzen=6
	manufw=7
	mannikto=8
	ex=99
	
	clear
	echo -e "\E[34m                                      _                        "
	echo -e "\E[34m                                     | |                       "
	echo -e "\E[34m    _ __ ___   __ _ _ __  _   _  __ _| |                       "
	echo -e "\E[34m   | '_ ' _ \ / _' | '_ \| | | |/ _' | |                       "
	echo -e "\E[34m   | | | | | | (_| | | | | |_| | (_| | |                       "
	echo -e "\E[34m   |_| |_| |_|\__,_|_| |_|\__,_|\__,_|_|                       "
	echo "                                                                        "
	echo -e "\E[34m ############################################################# "
	echo -e "\E[34m # Manual / Documentation                                      "
	echo -e "\E[34m ############################################################# "
	echo "                                                                        "
	echo -e "\E[34m # Network Information manual (select number )                 "
	echo -e "\E[34m {1}-- Man nslookup                                            "
	echo -e "\E[34m {2}-- Man dig                                                 "
	echo -e "\E[34m {3}-- Man whois                                               "
	echo -e "\E[34m {4}-- Man recon-ng                                            "
	echo "                                                                        "
	echo "                                                                        "
	echo -e "\E[34m # Network Scanning manual (select number )                    "
	echo -e "\E[34M {5}-- Man nmap                                                "
	echo -e "\E[34m {6}-- Man zenmap                                              "
	echo -e "\E[34m {7}-- Man ufw FireWall                                        "
	echo "                                                                        "
	echo "                                                                        "
	echo -e "\E[34m # Web-Scanning mnual (select number )                         "
	echo -e "\E[34m {8}-- Man nikto                                               "
	echo "                                                                        "
	echo -e "\E[34m {99}-- Leave Octopus                                          "
	echo "                                                                        "

	echo -e -n " \E[31mOctopus@Manual\E[34m:~\E[0m# " 
	read mannu

	if [ $mannu = $manns ]
	then

		echo -e "\E[34m [+] Nslookup manual ... please wait ..."
		sleep 1
		clear
		sudo man nslookup
		exit

	elif [ $mannu = $mandig ]
	then

		echo -e "\E[34m [+] Dig manual ... please wait ..."
		sleep 1
		clear
		sudo man dig 
		exit

	elif [ $mannu = $manwhois ]
	then
		
		echo -e "\E[34m [+] Whois manual ... please wait ..."
		sleep 1
		clear
		sudo man whois
		exit

	elif [ $mannu = $manrecon ]
	then

		echo -e "\E[34m [+] Recon-ng manual ... please wait... "
		sleep 1
		clear
		sudo man recon-ng
		exit

	elif [ $mannu = $mannmap ]
	then
		
		echo -e "\E[34m [+] Nmap manual ... please wait ..."
		sleep 1
		clear
		sudo man nmap
		exit

	elif [ $mannu = $manzen ]
	then

		echo -e "\E[34m [+] Zenmap manual ... please wait ..."
		sleep 1
		clear
		sudo man zenmap
		exit

	elif [ $mannu = $manufw ]
	then
		
		echo -e "\E[34m [+] UFW FireWall manual ... please wait ..."
		sleep 1
		clear
		sudo man ufw
		exit

	elif [ $mannu = $mannikto ]
	then

		echo -e "\E[34m [+] Nikto manual ... please wait ... "
		sleep 1
		clear
		sudo man nikto
		exit

	elif [ $mannu = $ex ]
	then
		
		echo -e "\E[31m [+] Leaving Octopus ... please wait ..."
		sleep 1
		exit

	elif [ -z $mannu ]
	then

		echo -e "\E[31 [+] You may choose at least one manual ..."
		sleep 1
		exit

	fi	

elif [ $reponse = $airc ]
then

	echo -e "\E[34m [+] Success Var \E[0m"
	sleep 2
	exit	


elif [ $reponse = $ex ]
then

	# Leave octopus
	echo -e "\E[31m [+] Leave Octopus ... please wait \E[0m"
	sleep 1 
	exit

elif [ -z $reponse ]
then

	# None
	echo -e "\E[31m [+] Choose one ... \E[0m"
	sleep 1
	cd  
	sudo rmdir Octopus/Network-Infos/
	sudo rmdir Octopus/Network-Scan/
	sudo rmdir Octopus/Web-Scan/
	exit

fi	
done

					
		
			



