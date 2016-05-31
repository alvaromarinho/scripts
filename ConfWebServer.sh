clear
echo
echo
echo "***** LAMP INSTALATION AND CONFIGURATION *****"
echo
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

echo
echo
echo "Checking necessary packages! Command sudo will be executed. Enter the password if necessary . . ."
echo
echo

sudo apt-get update && sudo apt-get upgrade -y
clear
sudo apt-get install lamp-server^
clear

usuario=`whoami`
sudo adduser $usuario www-data
sudo chown $usuario:www-data -R /var/www/
sudo chmod 755 -R /var/www/

sudo service apache2 restart 

sudo cp -r /usr/share/phpmyadmin/ /var/www/phpmyadmin

sudo a2enmod rewrite

cd /etc/apache2/sites-available/

sudo sed -i 's/html/ /g' 000-default.conf

echo "<?php echo 'Its work!'; ?>" | sudo tee /var/www/test.php
sudo service apache2 restart 

clear
echo
echo
echo "Installation completed!"
echo
echo
