#!/bin/bash

#This script needs to be executed on the local directory of the repository
#update from the git repo
git pull
input=$1
answer="y"

#detect if passed a valid file

if [[ $input == "" ]]
  then
    echo "Possible sql files:"
    ls *.sql
fi

while [[ ! -r $input && $input != "q" ]]
  do
	echo "Type a readable SQL file as a parameter or 'q' to quit"
	read input
done

if [ $input != "q" ]
  then
    user='gestioCI'
    password='gestioCI'
    dbName='gestioCI_butterfly'
    host='localhost'
    echo "dropping all tables"
    for i in `mysql -u$user -p$password -h $host  $dbName -e "show tables" | grep -v Tables_in` ; do mysql -u$user -p$password -h $host $dbName -e "SET FOREIGN_KEY_CHECKS = 0; drop table $i ; SET FOREIGN_KEY_CHECKS = 1" ; done
	echo "updating the database"
	mysql -u $user -p$password -h $host $dbName < $input
fi

echo "end of the script"
