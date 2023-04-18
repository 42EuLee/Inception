#!/bin/bash

# use mysql
# select * from user\G;

# service mysql start

# sleep 1

echo "USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
CREATE DATABASE $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER' IDENTIFIED BY '$MYSQL_PASSWORD';
CREATE USER '$MYSQL_ADMIN' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN'@'localhost' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'; 
FLUSH PRIVILEGES;" > /app/tools/init.sql

mysql_install_db --user=mysql
mysqld --user=mysql --bootstrap < /app/tools/init.sql
mysqld_safe
