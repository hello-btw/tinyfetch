#!/bin/sh
# Tinyfetch installer
clear
echo "\n ----Tinyfetch Installer----\n"
echo "\n You will need nim and bash for this to work!\n"
echo "\n What do you use?\n"
echo "\n [1] sudo\n [2] doas\n [3] please\n [4] none\n"
read root
if [ "$root" = "1" ]; then
	root="sudo"
	echo "\n Chosen sudo!\n"
elif [ "$root" = "2" ]; then
	root="doas"
	echo "\n Chosen doas!\n"
elif [ "$root" = "3" ]; then
	root="please"
	echo "\n Chosen please!\n"
elif [ "$root" = "4" ]; then
	root=""
	echo "\n Chosen none!\n"
else
	echo "\n [$root] unknown option\n"
	exit 1
fi
echo " Nim or Bash?"
echo "\n [1] Nim\n [2] Bash\n"
read version
if [ "$version" = "1" ]; then
	echo " Chosen Nim edition!"
	echo "\n Install [Y/N]?\n"
	read YesNo
	if [ "$YesNo" = "Y" ]; then
		echo "Installing"
		curl -L https://raw.githubusercontent.com/hello-btw/tinyfetch/refs/heads/main/src/tinyfetch.nim -o tinyfetch.nim
		nim c -d:release tinyfetch.nim
		$root cp tinyfetch /usr/local/bin/tinyfetch-nim && echo "\n Installed Tinyfetch Nim Edition!\n"
		rm tinyfetch
		echo "Usage: tinyfetch-nim"
	elif [ "$YesNo" = "N" ];  then
		echo "Installation Cancelled"
		exit 1
	fi
elif [ "$version" = "2" ]; then
	echo " Chosen Bash edition!"
	echo "\n Install [Y/N]?\n"
	read YesNo
	if [ "$YesNo" = "Y" ]; then
		echo "Installing"
		curl -L https://raw.githubusercontent.com/hello-btw/tinyfetch/refs/heads/main/bash/tinyfetch -o tinyfetch
		chmod +x tinyfetch
		$root cp tinyfetch /usr/local/bin/tinyfetch && echo "\n Installed Tinyfetch Bash Edition!\n"
		rm tinyfetch
		echo "Usage: tinyfetch"
	elif [ "$YesNo" = "N" ]; then
		echo "Installation Cancelled"
		exit 1
	fi
fi
