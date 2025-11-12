# Airflow Playground

Local environment for experimenting with Apache Airflow, done with Docker Compose, based on the official [guide](https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html).

## First Run

```
make setup start
```

## Access Airflow UI

Open your browser and go to [http://localhost:8080](http://localhost:8080), login with `airflow` / `airflow`.

## Access Cli

```
make cli
```

## Troubleshooting

- Check .env, user id needs to be set to your host user id for proper file permissions.
- Volumes will be mounted in ./dags, ./logs, ./plugins, and ./config make sure these folders exist and have proper permissions.
- Docker will need to have at least 8GB of memory allocated.
