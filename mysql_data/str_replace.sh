echo "Replacing... It can take some time..."
LC_CTYPE=C sed -i '' "s/$1/$2/g" "$PWD/$3.sql"
echo "Finished!"
