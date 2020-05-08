echo "Import DB $1..."
cat "$PWD/$1.sql" | docker exec -i mysql /usr/bin/mysql -u root --password="root" $1
echo "DB $1 imported!"

# mysql == container_name
# coucou == db_name
