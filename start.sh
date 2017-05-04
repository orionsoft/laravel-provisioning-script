sudo apt-get update

# Installing Docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
sudo apt-cache policy docker-engine

# Installing Docker Container
sudo docker pull mtmacdonald/docker-laravel:1.4.0

# Install
sudo apt-get install -y docker-engine

sudo docker run -d \
  -v /home/code/app:/shared \
  -p 80:80 \
  --name laravel \
  mtmacdonald/docker-laravel:1.4.0 \

# Moving Enviroment variables
mv /home/deploy/.env  /home/deploy/app/.env


# Running provision command inside Docker
sudo docker exec -it laravel bash /home/deploy/script/provision.sh
