#!/bin/bash
#updating Ubuntu VM master node repositories
sudo apt update -y
#installing your apache webserver
sudo apt install apache2 -y
#adding the php ondrej repository with a --yes flag 
sudo add-apt-repository ppa:ondrej/php --yes
#update Ubuntu Vm master node repository the second time
sudo apt update -y
# installing php8.2
sudo apt install php8.2 -y
#installing php8.2 dependencies required for laravel to work seamlessly with a -y flag
sudo apt install php8.2-curl php8.2-dom php8.2-mbstring php8.2-xml php8.2-mysql zip unzip -y
#enabling the rewrite mode of Apache
sudo a2enmod rewrite
#restarting  apache server
sudo systemctl restart apache2
#changing directory into /usr/bin directory so as to install composer with globally module and -y flag
cd /usr/bin
install composer globally -y
sudo curl -sS https://getcomposer.org/installer | sudo php -q
#moving the content of the deafault composer.phar
sudo mv composer.phar composer
#change directory in /var/www directory to facilitate cloning of laravel repo into it
cd /var/www/
#git clone laravel from this github URL
sudo git clone https://github.com/laravel/laravel.git
#change ownership of the /var/www/laravel directory 
sudo chown -R $USER:$USER /var/www/laravel
#cd directory into the lavarel so as to install composer autoloader there
cd laravel/
#installing composer
install composer autoloader
#ensuring installation module does not include development environment 
composer install --optimize-autoloader --no-dev --no-interaction
#updating composer repo with no interaction flag
composer update --no-interaction
#copy the content of the default env file to .env 
sudo cp .env.example .env
#change ownership of www-data directory using the chown -R command for storage 
sudo chown -R www-data storage
#The above is repeated for the bootstrape/cache directory
sudo chown -R www-data bootstrap/cache
#change Directory to home
cd
#change directory to the site-avalable folder using the abosulte path
cd /etc/apache2/sites-available/
#create a file name newest so as to configure your virtual host using the nano editor
sudo touch newest.conf
#echo the content of the newest.conf file into the sites-available folder using the echo command
sudo echo '<VirtualHost *:80>
    ServerName localhost
    DocumentRoot /var/www/laravel/public

    <Directory /var/www/laravel>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/laravel-error.log
    CustomLog ${APACHE_LOG_DIR}/laravel-access.log combined
</VirtualHost>' | sudo tee /etc/apache2/sites-available/newest.conf
#enabling the newest .conf file that is now in the sites-available directory
sudo a2ensite newest.conf
#disabling the default.conf file to avoid collision when page are viewed in the web broswer
sudo a2dissite 000-default.conf
#restarting the apache2 server using the systemD command
sudo systemctl restart apache2
#change directory from the sites-availeble 
cd
#Now Installing mysql server which is one of the web stack in LAMP
sudo apt install mysql-server -y
#Also install the client version
sudo apt install mysql-client -y
#restaring the system after successful installation
sudo systemctl start mysql
#Granting root privialges to a new database, create a DB named AltschoolDB
sudo mysql -uroot -e "CREATE DATABASE AltschoolDB;"
#Create a user of the above DB named kenneth with root persmission to the DB and let the user be identified by 'Vagrant'
sudo mysql -uroot -e "CREATE USER 'kenneth'@'localhost' IDENTIFIED BY 'vagrant';"
#grant all privilages on altschoolDB to the user kenneth
sudo mysql -uroot -e "GRANT ALL PRIVILEGES ON AltschoolDB.* TO 'kenneth'@'localhost';"
#change directory into /var/www/laravel
cd /var/www/laravel
#using the sudo sed command replace somw test
sudo sed -i "23 s/^#//g" /var/www/laravel/.env
sudo sed -i "24 s/^#//g" /var/www/laravel/.env
sudo sed -i "25 s/^#//g" /var/www/laravel/.env
sudo sed -i "26 s/^#//g" /var/www/laravel/.env
sudo sed -i "27 s/^#//g" /var/www/laravel/.env
sudo sed -i '22 s/=sqlite/=mysql/' /var/www/laravel/.env
sudo sed -i '23 s/=127.0.0.1/=localhost/' /var/www/laravel/.env
sudo sed -i '24 s/=3306/=3306/' /var/www/laravel/.env
sudo sed -i '25 s/=laravel/=AltschoolDB/' /var/www/laravel/.env
sudo sed -i '26 s/=root/=kenneth/' /var/www/laravel/.env
sudo sed -i '27 s/=/=vagrant/' /var/www/laravel/.env
#generation the artisan 32 character key for access
sudo php artisan key:generate
#same for storage  as link to it
sudo php artisan storage:link
#it is time to migrate
sudo php artisan migrate
#Sedd the Database to the server
sudo php artisan db:seed
#restart apache and check in your console using the SHOW DATABASES Command
sudo systemctl restart apache2