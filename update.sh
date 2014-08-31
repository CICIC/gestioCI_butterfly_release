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
	echo "Going to update the database"	
	mysql -u gestioCI -ppasswor gestioCI_butterfly < $input
fi

echo "end of the script"
