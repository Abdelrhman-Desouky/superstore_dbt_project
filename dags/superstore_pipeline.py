from datetime import datetime

from airflow import DAG
from airflow.providers.standard.operators.bash import BashOperator


with DAG(
    dag_id="superstore_duckdb_dbt_pipeline",
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False,
    tags=["superstore", "duckdb", "dbt"],
) as dag:

    load_superstore = BashOperator(
        task_id="load_superstore_to_duckdb",
        bash_command="cd /usr/local/airflow && python scripts/load_to_ods.py",
    )

    dbt_debug = BashOperator(
        task_id="dbt_debug",
        bash_command=(
            "cd /usr/local/airflow/dbt_superstore && "
            "mkdir -p /tmp/dbt_logs /tmp/dbt_target && "
            "DBT_LOG_PATH=/tmp/dbt_logs "
            "DBT_TARGET_PATH=/tmp/dbt_target "
            "dbt debug --profiles-dir ."
        ),
    )

    dbt_build = BashOperator(
        task_id="dbt_build",
        bash_command=(
            "cd /usr/local/airflow/dbt_superstore && "
            "mkdir -p /tmp/dbt_logs /tmp/dbt_target && "
            "DBT_LOG_PATH=/tmp/dbt_logs "
            "DBT_TARGET_PATH=/tmp/dbt_target "
            "dbt build --profiles-dir ."
        ),
    )

    load_superstore >> dbt_debug >> dbt_build