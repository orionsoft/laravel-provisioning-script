# This script will run inside docker machine
echo "--------------------- Inside Share ------------------------"
cd /share
composer self-update
echo "--------------------- Installing Dependencies ------------------------"
composer install --prefer-dist
echo "--------------------- Adding permissions ------------------------"
chmod -R ug+rwx storage bootstrap/cache
