## Step 1: Replicate Data to BigQuery using Datastream

In this step, you will use Google Cloud's Datastream to replicate data from your PostgreSQL database to BigQuery.

### 1. Enable the Required APIs:

Enable the Datastream API and BigQuery API for your project in the Cloud Console.

```bash
gcloud services enable datastream.googleapis.com
gcloud services enable bigquery.googleapis.com
```

### 2. Create a Connection Profile for your PostgreSQL Instance:

Create a connection profile for your PostgreSQL instance using the Cloud Console.

- Navigate to **Datastream** > **Connection profiles** in the Cloud Console.
- Click **Create connection profile**.
- Select **PostgreSQL** as the source type.
- Fill in the connection details for your Cloud SQL instance.
- Click **Create**.

### 3. Create a Destination Connection Profile for BigQuery:

- Navigate to **Datastream** > **Connection profiles** in the Cloud Console.
- Click **Create connection profile**.
- Select **BigQuery** as the destination type.
- Fill in the connection details for your BigQuery project.
- Click **Create**.

### 4. Create a Datastream:

- Navigate to **Datastream** > **Datastreams** in the Cloud Console.
- Click **Create datastream**.
- Select the source and destination connection profiles you created earlier.
- Select the tables you want to replicate from your PostgreSQL database.
- Click **Create**.

### 5. Monitor the Data Replication:

- Navigate to **Datastream** > **Datastreams** in the Cloud Console.
- Click on the datastream you created.
- Monitor the data replication progress in the Datastream details page.

### 6. Query Data in BigQuery:

Once the data replication is complete, you can query the replicated data in BigQuery.

- Navigate to **BigQuery** in the Cloud Console.
- In the Explorer panel, navigate to your project and dataset.
- Click on a table to view its schema and details.
- Click **Query Table** to start querying the replicated data.

For more detailed instructions, refer to the [official documentation on replicating data to BigQuery using Datastream](https://cloud.google.com/datastream/docs/quickstart-replication-to-bigquery).
