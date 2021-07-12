# Contributions_Panel

Playing with contributions panel
Goal
It's not the first time I meet a person who is worried about GitHub contributions panel.

This repository is my way to tell:

Please, relax and enjoy.

How it works
You need to choose a Sunday (eg. 10th of April, 2016)

$> ./scripts/create-space-invader.sh '04/10/2016'
If it has no execution permission:

$> chmod +x ./scripts/create-space-invader.sh
Result
I have a space invader in 2019:

::::::::::THE SCRIPT:::::::::::


#!/bin/bash

# Header created by http://www.network-science.de/ascii/
function print_banner() {
    echo "...................................................................."
    echo "                                _                     _             "
    echo "                               (_)                   | |            "
    echo "  ___ ____   ____  ____ ____    _ ____ _   _ ____  _ | | ____  ____ "
    echo " /___)  _ \ / _  |/ ___) _  )  | |  _ \ | | / _  |/ || |/ _  )/ ___)"
    echo "|___ | | | ( ( | ( (__( (/ /   | | | | \ V ( ( | ( (_| ( (/ /| |    "
    echo "(___/| ||_/ \_||_|\____)____)  |_|_| |_|\_/ \_||_|\____|\____)_|    "
    echo "     |_|                                                            "
    echo "...................................................................."
    echo ""
}

if [ "$#" -lt 1 ]; then
    print_banner
    echo -e "\nUse: $0 'MM/DD/YYYY'\n\nNote: The date must be a Sunday"
    exit
fi

INITIAL_DATE="$1"

SPACE_INVADER=(0 0 0 1 1 1 0
               0 0 1 1 0 0 0
               0 1 1 1 1 1 0
               1 1 0 1 1 0 1
               0 1 1 1 1 0 1
               0 1 1 1 1 0 0
               0 1 1 1 1 0 1
               1 1 0 1 1 0 1
               0 1 1 1 1 1 0
               0 0 1 1 0 0 0
               0 0 0 1 1 1 0)

git init
for index in ${!SPACE_INVADER[*]}
do
    if [ ${SPACE_INVADER[$index]} -eq 1 ]
    then
        echo "Commit for index: $index" >> commits.log
        git add commits.log
        git commit -m "Message for index $index"
        git commit --amend --no-edit --date="$(date --date="$INITIAL_DATE + $index day" -R)"
    fi
done
echo -e "\nDone!! Ready to push!!"
