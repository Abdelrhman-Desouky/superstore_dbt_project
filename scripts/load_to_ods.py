from pathlib import Path
import duckdb

PROJECT_ROOT = Path(__file__).resolve().parent.parent
DB_PATH = PROJECT_ROOT / "dev.duckdb"
CSV_PATH = PROJECT_ROOT / "data" / "raw" / "raw_superstore.csv"

con = duckdb.connect(str(DB_PATH))
con.execute("CREATE SCHEMA IF NOT EXISTS ods")

csv_path = str(CSV_PATH).replace("'", "''")
con.execute(f"""
    CREATE OR REPLACE TABLE ods.raw_superstore AS
    SELECT *
    FROM read_csv_auto('{csv_path}', header = true, sample_size = -1)
""")

count = con.execute("SELECT COUNT(*) FROM ods.raw_superstore").fetchone()[0]
print(f"Loaded ods.raw_superstore: {count} rows")
con.close()
