# This script will run inside docker machine
echo "--------------------- Inside Share ------------------------"
cd /share
composer self-update
echo "--------------------- Installing Dependencies ------------------------"
composer install
echo "--------------------- Adding permissions ------------------------"
chmod -R guo+w storage
chmod -R ug+rwx bootstrap/cache
