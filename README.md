# Structure 
- duckdb_task
    - **data**  - dir with raw data
  - Dockerfile
  - requirements.txt
  - **models** - dbt models from github
  - **bin.sh** - script for image

# Explain Dockerfile
```dockerfile
#Image with dbt and duckdb
FROM xemuliam/dbt:duckdb  

COPY . /app
COPY profiles.yml /root/.dbt/

WORKDIR /app

#CLI to iteract with duckdb 
RUN pip install duckcli

RUN chmod +x bin.sh

#Script to run dbt and raw data
CMD ["./bin.sh"]
```

```shell
#!/bin/bash

# Create tables from CSV using duckcli
duckcli -D jaffle_shop.duckdb -e "
create table if not exists raw_customers as select * from read_csv_auto('data/raw_customers.csv');
create table if not exists raw_orders as select * from read_csv_auto('data/raw_orders.csv');
create table if not exists raw_payments as select * from read_csv_auto('data/raw_payments.csv');
show tables;
"


# Run dbt
dbt run

# Allow to keep the container running
exec tail -f /dev/null
```

# How to run the task

1. build the docker image
```bash
docker build -t duckdb_task .
```

2. run the docker image
```bash
docker run duckdb_task
```

