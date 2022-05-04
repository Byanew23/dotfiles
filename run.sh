#!/bin/bash

FILES="bash
flameshot
git
kitty
vim
vscode
starship"

set -e

args_with_no="--no --verbose --target=/home/$(whoami)/"
args="--verbose --target=/home/$(whoami)/"

SELECTED_MESSAGE="The following configs are selected: "
DONE_MESSSAGE="You are done! 🥳"

stow_individually() {
	for f in $FILES
	do
		echo "Do you want to stow $f"
		options=("Yes" "No" "Exit")
		select yne in "${options[@]}"
		do
	    	case $REPLY in
    	    	1 ) stow $args "$f" || adopt_err $f
						break;;
        		2 ) break;;
				3 ) echo $DONE_MESSSAGE; exit;;
    		esac
		done
	done
	echo $DONE_MESSSAGE
	exit
}

adopt_err(){
	echo ""
	echo "❗ Try adopting the file using 'stow --adopt $1 and try again!"
	echo ""
}

for f in $FILES
do
	SELECTED_MESSAGE+="$f, "
done
echo $SELECTED_MESSAGE

echo ""


while true; do
	echo "What do you want to do?"
	options=("Show me what will happen" "Stow Them" "Stow them individually" "Exit")
	select opt in "${options[@]}"
	do
		case $REPLY in
			1 ) for f in $FILES; do stow $args_with_no $f || adopt_err $f; done; break;;
			2 ) for f in $FILES; do stow $args $f || adopt_err $f; done; echo $DONE_MESSSAGE; exit;;
			3 ) stow_individually; break;;
			4 ) echo $DONE_MESSSAGE; exit;;
		esac
	done
done
