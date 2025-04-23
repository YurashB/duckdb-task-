#!/bin/bash

duckcli -D jaffle_shop.duckdb -e "show tables"

#dbt seed

# Create tables from CSV using duckcli
duckcli -D jaffle_shop.duckdb -e "
create table if not exists raw_customers as select * from read_csv_auto('data/raw_customers.csv');
create table if not exists raw_orders as select * from read_csv_auto('data/raw_orders.csv');
create table if not exists raw_payments as select * from read_csv_auto('data/raw_payments.csv');
show tables;
"


# Run dbt build (assumes dbt_project.yml exists in /app)
dbt run

exec tail -f /dev/null
