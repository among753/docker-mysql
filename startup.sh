#/bin/bash

if [ ! -f /var/lib/mysql/installed ]; then
  

  echo "Initialize DB"

  mysql_install_db

  /usr/bin/mysqld_safe &
  sleep 10s
  
  echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'password' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

  killall mysqld
  touch /var/lib/mysql/installed
  sleep 10s
fi

/usr/bin/mysqld_safe

