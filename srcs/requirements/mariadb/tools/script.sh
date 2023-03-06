#!/bin/sh

sleep 2

#ls -la /etc/init.d
#which mysql_secure_installation

#service mysql start || echo "SERVICE N'AS PAS FONCTIONNE"

/etc/init.d/mysql

if [ -d "/var/lib/mysql/$MYSQL_DDB_NAME" ]
then
    echo "EVERYTHING FINE ! NOTHING TO DO"
else
    mysql_secure_installation <<_EOF_
rootpass
y
rootpass
rootpass
y
n
y
y
_EOF_


mysql -u root -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DDB_NAME}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

#mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DDB_NAME}\`;"
#mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
#mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DDB_NAME}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DDB_NAME}\`;"
mysql -u root -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DDB_NAME}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysqladmin -u root shutdown;

#We apply our changement before changing root password, otherwise the  script won't be able to exec the remaining commands
#mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
#mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

#mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown;

fi

exec mysqld_safe 
