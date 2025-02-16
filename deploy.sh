#!/bin/bash
echo "
██████╗ ███████╗██████╗ ██╗      ██████╗ ██╗   ██╗
██╔══██╗██╔════╝██╔══██╗██║     ██╔═══██╗╚██╗ ██╔╝
██║  ██║█████╗  ██████╔╝██║     ██║   ██║ ╚████╔╝
██║  ██║██╔══╝  ██╔═══╝ ██║     ██║   ██║  ╚██╔╝
██████╔╝███████╗██║     ███████╗╚██████╔╝   ██║   ██╗██╗██╗
╚═════╝ ╚══════╝╚═╝     ╚══════╝ ╚═════╝    ╚═╝   ╚═╝╚═╝╚═╝

"
rm -rf airflow-webserver.pid
rm -rf airflow-worker.pid
rm -rf webserver_config.py
docker-compose down
docker rmi -f $(docker images -aq)
docker-compose build --no-cache
docker-compose up -d

# Wait until "airflow-worker" service is healthy
while ! docker-compose ps --filter "status=running" airflow-worker | grep "healthy" > /dev/null; do
  echo "Waiting for airflow-worker service to become healthy..."
  sleep 10
done
echo "Airflow done"

echo "Continue..."
echo "For language project code"
docker-compose exec -it -u root airflow-worker sh worker-entrypoint.sh

echo ""
echo "_______________________END_______________________"
