### Hint for Naming Resources ###
When naming resources, use the format `bi-2023hs-[RESOURCE NAME]-[SHORT NAME]` where `**[SHORT NAME]**` is your account name and should be filled by you. Adjust the `**[RESOURCE NAME]**` accordingly based on the specific resource you're creating.

# Exercise: Connect BigQuery to Cloud SQL on Google Cloud Platform (GCP)

In this exercise, you will establish a connection between BigQuery and Cloud SQL. You'll set up a connection to Cloud SQL, grant necessary permissions, and then test your connection.

## Prerequisites

- A Google Cloud Platform account.
- A Cloud SQL instance with public IP connectivity without an authorized address. If you haven't set this up, ask your administrator or refer to Cloud SQL documentation.
- The BigQuery Connection Admin (`roles/bigquery.connectionAdmin`) IAM role granted on your project. If you don't have this permission, request it from your administrator.

## Step 1: Navigate to BigQuery

1. Open the [Google Cloud Console](https://console.cloud.google.com/).
2. Make sure you've selected the correct project from the project dropdown.
3. In the left sidebar, click on `BigQuery`.

## Step 2: Create a Cloud SQL Connection

1. In BigQuery's `Explorer pane`, click on **Add data**.
2. Choose **Connections to external data sources** from the options.
3. Fill in the required details:
   - **Connection type**: Choose the source type (e.g., MySQL or Postgres).
   - **Connection ID**: Use the format `bi-2023hs-connection-[SHORT NAME]`.
   - **Data location**: Pick a BigQuery location that's in the same region as your Cloud SQL instance.
   - **Cloud SQL instance ID**: Go to your Cloud SQL instance overview page. Here, you'll find the full name of the Cloud SQL instance in the format `project-id:location-id:instance-id`. Enter this ID.
   - **Database name**: Enter the name of the database you wish to query.
   - **Database username**: Input the username for the database.
   - **Database password**: Type in your database password.
     - To see the password, click on **Show password**.
4. Click **Create connection**.
5. Navigate to the connection by clicking **Go to connection**.
6. From the **Connection info pane**, take note of the service account ID.

## Step 3: Grant Access to the Service Account

1. In the Google Cloud Console, go to the `IAM & Admin` section.
2. Click on **Grant Access**.
3. In the **New principals** field, input the service account name "BigQuery Connection Service Agent". If you can't find the name, refer to the **Connection info pane** from Step 2 where you noted the service account ID, and paste that ID here.
4. In the role selection field, choose **Cloud SQL**, then select **Cloud SQL Client**.
5. Confirm by clicking **Save**.

This modification provides clearer instructions for students on where to find the service account details.

## Step 4: Test Your Connection

1. Go back to BigQuery.
2. Try running a query on your Cloud SQL database using the connection you just set up. You can test it with this query:
```sql
SELECT
  *
FROM
  EXTERNAL_QUERY("bi-2023hs-pect.europe-west6.postgres-bq",
    "SELECT ROUND(AVG(salesorderdetail.unitprice), 2) as SalesAverage from sales.salesorderdetail;");
```

What is the average unit price of all sales orders?
