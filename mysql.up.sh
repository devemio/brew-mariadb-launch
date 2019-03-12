#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
NC='\033[0m'

echo -e "${BROWN}Starting MariaDB...${NC}"

if ps aux | grep 'mysql' | egrep -qv 'grep|bash'
then
    echo -e "🔥 ${GREEN}Already running${NC}"
else
    read OUTPUT <<< $(mysql.server start | tail -1)
    if [ $OUTPUT == "SUCCESS!" ]
    then
        echo -e "🔥 ${GREEN}Running${NC}"
    else
        echo -e "${RED}Something went wrong${NC}"
    fi
fi