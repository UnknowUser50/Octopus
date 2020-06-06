#!/bin/bash

##########################################################################
#
# Octopus : Networking ToolBox
#
# Octopus version : 1.0
#
# June 2020 --> UnknowUser50
#
# https://github.com/UnknowUser50/Octopus
#
##########################################################################

clear

echo "                                                                   "
echo "                                                                   "
echo -e "\E[34m          By : UnknowUser50 || version 1.0 || 2020             \E[0m"
echo "                                                                   "
echo "                                                                   "
echo -e "\E[34m 00110001  11010011  01101111  01101110  00101111  0110  0000  01101101 \E[0m"
echo -e "\E[34m 010  011  1101         11     110  010  101  110  1101  0101  110      \E[0m"
echo -e "\E[34m 111  011  101          01     100  001  011  111  0000  0101  001      \E[0m"
echo -e "\E[34m 000  101  10           10     010  000  01010100  0011  0100  10010010 \E[0m"
echo -e "\E[34m 010  111  101          11     011  111  110       0101  0011       010 \E[0m"
echo -e "\E[34m 101  000  1101         00     010  010  110       0110  0110       100 \E[0m"
echo -e "\E[34m 10100100  10010110     01     01101011  100       1001000100  11010101 \E[0m"
echo "                                                                   "
echo "                                                                   "
echo -e "\E[36m [+] Loading Octopus ... \E[0m"
sleep 2

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
# Changing Right
 pwd
echo -e -n "\E[31m [+] Enter current user : \E[0m"
read user
sudo chown $user Network-Infos/
sudo chown $user Network-Scan/
sudo chown $user Web-Scan/

# Main menu
ni=1000
ns=1001
ws=1010
ex=1111

# Print main menu
echo "                                                                   "
echo -e "\E[34m ################################################### \E[0m"
echo -e "\E[34m # Main menu                                         \E[0m"
echo -e "\E[34m ################################################### \E[0m"
echo -e "\E[34m                                                     \E[0m"
echo -e "\E[34m {1000}-- Network information                        \E[0m"
echo -e "\E[34m {1001}-- Network scanning                           \E[0m"
echo -e "\E[34m {1010}-- Web scanning                               \E[0m"
echo -e "\E[34m                                                     \E[0m"
echo -e "\E[34m {1111}-- Exit Octopus                               \E[0m"
echo "                                                                   "
echo -e "\E[34m ################################################### \E[0m"
echo "                                                                   "
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
	quit=99
	# End

	clear
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
	echo "                                                           "
	echo -e "\E[34m {99}-- Exit Octopus                                  \E[0m"
	echo "                                                           "
	echo -e "\E[34m #################################################### \E[0m"
        echo "                                                           "
	echo -n -e "\E[36m [+] Choose a module : \E[0m"
	read choix1
	cd Network-Infos/

	if [ $choix1 = $ns ]
	then

		echo -n -e "\E[36m [+] Enter a domain name here : \E[0m"
		read domain
		sleep 2 
		nslookup $domain && nslookup $domain > domain.txt
		sleep 1 
		echo -e "\E[36m [+] Done !! \E[0m"

	elif [ $choix1 = $dg ]
	then

		echo -n -e "\E[36m [+] Enter a domain name/IP : \E[0m"
		read doip
		sleep 2
		dig $dg && dig $dg > dig.txt 
		sleep 1
		echo -e "\E[36m [+] Done !! \E[0m"

	elif [ $choix1 = $who ]
	then

		echo -n -e "\E[36m [+] Enter an IP address : \E[0m"
		read ip 
		whois $ip && whois $ip > whois.txt
		sleep 1
		echo -e "\E[36m [+] Done !! \E[0m"

	elif [ $choix1 = $trc ]
	then
		
		echo -n -e "\E[36m [+] Enter a domain name/IP : \E[0m"
		read trcip
		traceroute $trcip && traceroute $trcip > traceroute.txt
		sleep 1
		echo -e "\E[36m [+] Done !! \E(0m"

	elif [ $choix1 = $rc ]
	then

		echo -e "\E[31m [+] Thinks to load all modules or run this 'marketplace install all' \E[0m"
		sleep 10 
		recon-ng 

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
		sudo rmdir Network-Infos/
		sudo rmdir Network-Scan/
		sudo rmdir Web-Scan/

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
			ex=999
			# End

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
	ex=99
	# End

	# Web
	clear
	echo "                                                       "
	echo -e "\E[34m ##################################################### \E[0m"
	echo -e "\E[34m # Web scanning                                        \E[0m"
	echo -e "\E[34m ##################################################### \E[0m"
	echo "                                                       "
	echo -e "\E[34m {10}-- Use nikto                                      \E[0m"
	echo -e "\E[34m {11}-- Use Maltego                                    \E[0m"
	echo -e "\E[34m {12}-- Use ZAP                                        \E[0m"
	echo -e "\E[34m {13}-- Use Gobuster                                   \E[0m"
	echo -e "\E[34m {14}-- Use Dirbuster (Graphical GoBus.)               \E[0m"
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


					
		
			



