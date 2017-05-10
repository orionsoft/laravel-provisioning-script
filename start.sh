# Adding Swap
# /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
# /sbin/mkswap /var/swap.1
# /sbin/swapon /var/swap.1

# Running provision command inside Docker
sleep 5s
nohup sh /home/deploy/script/pipeLogs.sh > /dev/null 2>&1 &
