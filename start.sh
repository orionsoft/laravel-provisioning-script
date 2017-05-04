sudo apt-get update

# Installing Docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
sudo apt-cache policy docker-engine
sudo apt-get install -y docker-engine

# Installing Docker Container
sudo docker pull mtmacdonald/docker-laravel:1.4.0

# Moving Enviroment variables
sudo cp /home/deploy/.env  /home/deploy/app/.env
sudo cp /home/deploy/script/provision.sh  /home/deploy/code/provision.sh
# Run Docker container
sudo docker run -d \
  -v /home/deploy/code:/share \
  -p 80:80 \
  --name laravel \
  --restart=always \
  mtmacdonald/docker-laravel:1.4.0

# Running provision command inside Docker
sudo docker exec -it laravel bash /share/provision.sh

# Running provision command inside Docker
sudo docker exec -it laravel tail -f /share/storage/logs/laravel.log >> /home/deploy/app.log
