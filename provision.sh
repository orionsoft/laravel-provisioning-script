# This script will run inside docker machine
composer self-update
/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=512
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1
cd share
composer install --prefer-dist
chmod -R o+w storage/
php artisan migrate --force
