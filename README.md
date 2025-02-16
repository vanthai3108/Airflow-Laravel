# Apache Airflow with Laravel App

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

Wait too long, check airflow-worker looking for errors
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
