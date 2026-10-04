from datetime import datetime
from pathlib import Path
from airflow import DAG
from airflow.operators.bash import BashOperator

PROJECT_ROOT = Path(__file__).resolve().parents[2]
DBT_DIR = PROJECT_ROOT / "dbt_superstore"
LOAD_SCRIPT = PROJECT_ROOT / "scripts" / "load_to_ods.py"

with DAG(
    dag_id="superstore_duckdb_dbt",
    description="Load Superstore Excel into DuckDB and build dbt models",
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False,
    tags=["superstore", "duckdb", "dbt"],
) as dag:

    load_ods = BashOperator(
        task_id="load_excel_to_duckdb_ods",
        bash_command=f"python '{LOAD_SCRIPT}'",
    )

    dbt_build = BashOperator(
        task_id="dbt_build",
        bash_command=f"cd '{DBT_DIR}' && dbt build --profiles-dir .",
    )

    load_ods >> dbt_build
