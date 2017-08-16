import argparse
import uuid

from google.cloud import bigquery

query='SELECT * FROM fccr.fccr_uae_camp_stg LIMIT 10'

client = bigquery.Client('graceful-wall-175811')
query_job = client.run_async_query(str(uuid.uuid4()), query)

query_job.use_legacy_sql = False

query_job.begin()
query_job.result()

destination_table = query_job.destination
destination_table.reload()
for row in destination_table.fetch_data():
    print(row)
