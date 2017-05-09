# Moving Enviroment variables
sudo cp /home/deploy/.env  /home/deploy/app/.env
sudo cp /home/deploy/script/provision.sh  /home/deploy/app/provision.sh

# Run Docker container
sudo docker run -d \
  -v /home/deploy/app:/share \
  -p 80:80 \
  --name laravel \
  --restart=always \
  mtmacdonald/docker-laravel:1.4.0

ls /home/deploy/app

# Running provision command inside Docker
sudo docker exec -i laravel bash /share/provision.sh
sudo docker exec -i laravel ls share/storages
sudo docker exec -i laravel tail share/storage/logs/laravel.log -f

# Running provision command inside Docker
sleep 5s
nohup sh /home/deploy/script/pipeLogs.sh > /dev/null 2>&1 &
