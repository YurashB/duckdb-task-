FROM xemuliam/dbt:duckdb

COPY . /app
COPY profiles.yml /root/.dbt/

WORKDIR /app

RUN pip install duckcli
RUN chmod +x bin.sh

CMD ["./bin.sh"]

