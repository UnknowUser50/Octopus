Octopus Script : Network Toolbox 
Advice : Run the script as "sudo"

#-------------------------------------------------------------------------------------------------------------#

Presentation :


This is a bash script for Network information, scanning and web analysis. 
In this first version, you have 3 main modules.

#-------------------------------------------------------------------------------------------------------------#


#-------------------------------------------------------------------------------------------------------------#

1) Network Information :
	- DNS information with nslookup, dig, whois
	- Data informations with Traceroute and ping 
	- More general on the network Recon-NG
	
	For Regon-NG you should install all modules manually or use this command :
		marketplace install all
	You can see the manual : man recon-ng 

#-------------------------------------------------------------------------------------------------------------#	
	

#-------------------------------------------------------------------------------------------------------------#	

2) Network Scanning : 
	- Somes scripts of Nmap & NSE (Nmap Scripting Engine)
	- Graphical version of Nmap : Zenmap ( You can see the network mapping ... )
	- UFW : Linux Firewall, this module set the firewall on enable
		you can see the manual with : man ufw or ufw --help
		
#-------------------------------------------------------------------------------------------------------------#

		
#-------------------------------------------------------------------------------------------------------------#
	
3) Web Scanning : 		
	- Nikto for scan an website, to find security vulnerabilities (He give you : CVE & OSVDB)  
		man nikto
	- Maltego (footprinting) for all research of structured information
		YOU NEED TO BE REGISTER ON MALTEGO !!! 
	- ZAP (OWASP) : Start ZAP, you can choose manual scan or automated scan. 
		Just enter the target ( URL or IP address ) and RUN
	- Gobuster : List all the secret directory of a website. For Gobuster you have many wordlists in
		/usr/share/dirb/wordlists/ or in /usr/share/wordlists/dirbuster/
	- Dirbuster : Graphical mode of Gobuster
	
#-------------------------------------------------------------------------------------------------------------#	
	
For information : 

This is the first version of Octopus. In the next updates, various modules will be added.
My github : https://github.com/UnknowUser50/


        /\
       /  \
      /    \
     /   |  \
    /    |   \
   /     |    \ 
  /            \
 /       .      \
/________________\	

--> I am not responsible for your actions, this script uses pentest or information application, accessing or scanning a system that does not belong to you is punishable.

#-------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------#
#-------------------------------------------------------------------------------------------------------------#

New version 1.1 ==> New design

Two new Nmap's modules : 
----> Trace scan
----> Os detection

----> Wireshark
#You can now use WireShark in Network Information

----> Legion / Sparta
Dependubg on your version, you can use Legion or Sparta
(Legion for Kali 2020) AND (Sparta for inferior)

----> New Main module ! Manual / Documentation 
If you don't know how does one of the script/application work, you can see his manual.
If one of the manual doesn't appear, use the following commande : 
<name-for-man> --help/-h 


Rectification for 1.1.1 : somes bugs



