git_password=XXX
site_name=152.67.183.110
TAG=1.0.0
cd ../
sudo docker login ghcr.io -u SagarIdeen -p $git_password
sudo docker pull ghcr.io/sagarideen/healthcare/healthcare:$TAG
sudo docker compose -f compose.yaml -f overrides/compose.noproxy.yaml -f  overrides/compose.redis.yaml down
sudo docker compose -f compose.yaml -f overrides/compose.noproxy.yaml -f  overrides/compose.redis.yaml up -d
sudo docker compose exec backend bench --site $site_name migrate
sudo docker compose restart backend