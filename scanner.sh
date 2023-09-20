#!/bin/bash

# Get the command line arguments
#args=$(getopt -o ip:p:o:t -l help 0 "$@")
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
WHITE='\033[1;37m'
t=1
echo -e "${RED} Enter The Ip address and port Number Details:"
echo -e "${WHITE}Ip Address:";
read ip;
echo -e "${WHITE}Port Number:";
read p;
echo -e "${WHITE}Thread Default:";
read t;
echo -e "${WHITE}Output file name:";
read o;
if [[ "$args" == " -- '0'" ]]; then
	echo "";
	echo -e "${RED} No options Provided Check with --help command";
	echo "";
	exit 0;
fi


# Parse the command line arguments
while [[ true ]]; do
      # This is where the positional arguments are checked
      if [[ "$1" = -ip || "$1" = -p || "$1" = -o || "$1" = -t ]]; then
        echo -e "${RED}Unknown option: $1";
        exit 1
      fi
      while [[ true ]]; do
  	echo -e "${YELLOW}Namp Auto Scanner";
 	echo -e "${WHITE}1) Normal Ping Scan with the ip (Ping Sweep)"
  	echo -e "${WHITE}2) Ip scan with the Specified ports"
  	echo -e "${WHITE}3) Ip scan with stealth mode On"
  	echo -e "${WHITE}4) Script scan with default Script (vulners)"
  	echo -e "${WHITE}5) TCP and UDP Scan"
  	echo -e "${WHITE}6) OS Detection of the hosts"
  	echo -e "${WHITE}7) Exit"

  	echo "Enter the option"
  	read opt
  	if [[ $opt == '1' ]]; then
		  if [[ "$ip" == ' ' && "$p" == ' ' ]]; then
		  	echo -e "${RED}Please provide the ip and portnumber"
		  else
		  	echo -e "${BLUE}ping sweep scanning........"
		        nmap -sn -vvv -T"$t" "$ip" -oN  "$o.txt" > /dev/null 
		        cat "$o.txt"
		        echo -e "${YELLOW}Do you want to save the file (y or n) ?"
		        read sa
		        if [[ "$sa" == 'y' ]]; then
		        	> /dev/null
		        	echo -e "${YELLOW}Do you want to view the file (y or n) ?"
				read re
				if [[ "$re" == 'y' ]]; then
					cat "$o.txt"
				else
					> /dev/null
				fi
		        else
				rm "$o.txt"
			fi
		  fi
  	elif [[ "$opt" == '2' ]]; then
 		  if [[ "$ip" == ' ' && "$p" == ' ' ]]; then
		  	echo -e "${RED}Please provide the ip and portnumber"
		  else
		  	echo -e "${BLUE}scanning the ports...."
		        nmap -p"$p" -vvv -T"$t" "$ip" -oN  "$o.txt" > /dev/null 
		        cat "$o.txt"
		        echo -e "${YELLOW}Do you want to save the file (y or n) ?"
		        read sa
		        if [[ "$sa" == 'y' ]]; then
		        	> /dev/null
		        	echo -e "${YELLOW}Do you want to view the file (y or n) ?"
				read re
				if [[ "$re" == 'y' ]]; then
					cat "$o.txt"
				else
					> /dev/null
				fi
		        else
				rm "$o.txt"
			fi
		  fi
        elif [[ "$opt" == '3' ]]; then
 		  if [[ "$ip" == ' ' && "$p" == ' ' ]]; then
		  	echo -e "${RED}Please provide the ip and portnumber"
		  else
		  	echo -e "${BLUE}Stealth scanning...."
		        nmap -p"$p" -vvv -T"$t" -sS "$ip" -oN  "$o.txt" > /dev/null
		        cat "$o.txt" 
		        echo -e "${YELLOW}Do you want to save the file (y or n) ?"
		        read sa
		        if [[ "$sa" == 'y' ]]; then
		        	> /dev/null
		        	echo -e "${YELLOW}Do you want to view the file (y or n) ?"
				read re
				if [[ "$re" == 'y' ]]; then
					cat "$o.txt"
				else
					> /dev/null
				fi
		        else
				rm "$o.txt"
			fi
		  fi
        elif [[ "$opt" == '4' ]]; then
 		  if [[ "$ip" == ' ' && "$p" == ' ' ]]; then
		  	echo -e "${RED}Please provide the ip and portnumber"
		  else
		  	echo -e "${BLUE}Script Scan -- Vulners..."
		        nmap -p"$p" -vvv -T"$t" -sC --script="vulners" "$ip" -oN  "$o.txt" > /dev/null 
		        cat "$o.txt"
		        echo -e "${YELLOW}Do you want to save the file (y or n) ?"
		        read sa
		        if [[ "$sa" == 'y' ]]; then
		        	> /dev/null
		        	echo -e "${YELLOW}Do you want to view the file (y or n) ?"
				read re
				if [[ "$re" == 'y' ]]; then
					cat "$o.txt"
				else
					> /dev/null
				fi
		        else
				rm "$o.txt"
			fi
		  fi
        elif [[ "$opt" == '5' ]]; then
 		  if [[ "$ip" == ' ' && "$p" == ' ' ]]; then
		  	echo -e "${RED}Please provide the ip and portnumber"
		  else
		  	echo -e "${BLUE}TCP and UDP Scan...."
		        nmap -p"$p" -vvv -T"$t" -sT -sU "$ip" -oN  "$o.txt" > /dev/null
		        cat "$o.txt" 
		        echo -e "${YELLOW}Do you want to save the file (y or n) ?"
		        read sa
		        if [[ "$sa" == 'y' ]]; then
		        	> /dev/null
		        	echo -e "${YELLOW}Do you want to view the file (y or n) ?"
				read re
				if [[ "$re" == 'y' ]]; then
					cat "$o.txt"
				else
					> /dev/null
				fi
		        else
				rm "$o.txt"
			fi
		  fi 	 		 	
        elif [[ "$opt" == '6' ]]; then
 		  if [[ "$ip" == ' ' && "$p" == ' ' ]]; then
		  	echo -e "${RED}Please provide the ip and portnumber"
		  else
		  	echo -e "${BLUE}OS Detection....."
		        nmap -p"$p" -vvv -T"$t" -O "$ip" -oN  "$o.txt" > /dev/null
		        cat "$o.txt" 
		        echo -e "${YELLOW}Do you want to save the file (y or n) ?"
		        read sa
		        if [[ "$sa" == 'y' ]]; then
		        	> /dev/null
		        	echo -e "${YELLOW}Do you want to view the file (y or n) ?"
				read re
				if [[ "$re" == 'y' ]]; then
					cat "$o.txt"
				else
					> /dev/null
				fi
		        else
				rm "$o.txt"
			fi
		  fi 	 		 		 		
  	elif [[ "$opt" == '7' ]]; then
  		exit 0
  	else
		  echo -e '${RED}bye'
  	fi
      done
      exit 0
done
