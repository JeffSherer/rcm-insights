import pandas as pd
import snowflake.connector as sf

def load_df(sql: str) -> pd.DataFrame:
    conn = sf.connect(
        user="YOUR_USER",
        password="YOUR_PASSWORD",
        account="YOUR_ACCOUNT",
        warehouse="YOUR_WAREHOUSE",
        database="RCM_LAB",
        schema="PUBLIC",
    )
    return pd.read_sql(sql, conn)
