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
		git clone https://github.com/hello-btw/tinyfetch; cd tinyfetch
		nim c -d:release src/tinyfetch.nim
		$root cp src/tinyfetch /usr/local/bin/tinyfetch-nim && echo "\n Installed Tinyfetch Nim Edition!\n"
		rm -rf tinyfetch
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
		git clone https://github.com/hello-btw/tinyfetch; cd tinyfetch
		chmod +x bash/tinyfetch
		$root cp bash/tinyfetch /usr/local/bin/tinyfetch && echo "\n Installed Tinyfetch Bash Edition!\n"
		rm -rf tinyfetch
		echo "Usage: tinyfetch"
	elif [ "$YesNo" = "N" ]; then
		echo "Installation Cancelled"
		exit 1
	fi
fi
