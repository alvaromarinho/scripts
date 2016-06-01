clear
echo
echo
echo "***** SCRIPT DE INSTALAÇÃO DO LARAVEL *****"
echo
echo "Continue (Y*/N)?"

read opt
echo

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

cd /var/www/

echo
echo "Wait a minute . . ."
echo

curl -sS https://getcomposer.org/installer | php
clear

sudo mv composer.phar /usr/local/bin/composer

clear
echo
echo "Enter the project name:"
read foldername
echo
echo "Wait a minute . . ."
echo
composer create-project laravel/laravel $foldername --prefer-dist
clear

cd $foldername
sudo chmod -R 777 storage/

cd /etc/apache2/sites-available
sudo touch $foldername.dev.conf

echo "
<VirtualHost *:80>
  ServerName $foldername.dev
  DocumentRoot /var/www/$foldername/public
   <Directory /var/www/$foldername/public>
     Options Indexes FollowSymLinks
     AllowOverride All
     Require all granted
   </Directory>
</VirtualHost>
" | sudo tee /etc/apache2/sites-available/$foldername.dev.conf

sudo a2ensite $foldername.dev.conf

cd /etc/
sudo sed -i '1s/^/127.0.0.1	'$foldername'.dev\n/' hosts
sudo service apache2 reload

clear
cd /var/www/$foldername/
php artisan serve

