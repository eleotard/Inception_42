#!/bin/sh

rc-service mariadb start

#Create database

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DDB_NAME}\`;"

#THE '%' ALLOW REMOTE CONNECTION TO ALL HOST, AND LOCALHOST ONLY FROM THE DDB MACHINE


#Create user and grant privileges
#We delete the 'anonymous user' so you can't connect with no username
mysql -e "DELETE FROM mysql.user WHERE User=''"

mysql -e "CREATE USER \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DDB_NAME}\`.* TO \`${MYSQL_USER}\`@'%';"


#We apply our changement before changing root password, otherwise the script won't be able to exec the remaining commands

mysql -e "FLUSH PRIVILEGES;"


#Then we change root password

mysqladmin -u root password $MYSQL_ROOT_PASSWORD
