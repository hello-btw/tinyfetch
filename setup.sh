#!/bin/sh
# Tinyfetch installer
clear
if command -v figlet > /dev/null 2>&1; then
    figlet "Tinyfetch Installer"
else
    printf " \n=== Tinyfetch Installer ===\n"
fi
printf "\n\n\n\n --Super User--\n\n"
printf "\n [1] Sudo\n [2] Doas\n [3] None\n\n"
read root
if [ "$root" = "1" ]; then
	root="sudo"
	printf "\n\n Chosen Sudo!\n"
elif [ "$root" = "2" ]; then
	root="doas"
	printf "\n\n Chosen Doas!\n"
elif [ "$root" = "3" ]; then
	root=""
	printf "\n\n Chosen None!\n"
else
	printf "\n\n [$root] Unknown Option\n"
	exit 1
fi
printf "\n\n\n\n --Version--\n\n"
printf "\n [1] Nim\n [2] Bash\n\n"
read version
if [ "$version" = "1" ]; then
	printf "\nInstall [Y/N]?\n"
	read YesNo
	if [ "$YesNo" = "y" ]; then
		curl -L https://raw.githubusercontent.com/hello-btw/tinyfetch/refs/heads/main/src/tinyfetch.nim -o tinyfetch.nim
		nim c -d:release tinyfetch.nim
		if [ -n "$root" ]; then
			$root mv tinyfetch /usr/local/bin/tinyfetch-nim && printf "\n\n Installed Tinyfetch Nim Edition!\n\n"
		else
			mv tinyfetch /usr/local/bin/tinyfetch-nim && printf "\n\n Installed Tinyfetch Nim Edition!\n\n"
		fi
		rm tinyfetch.nim
		printf "\n Installation Complete!\n Usage: tinyfetch-nim\n"
	elif [ "$YesNo" = "Y" ]; then
		curl -L https://raw.githubusercontent.com/hello-btw/tinyfetch/refs/heads/main/src/tinyfetch.nim -o tinyfetch.nim
		nim c -d:release tinyfetch.nim
		if [ -n "$root" ]; then
			$root mv tinyfetch /usr/local/bin/tinyfetch-nim && printf "\n\n Installed Tinyfetch Nim Edition\n\n"
		else
			mv tinyfetch /usr/local/bin/tinyfetch-nim && printf "\n\n Installed Tinyfetch Nim Edition!\n\n"
		fi
		rm tinyfetch.nim
		printf "\n Installation Complete!\n Usage: tinyfetch-nim\n"
	elif [ "$YesNo" = "n" ]; then
		printf "\n Cancelled Installation\n"
		exit 1
	elif [ "$YesNo" = "N" ]; then
		printf "\n Cancelled Installation\n"
		exit 1
	else
		printf "\n\n [$YesNo] Unknown Option\n"
		exit 1
	fi
elif [ "$version" = "2" ]; then
	printf "\nInstall [Y/N]?\n"
	read YesNo
	if [ "$YesNo" = "y" ]; then
		curl -L https://raw.githubusercontent.com/hello-btw/tinyfetch/refs/heads/main/bash/tinyfetch -o tinyfetch
		chmod +x tinyfetch
		if [ -n "$root" ]; then
			$root mv tinyfetch /usr/local/bin/tinyfetch && printf "\n\n Installed Tinyfetch Bash Edition!\n\n"
		else
			mv tinyfetch /usr/local/bin/tinyfetch && printf "\n\n Installed Tinyfetch Bash Edition!\n\n"
		fi
		printf "\n Installation Complete!\n Usage: tinyfetch\n"
	elif [ "$YesNo" = "Y" ]; then
		curl -L https://raw.githubusercontent.com/hello-btw/tinyfetch/refs/heads/main/bash/tinyfetch -o tinyfetch
		chmod +x tinyfetch
		if [ -n "$root" ]; then
			$root mv tinyfetch /usr/local/bin/tinyfetch && printf "\n\n Installed Tinyfetch Bash Edition!\n\n"
		else
			mv tinyfetch /usr/local/bin/tinyfetch && printf "\n\n Installed Tinyfetch Bash Edition!\n\n"
		fi
		printf "\n Installation Complete!\n Usage: tinyfetch\n"
	elif [ "$YesNo" = "n" ]; then
		printf "\n Cancelled Installation\n"
		exit 1
	elif [ "$YesNo" = "N" ]; then
		printf "\n Cancelled Installation\n"
		exit 1
	else
		printf "\n\n [$YesNo] Unknown Option\n"
		exit 1
	fi
fi
clear
