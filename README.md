![Ocotpus-Logo](https://pbs.twimg.com/media/D3UPvfoW0AAOdCF.jpg)
# Octopus script
<br/>

## Presentation
  Octopus is a script writting in bash. I decide to develop a script for all poeple who are new to computer security 
  to make it easier for them. Each script output/results will also be written to a text file.
  **Octopus using existing tools, it only takes their use. These tools do not belong to me and I do not give them the rights.** 
  Today, Octopus has 3 analysis modules and one for connection. The modules are as follow :

**Main modules**
* Network Informations 
* Network Scanning
* Web Scanning

## Description of modules


### Network Informations
* Nslookup :
  * Nslookup for **N**ame **S**ystem **L**ook **U**p is a tool allowing to query a name server in order to obtain information concerning a domain or a host Once
  this module have been selected, all you have to do is enter a host name in order to obtain necessary information.
* Dig : 
  * Dig is a network administration command-line tool for querying the **D**omain **N**ame **S**ystem. Dig is useful for network troubleshooting. In Octopus, this is 
  the same operation as nslookup you will be asked for a domain name.
* Whois :
  * Whois is used to reveal important information about the targeted domain name, this can be useful for social engeneering or OSINT
* TraceRoute :
  * TraceRoute is a network diagnostic tool. It allow to determine the path followed by a packet. In order to use it, you need to enter a destination address, this will 
  allow you to see the entire path that the packet takes.
* Recon-ng :
  * Recon-ng is a powerfull tool that can be further explored by viewing throught the list of module. Before using it, you are going to need to install somes packages
  . First, lunch recon-ng with 
    * > recon-ng
    * > marketplace install all 
* WireShark : 
  * WireShark is a tool for scanning and analyzing requests, protocol analyzer on a network card that you choose beforehand.

### Network Scanning
* Nmap & NSE : 
  * Nmap : In this module, you will find several nmap scripts placed at your disposal, you just have to give the target IP address, Octopus will take care of performing
  the nmap scan that you have selected.
* ZenMap :
  * ZenMap : This module allow you to install and then use the graphical version of Nmap. First, it will recover the files needed for the installation and run it.
  ZenMap works the same as Nmap.
* UFW :
  * UFW is a simple netfilter command line configuration tool which is an alternative to the IpTables tool. UFW allows automatic configuration of the firewall when
  installing the program when it is needed.
  
### Web Scanning
* Nikto :
    * Nikto is an important Open Source web server scanner which performs comprehensive tests against web server for multiple items, including over 6700 potentially 
    dangerous files/programs.
* Maltego :
  * Maltego is a software used for open-source intelligence and forensic. Maltego focuses on providing a library of transforms for discovery of data from
  open-sources and visualizing that informations in a graph format.
* ZAP : 
  * OWASP ZAP is an open-source web application security scanner. It is intended to be used by both those new application security as well as professional penetration
  testers.
* Gobuster : 
  * Gobuster is a tool used for brute-force URLs, directory and files in web sites. You just have to enter the URL you want targeted as well as the path to the world list. 
   You can find wordlists here :
   * /usr/share/wordlists/
   I advise you to use this wordlists which is very complete :
    > /usr/sahre/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt
* DirBuster : 
  * Dirbuster is the graphical version of Gobuster, it allows you to perform the same actions as Dirbuster.
* SPARTA / Legion : 
  * The software will depend on the version of Kali you are using. This tool is for network infrastructure pentesting. With it you will simply need to enter an IP address. 
  You can then use NMAP and even Gobuster as well as others tools. I'll let you read the documentation for more informations.
* SQL-Map :
  * Sql-map is an open-source software that is used to detect and exploit database vulnerabilities and provides options for injecting malicious code into them.
  
## Description of the connection module :

### SSH connection
* SSH for **S**ecure **SH**ell is a secure communication protocol. With Octopus, you just need to enter the session name and the IP address to which you want to establish
an SSH connection :
> ssh root@127.0.0.1 

# DISCLAMER ! 
Octopus is a tool reserved for **professional** or **educational** use ! Under no circumstances should it be used for the purpose of harming others or a system that does
not belong to you. As a reminder, **any intrusion or attempted intrusion is punishable by law !**
I am no way responsible for your actions, thank you for your understanding.
