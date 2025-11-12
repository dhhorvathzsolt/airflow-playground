help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: # Set up airflow with docker compose
	mkdir -p ./dags ./logs ./plugins ./config
	echo "AIRFLOW_UID=$(shell id -u)" > .env
	chmod +x airflow
	docker compose up airflow-init

start: # Start services
	docker compose up -d postgres redis airflow-triggerer airflow-worker airflow-dag-processor airflow-scheduler airflow-apiserver

stop: # Stop all services
	docker compose down

cli: # Access the Airflow CLI
	./airflow

clean: # Remove all containers, volumes, and images
	docker compose down --volumes --rmi all
