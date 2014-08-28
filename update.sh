#!/bin/bash

echo "This script needs to be executed on the local directory of the repository"
#update from the git repo
git pull
input=$1
answer="y"

#detect if passed a valid file
if [[ -r $input ]]
 then
	echo "do you want to update mysql database with:$1"
	echo -n "(Y/n)?"
	read answer
fi

if [ $answer == "y" -o $answer == "yes" ]
  then
	echo "yes!"
else
	echo "no!"
	input=""
fi

while [[ ! -r $input && $input != "q" ]]
  do
	echo "Type a readable SQL file as a parameter or 'q' to quit"
	read input
done

if [ $input != "q" ]
  then	
	mysql -u gestioCI -ppasswor gestioCI_butterfly < $input
fi

echo "end of the script"
