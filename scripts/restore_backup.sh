db_password=XXX
site_name=XXX
db_backup=XXX
# cd ../
sudo docker cp backup/$db_backup $(sudo docker compose ps -q backend):/tmp
cd ../
sudo docker compose exec backend bench --site $site_name restore /tmp/$db_backup --mariadb-root-password $db_password
sudo docker compose exec backend bench --site $site_name migrate
sudo docker compose restart backend