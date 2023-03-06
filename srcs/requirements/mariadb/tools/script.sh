#!/bin/sh

#attendre que le conteneur soit pret
sleep 2

#if [ -d /var/run/mysqld ]; then
#	chown -R mysql:mysql /run/mysqld
#else
#	mkdir -p /run/mysqld
#	chown -R mysql:mysql /run/mysqld
#fi
		

#if [ -d /usr/var/lib/mysql/mysql ]; then
#	chown -R mysql:mysql /usr/var/lib/mysql

#else
#	mysql_install_db --user=mysql --ldata=/usr/var/lib/mysql > /dev/null
#	chown -R mysql:mysql /usr/var/lib/mysql
#fi

#USE mysql

ls -la /etc/init.d

which mysql_secure_installation

rc-service mysql start || echo "SERVICE N'AS PAS FONCTIONNE"

#Create database
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DDB_NAME}\`;"

#Create user and grant privileges
#We delete the 'anonymous user' so you can't connect with no username
#the '%' allows remote connection to all hosts and localhost only from the ddb machine
mysql -e "DELETE FROM mysql.user WHERE User=''"
mysql -e "CREATE USER \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DDB_NAME}\`.* TO \`${MYSQL_USER}\`@'%';"

#We apply our changement before changing root password, otherwise the  script won't be able to exec the remaining commands
mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown;

exec mysqld 

#rc-service mariadb start
#exec usr/bin/mysql --user=mysql

