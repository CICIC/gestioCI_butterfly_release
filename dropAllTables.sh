host='localhost'
dbName='gestioCI_butterfly'
user='gestioCI'
password='gestioCI'


# drop all the tables in the database
for i in `mysql -u$user -p$password $dbName -e "show tables" | grep -v Tables_in` ; do  echo $i && mysql -u$user -p$password $dbName -e "SET FOREIGN_KEY_CHECKS = 0; drop table $i ; SET FOREIGN_KEY_CHECKS = 1" ; done

