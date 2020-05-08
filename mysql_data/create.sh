docker exec -i mysql mysql -uroot -proot  <<< "CREATE DATABASE IF NOT EXISTS $1 CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';"
