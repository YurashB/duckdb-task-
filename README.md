# Structure 
- duckdb_task
   - **.dbt**
     - profiles.yml - dbt profile
  - **data**  - dir with raw data
  - Dockerfile
  - requirements.txt
  - **models** - dbt models from github
  - **bin.sh** - script for image

# How to run the task
```bash
docker-compose up --build
```

