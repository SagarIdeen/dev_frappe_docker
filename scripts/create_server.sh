db_password=XXX
admin_password=XXX
encryption_key=XXX
git_password=XXX
site_name=152.67.183.110
TAG=1.0.0
cd ../
sudo docker login ghcr.io -u SagarIdeen -p $git_password
sudo docker ghcr.io/sagarideen/healthcare/healthcare:$TAG
sudo docker compose -f compose.yaml -f overrides/compose.noproxy.yaml -f overrides/compose.redis.yaml up -d
sudo docker compose exec backend bench new-site $site_name  --no-mariadb-socket --mariadb-root-password $db_password --admin-password $admin_password
sudo docker compose exec backend bench --site $site_name install-app healthcare
#sudo docker compose exec backend bench --site $site_name set-config encryption_key $encryption_key
sudo docker compose exec backend bench --site $site_name enable-scheduler