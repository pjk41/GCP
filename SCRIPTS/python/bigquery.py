import argparse
import uuid

from google.cloud import bigquery

query='SELECT year FROM mydataset.mytable'

client = bigquery.Client('pivotal-mode-175812')
query_job = client.run_async_query(str(uuid.uuid4()), query)

query_job.use_legacy_sql = False

query_job.begin()
query_job.result()

destination_table = query_job.destination
destination_table.reload()
for row in destination_table.fetch_data():
    print(row)