# This script passes the meteor app logs and puts then in the orion.hosting app.log file
while true; do
  sudo docker exec -it laravel tail -f /share/storage/logs/laravel.log >> /home/deploy/app.log
  echo "\n" >> /home/deploy/app.log
  sleep 2s
done