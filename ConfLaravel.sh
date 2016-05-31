clear
echo
echo
echo "***** SCRIPT DE INSTALAÇÃO DO LARAVEL *****"
echo "Continue (Y*/N)?"

read opt

if [ -z $opt ]; then
	opt=y
fi

if [ "$opt" == n -o "$opt" == N ]; then
	echo
	read -p "Installation canceled. Press any key to continue . . ."
	clear
	exit 0
fi

sudo apt-get update && sudo apt-get upgrade -y
clear
sudo apt-get install curl
clear

curl -sS https://getcomposer.org/installer | php

sudo mv composer.phar /usr/local/bin/composer

clear
echo
echo
echo "Enter the project name: "
read foldername

composer create-project laravel/laravel $foldername --prefer-dist

clear
echo
echo
echo "Installation completed!"
echo
echo
