function print_banner() { echo "...................................................................." echo " _ _ " echo " () | | " echo " ___ ____ ____ ____ ____ _ ____ _ _ ____ _ | | ____ ____ " echo " /) _ \ / _ |/ ) _ ) | | _ \ | | / _ |/ || |/ _ )/ )" echo "| | | | ( ( | ( (( (/ / | | | | \ V ( ( | ( (| ( (/ /| | " echo "(/| ||/ _|||_)) ||| ||_/ _|||_|_)| " echo " || " echo "...................................................................." echo "" }

if [ "$#" -lt 1 ]; then print_banner echo -e "\nUse: $0 'MM/DD/YYYY'\n\nNote: The date must be a Sunday" exit fi

INITIAL_DATE="$1"

SPACE_INVADER=(0 0 0 1 1 1 0 0 0 1 1 0 0 0 0 1 1 1 1 1 0 1 1 0 1 1 0 1 0 1 1 1 1 0 1 0 1 1 1 1 0 0 0 1 1 1 1 0 1 1 1 0 1 1 0 1 0 1 1 1 1 1 0 0 0 1 1 0 0 0 0 0 0 1 1 1 0)

git init for index in ${!SPACE_INVADER[*]} do if [ ${SPACE_INVADER[$index]} -eq 1 ] then echo "Commit for index: $index" >> commits.log git add commits.log git commit -m "Message for index $index" git commit --amend --no-edit --date="$(date --date="$INITIAL_DATE + $index day" -R)" fi done echo -e "\nDone!! Ready to push!!"
