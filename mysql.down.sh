#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
NC='\033[0m'

echo -e "${BROWN}Shutting down MariaDB...${NC}"
ps aux | grep 'mysql' | egrep -v 'grep|bash' | awk '{ print $2 }' | xargs kill

ATTEMPTS=0
until [ $(ps aux | grep 'mysql' | egrep -v 'grep|bash' | wc -l) -eq 0 ] || [ $ATTEMPTS -eq 50 ]; do
    ATTEMPTS=$((ATTEMPTS+1))
done

if ps aux | grep 'mysql' | egrep -qv 'grep|bash'
then
    echo -e "${RED}MySQL is still running${NC}"
else
    echo -e "💥 ${GREEN}Stopped${NC}"
fi