# Superstore Data Engineering Project

An end-to-end data engineering project built using **dbt, Apache Airflow, DuckDB, Python, and SQL**.

## 🚀 Project Overview

The project processes the Superstore dataset through an automated data pipeline:

```text
Raw Data
   ↓
Python
   ↓
DuckDB
   ↓
dbt Transformation
   ↓
Analytics-Ready Data
```

## 🛠️ Tech Stack

* **Python** – Data processing
* **SQL** – Data transformation
* **dbt** – Data modeling & testing
* **DuckDB** – Analytical database
* **Apache Airflow** – Pipeline orchestration
* **Docker** – Environment setup

## 📌 Key Features

* ELT data pipeline
* Staging and analytics models
* Data quality tests with dbt
* Automated workflow with Airflow
* dbt documentation and lineage
* Analytics-ready datasets

## ▶️ Run the Project

```bash
dbt deps
dbt debug
dbt run
dbt test
dbt docs generate
dbt docs serve
```


