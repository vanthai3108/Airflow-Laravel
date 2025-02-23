# Apache Airflow with Laravel App

## Version Infos
```
Airflow: 2.10.5
Postgres: 13 (for airflow)
Redis: 7.2 (for airflow)
Laravel: 11.42.1
PHP: 8.4.4
MySQL: 8.0
```

## Architecture

### Airflow Architecture
```
├── dags - contains all dags for airflow run
├── logs - constains all logs
├── emails
│    └── airflow
├── plugins
├── airflow.cfg - config file
└── airflow-webserver.pid
```

### Laravel Architecture
```
Laravel 11 default architecture
```

## Setup Local

### Up Database for Laravel app: database-docker-compose.yml
```
docker-compose -f database-docker-compose.yml up -d
```
### Option 1: Up Airflow - Use docker-compose.yml
```
- Fully UI with airflow
```

```
sh deploy.sh (build new)
```

If you wait too long, check airflow-worker looking for errors
```
docker-compose logs airflow-worker
```

### Option 2: Up Laravel app only - use dev-docker-compose.yml
```
- Laravel app only, not use Airflow
- Use if docker-compose for airflow too large, slow
```

```
docker-compose -f dev-docker-compose.yml up -d
```
