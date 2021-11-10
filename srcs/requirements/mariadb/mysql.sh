mkdir -p /var/lib/mysql
chmod 777 /var/lib/*

mariadb-install-db -u root

mysqld -u root & sleep 5

mysql -u root -e "CREATE DATABASE IF NOT EXISTS wp;"
mysql -u root -e "CREATE USER IF NOT EXISTS 'wp_user'@'%' IDENTIFIED BY '1';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'wp_user'@'%' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '1';"