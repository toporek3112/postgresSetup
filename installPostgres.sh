#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

printf "${GREEN}Installing postgres... ${NC}\n"
if sudo apt install postgresql postgresql-contrib -y;then
	
	print "${GREEN}successfully isntalled${NC}\n"

	if sudo -u postgres psql -c "ALTER USER postgres with PASSWORD 'postgres';" ;then
		print "${GREEN}changed password to \"postgres\"${NC}\n"       
		sed -i 's/peer/md5/g' /etc/postgresql/10/main/pg_hba.conf
		
		printf "${GREEN}changed postgres configuration from peer to md5${NC}\n"
		printf "${GREEN}restarting postgres${NC}\n"
		service postgresql restart
	else
 		printf "${RED}error${NC}\n"
	fi		
else 
	printf "${RED}install failed${NC}\n"
fi
