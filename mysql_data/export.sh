# Backup
echo "Exporting DB $1..."
docker exec mysql /usr/bin/mysqldump -u root --password="root" $1  > $PWD/$1.sql
echo "DB exported in $PWD/$1.sql"