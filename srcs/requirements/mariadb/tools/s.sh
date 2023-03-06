#!/bin/sh

#attendre que le conteneur soit pret
sleep 2

mysql -e "CREATE DATABASE IF NOT EXISTS \'${MYSQL_DDB_NAME}\';"

exec mysqld
