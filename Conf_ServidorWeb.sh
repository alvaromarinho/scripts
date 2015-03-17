clear
echo
echo
echo "                    ***** SCRIPT DE INSTALAÇÃO E CONFIGURAÇÃO DO SERVIDOR WEB E CAKEPHP 2.5.4 *****"
echo
echo "          Deseja continuar? S*/N"

read opcao

if [ -z $opcao ]; then # caso o usuário precisone "s" ou "S"
	opcao=s
fi

if [ "$opcao" == n -o "$opcao" == N ]; then
	read -p "Pressione qualquer tecla para continuar. . . escolha: [$opcao]"
	exit 0
fi

echo
echo "Verificando pacotes necessarios. Comandos 'sudo' serao executados.
Digite a senha do usuario logado, caso seja necessario... "
echo
echo

#instalação dos pacotes necessários
sudo apt-get update
clear
sudo apt-get install aptitude
sudo aptitude install git apache2 php5 libapache2-mod-php5 mysql-server-5.5 phpmyadmin

sudo cp -r /usr/share/phpmyadmin/ /var/www/phpmyadmin

echo
echo
echo "		Instalaçao dos pacotes necessarios concluida..."
echo

usuario=`whoami`

cd ~
cd ../../etc/apache2/sites-available/

clear
echo
echo
echo "		Apague /HTML do trecho 'DocumentRoot /var/www/html', SALVE e FECHE o documento"
echo
read -p "Pressione qualquer tecla para continuar..."

sudo gedit 000-default.conf

cd ../sites-enabled/

clear
echo
echo
echo "		NOVAMENTE Apague /HTML do trecho 'DocumentRoot /var/www/html', SALVE e FECHE o documento"
echo
read -p "Pressione qualquer tecla para continuar..."

sudo gedit 000-default.conf

#dando permissão de escrita na pasta www
sudo chown $usuario:$usuario /var/www/ -R

#criando um arquivo de teste
echo -e '<?php phpinfo(); ?>' > /var/www/teste.php 

#reiniciar o servidor Apache
sudo service apache2 restart 

clear
echo
echo
echo "		Instalação do Servidor Web Concluida!"
echo
echo
