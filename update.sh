#!/bin/bash

#This script needs to be executed on the local directory of the repository
#update from the git repo
#git pull
    user='gestioCI'
    password='gestioCI'
    dbName='gestioCI_butterfly'
    host='localhost'
    echo "dropping all tables"
    for i in `mysql -u$user -p$password -h $host  $dbName -e "show tables" | grep -v Tables_in` ; do mysql -u$user -p$password -h $host $dbName -e "SET FOREIGN_KEY_CHECKS = 0; drop table $i ; SET FOREIGN_KEY_CHECKS = 1" ; done
    python manage.py syncdb
    python manage.py migrate
    echo "updating the database"
	mysql -u $user -p$password -h $host $dbName < butterfly_types.sql
    mysql -u $user -p$password $dbName < gestioCi_butterfly_contacic.sql

echo "end of the script"
