# This script will run inside docker machine
/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1
composer install
chmod -R o+w storage/
php artisan migrate --force
