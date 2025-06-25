import pandas as pd
import os

def load_csvs_from_folder(folder_path):
    csv_files = [f for f in os.listdir(folder_path) if f.endswith(".csv")]
    dataframes = {}
    for file in csv_files:
        path = os.path.join(folder_path, file)
        try:
            df = pd.read_csv(path)
            dataframes[file] = df
        except Exception as e:
            print(f"Failed to load {file}: {e}")
    return dataframes
