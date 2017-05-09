# Adding Swap
/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1
echo "--------------------- Swap Added ------------------------"
# Moving Enviroment variables
sudo cp /home/deploy/.env  /home/deploy/app/.env
sudo cp /home/deploy/script/provision.sh  /home/deploy/app/provision.sh
echo "--------------------- Copied Files ------------------------"
# Run Docker container
sudo docker run -d \
  -v /home/deploy/app:/share \
  -p 80:80 \
  --name laravel \
  --restart=always \
  mtmacdonald/docker-laravel:1.4.0
echo "--------------------- Docker started ------------------------"
# Running provision command inside Docker
sudo docker exec -i laravel bash /share/provision.sh
echo "--------------------- Docker Provisioned ------------------------"
# Running provision command inside Docker
sleep 5s
# nohup sh /home/deploy/script/pipeLogs.sh > /dev/null 2>&1 &
