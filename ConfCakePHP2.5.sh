clear
echo
echo
echo "                      ***** SCRIPT DE INSTALAÇÃO DO CAKEPHP 2.5.4 *****"
echo "		Deseja continuar? S*/N"

read opcao

#caso o usuário precisone "s" ou "S"
if [ -z $opcao ]; then
	opcao=s
fi

if [ "$opcao" == n -o "$opcao" == N ]; then
	read -p "Pressione qualquer tecla para continuar. . . escolha: [$opcao]"
	exit 0
fi

echo
echo "		Verificando pacotes necessarios. Comandos 'sudo' serao executados.
Digite a senha do usuario logado, caso seja necessario... "

#baixando o CAKEPHP
echo
echo "		Baixando o CAKEPHP 2.5.4 "
echo

cd ~
cd ../../var/www/
sudo wget https://codeload.github.com/cakephp/cakephp/legacy.zip/2.5.4

#desconpactando o arquivo
sudo unzip 2.5.4

read -p "Pressione qualquer tecla para continuar..."

#renomeando a pasta
clear
echo
echo
echo "		Digite o nome da pasta onde sera instalado o CAKEPHP 2.5.4 "
echo

read nomepasta
usuario=`whoami`
mv cakephp-cakephp* $nomepasta
sudo chown -R $usuario:$usuario $nomepasta
cd $nomepasta

#dando permissoes na pasta 'tmp'
sudo chown -R www-data:www-data app/tmp
sudo chmod -R 775 app/tmp

sudo a2enmod rewrite

#configurando o apache

cd ~
cd ../../etc/apache2/

#Apaguando o trecho <Directory /var/www> . . .  </Directory>
sudo sed -i "/Directory \/var\/www/,+4d" apache2.conf

#configurando o CAKEPHP
cd ../../var/www/$nomepasta/app/Config
sudo mv database.php.default database.php

clear
echo
echo
echo "		Abra o endereço 'localhost/phpmyadmin' no navegador e crie um banco de dados com um nome qualquer..."
echo
read -p "Pressione qualquer tecla para continuar..."

clear
echo
echo
echo "		Altere a 1ª configuraçao de 'host', 'login', 'password' e 'database' "
echo
read -p "Pressione qualquer tecla para abrir o documento..."

sudo gedit database.php

#Alterando as strings no CORE.PHP
sudo sed -i "s/Configure::write('Security.salt', '/Configure::write('Security.salt', 'kalango/g" core.php
sudo sed -i "s/Configure::write('Security.cipherSeed', '/Configure::write('Security.cipherSeed', '69/g" core.php

clear
echo
echo
echo "		Instalação do CAKEPHP 2.5.4 concluida com sucesso!"
echo
echo
