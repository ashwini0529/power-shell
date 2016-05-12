# A shell script to install LAMP (Linux, Apache, MYSQL,PHP) on Ubuntu 14.04 LTS)



#Update 
echo '************Getting the latest update************'
sudo apt-get update

#Install Apache
echo '************Installing Apache************'
sudo apt-get install apache2 -y

#Install MySQL
echo '************Installing MySQL************'
sudo apt-get install mysql-server php5-mysql -y

#Setup mysql db
echo 'Please setup MySQL'
mysql_install_db


#Install PHP
echo '************Installing PHP************'
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt -y


:'
We want to move the PHP index file highlighted above to the first position after the DirectoryIndex specification, like this:

<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
'
sudo sed -i -- 's/DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm/DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm/g' /etc/apache2/mods-enabled/dir.conf


#Restart apache Server 

sudo service apache2 restart

#Finished installation of lamp stack
