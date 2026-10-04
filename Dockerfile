FROM astrocrpublic.azurecr.io/runtime:3.3-8

COPY scripts /usr/local/airflow/scripts
COPY dbt_superstore /usr/local/airflow/dbt_superstore
COPY raw_superstore.csv /usr/local/airflow/raw_superstore.csv