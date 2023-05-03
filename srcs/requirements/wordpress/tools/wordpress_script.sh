#!/bin/sh

if [ -f "/var/lib/mysql/$M" ]
then
	echo "Wordpress already exist"

else
	wget https://wordpress.org/latest.tar.gz

	tar -xvf latest.tar.gz

	cp -R wordpress /var/www/html/

	chown -R www-data:www-data /var/www/html/wordpress/

	chmod -R 755 /var/www/html/wordpress/

	mkdir /var/www/html/wordpress/wp-content/uploads

	chown -R www-data:www-data /var/www/html/wordpress/wp-content/uploads/

	rm latest.tar.gz

	cd /var/www/html/wordpress/

	cp wp-config-sample.php wp-config.php

	sed -i "s/username_here/$MYSQL_ADMIN/g" wp-config.php
	sed -i "s/password_here/$MYSQL_ADMIN_PASSWORD/g" wp-config.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php
	sed -i "s/localhost/"$MYSQL_LOCALHOST"/g" wp-config.php

	wp core install --url=localhost --title="WP-CLI" --admin_user=wpcli --admin_password=wpcli --admin_email=info@wp-cli.org --allow-root  --path=/var/www/html/wordpress/
	wp user create bob bob@example.com --user_pass=bob --role=author --display_name=bob --allow-root --path=/var/www/html/wordpress/


fi
sed -i s/\\/run\\/php\\/php7\\.3-fpm\\.sock/9000/ /etc/php/7.3/fpm/pool.d/www.conf
mkdir -p /run/php/

exec $@
