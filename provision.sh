# This script will run inside docker machine
composer self-update
cd share
composer install --prefer-dist
chmod -R ug+rwx storage bootstrap/cache
