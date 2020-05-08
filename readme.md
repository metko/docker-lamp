# Simple Docker LAMP

This is a personal lamp setting adapated to my needed, feel free to also adapt it as you want. 
A docker lamp to boost develop and deploy process

## Setup

### Apache

First, edit the the file `/conf/vhost.apache.conf` and set your project webroot folder :
````
<VirtualHost *:80>
    # Proxy .php requests to port 9000 of the php-fpm container
    ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://php:9000/var/www/html/your_webroot_folder/$1

    DocumentRoot /usr/local/apache2/htdocs/your_webroot_folder
    <Directory /usr/local/apache2/htdocs/your_webroot_folder>
        DirectoryIndex index.php
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    
</VirtualHost>
````

You can leave it empty if you want that public act like the webroot folder

### PHP

Depending of the php version you want to use (default is 7.4), adjust the docker file to use in `docker-compose.yml`:
```
 dockerfile: ./dockerfiles/php74
 # dockerfile: ./dockerfiles/php72
```
 You can add php extensions in the proper dockerfile if you need. Also, you add a new version by creating a new dockerfile at the same level.

***TODO**: Add php.ini conf linked*

### Mysql

Host: `mysql`
Login: `root`
Password: `root`
port: `3306`

If you want to export a db, just run the script in `/mysql_data/export.sh your_db_name`
It will generate the `backup.sql` file in the same folder

To make an import, make sure first you have the db created (running `/mysql_data/create.sh your_db_name`) and then execute the command`/mysql_data/import.sh your_db_name`

Note: you must run this command as admin/sudo referring to your os

If you want to replacxe some string in your sql file, like in wordpress to change the url, you can run `/mysql_data/str_replace what_to_change into_what wich_file`
exemple: `/mysql_data/str_replace.sh local.app myapp.local local`. It will add the `.sql` extension into the script.
This command run on OSX and maybe Lnux aswell, for windows, be sure to adapt the command `sed`, maybe you don't need the `LC_TYPE attribute...`

### PhpMyAdmin

You can access it at the address: `localhost:7000`. Feel free to change the port if needed in `docker-compose.yml`

### Mailhog

You can set a mail catching system, just setup you app like this : 

 - Host: `'mailhog'`
 - Ports: `1025`
 - smtp: `true`

To access your inbox mail, go to localhost:8025. You can also change the port in the `docker-compose.yml`  like this: 
```
ports:
      - 1025:1025 # smtp server
      - 9999:8025 # web ui -> now i have the access at localhost:9999
``` 


That's it for now...