# This script passes the meteor app logs and puts then in the orion.hosting app.log file
while true; do
  sudo docker logs laravel --follow >> /home/deploy/app.log
  #sudo docker logs -f --tail laravel >> /home/deploy/app.log
  echo "\n" >> /home/deploy/app.log
  sleep 2s
done
