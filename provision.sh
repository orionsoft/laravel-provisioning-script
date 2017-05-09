# This script will run inside docker machine
cd share
composer self-update
chmod -R ug+rwx storage bootstrap/cache
composer install --prefer-dist
