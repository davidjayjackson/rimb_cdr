
import pandas as pd
import json

# Load the JSON file into a Pandas DataFrame
file_path = '/mnt/data/call_records.json'
call_records_df = pd.read_json(file_path)

# Transpose the DataFrame to make each row a call record and each column an attribute
call_records_df = call_records_df.T

# Load the JSON file to inspect its structure
with open(file_path, 'r') as file:
    call_records_json = json.load(file)

# Display a portion of the JSON data to understand its structure
call_records_json_sample = {k: call_records_json[k] for k in list(call_records_json)[:5]}

# Reload the JSON file into a DataFrame with the correct orientation
call_records_df = pd.read_json(file_path, orient='index')

# Transpose the DataFrame to get the desired structure
call_records_df_transposed = call_records_df.T
