# This script will run inside docker machine
composer self-update
composer install --prefer-dist
sudo chmod -R ug+rwx storage bootstrap/cache
