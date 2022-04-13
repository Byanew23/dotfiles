#!/bin/bash

FILES="bash
flameshot
git
kitty
vim
vscode"

set -e

args_with_no="--dotfiles --no --verbose --target=/home/$(whoami)/"
args="--dotfiles --verbose --target=/home/$(whoami)/"

SELECTED="The following configs are selected: "

stow_individually() {
	for f in $FILES
	do
		echo "Do you want to stow $f"
		select yne in "Yes" "No" "Exit"
		do
	    	case $yne in
    	    	Yes ) stow $args "$f" || adopt_err $f
						break;;
        		No ) break;;
				Exit ) exit;;
    		esac
		done
	done
	echo "You are done! 🥳"
	exit
}

adopt_err(){
	echo ""
	echo "❗ Try adopting the file using 'stow --adopt $1 and try again!"
	echo ""
}

for f in $FILES
do
	SELECTED+="$f, "
done
echo $SELECTED

echo ""


while true; do
	echo "What do you want to do?"
	select opt in "Show me what will happen" "Stow Them" "Stow them individually" "Exit"
	do
		case $opt in
			"Show me what will happen" ) for f in $FILES; do stow $args_with_no $f || adopt_err $f; done; break;;
			"Stow Them" ) for f in $FILES; do stow $args $f || adopt_err $f; done; echo "You are done! 🥳"; exit;;
			"Stow them individually" ) stow_individually; break;;
			"Exit" ) echo "You are done! 🥳"; exit;;
		esac
	done
done
