### Hint for Naming Resources ###
When naming resources, use the format `bi-2023hs-[RESOURCE NAME]-[SHORT NAME]` where `**[SHORT NAME]**` is your account name and should be filled by you. Adjust the `**[RESOURCE NAME]**` accordingly based on the specific resource you're creating.

# Exercise: Data Replication to Google Cloud Platform (GCP)

In this exercise, you will replicate a PostgreSQL database to the Google Cloud Platform. You will create a project, create a storage bucket, upload a database dump to that bucket, create a Cloud SQL instance, and then import the dump into Cloud SQL.

## Prerequisites

- A Google Cloud Platform account.

## Step 1: Create a GCP Project

1. Navigate to the [Google Cloud Console](https://console.cloud.google.com/).
2. Click on the project drop-down and select `New Project`.
3. Enter a project name `bi-2023hs-proj-[SHORT NAME]` and select a billing account.
4. Click `Create` to create your new project.
5. Once the project is created, ensure you select the project from the project dropdown so you are working within the correct project.

6. For more detailed instructions, refer to the [official documentation](https://cloud.google.com/resource-manager/docs/creating-managing-projects).

## Step 2: Create a Storage Bucket

1. In the Cloud Console, navigate to `Storage` > `Browser`.
2. Click `Create Bucket`.
3. Enter `bi-2023hs-bucket-[SHORT NAME]` as name for your bucket, and choose Zurich as location.
4. Click `Create` to create your new bucket.
5. For more detailed instructions, refer to the [official documentation on creating buckets](https://cloud.google.com/storage/docs/creating-buckets).

## Step 3: Upload the Database Dump

1. Download the dump of your PostgreSQL database from Moodle.
2. In the Cloud Console, navigate to `Cloud Storage` > `Buckets`.
3. Click on the name of the bucket you created in Step 2.
4. Click `Upload files`, navigate to the location of your database dump on your machine, select the file, and click `Open` to upload the dump to your bucket.
5. Alternatively, you can use the `gsutil cp` command to upload the dump to your bucket:
   ```bash
   gsutil cp /path/to/your/database.dump gs://your-bucket-name
   ```
6. For more detailed instructions, refer to the [official documentation on uploading objects](https://cloud.google.com/storage/docs/uploading-objects).

## Step 4: Create a Cloud SQL Instance

1. In the Cloud Console, navigate to `SQL` > `Instances`.
2. Click `Create instance`.
3. Select the `PostgreSQL` option and click `Next`.
4. In the "Instance ID" field, enter `postgres`.
5. In the "Password" field, enter a password for the `postgres` user.
6. Select `PostgreSQL 15` as database version.
7. Select `Enterprise` as Cloud SQL Edition.
8. Select `Sandbox` as preset for the edition.
9. Select `Single Zone` and `Zurich (europe-west6)` as region and zone.
10. Click `Create` to create the instance. This may take 5 to 10 minutes.
11. Once the instance is created, you will be redirected to the "Instance details" page.
12. In the Cloud Console, navigate to SQL > Databases.
13. Click on the name of your SQL instance.
14. In the Databases tab, click Create Database.
15. Enter `adventureworks` as the database name.
16. Click Create.
17. For more detailed instructions, refer to the [official documentation on creating a Cloud SQL instance](https://cloud.google.com/sql/docs/postgres/create-instance).

## Step 5: Import the Database Dump

1. In the "Instance details" page, click on the `Import` button in the button bar at the top.
2. In the "Import database" dialog that appears, click on the `Browse` button.
3. Select the `Cloud Storage` option, and then navigate to the bucket and the database dump file you uploaded earlier.
4. Select the file and click `Select`.
5. Select `adventureworks` as the database name.
6. Click `Import` to start the import process. This may take some time depending on the size of the database dump.
7. Once the import is completed, you will see a notification in the Cloud Console.
8. For more detailed instructions, refer to the [official documentation on importing and exporting SQL data](https://cloud.google.com/sql/docs/postgres/import-export/import-export-sql).

## Step 6: Connect to the Cloud SQL Instance

1. Make sure your Cloud SQL instance has a public IP address as Cloud Shell doesn't work with a private IP address.
2. In the Google Cloud console, click the Cloud Shell icon ![Cloud Shell](./Lesson_02/images/cloud-shell-icon.png "Cloud Shell") in the upper right corner.
3. When Cloud Shell finishes initializing, a message will appear with a prompt similar to `username@sample-project:~ (sample-project)$`.
4. If your Cloud Shell session is set to a different project, change it to the project where your Cloud SQL instance is located using the following command:
   ```bash
   gcloud config set project [PROJECT_ID]
   ```
   Replace `[PROJECT_ID]` with your project ID.
5. At the Cloud Shell prompt, connect to your Cloud SQL instance using the following command:
   ```bash
   gcloud sql connect postgres --user=postgres
   ```
   Replace `your-instance-id` with the Instance ID you set earlier.
6. Click `Authorize` in the message box that appears to authorize Cloud Shell to make API calls.
7. A message will indicate that your IP is being allowlisted for incoming connections, after which you will be prompted to enter your password.
8. Enter the password you set for the `postgres` user during the instance creation process.
9. Once connected, switch to the `adventureworks` database by executing the following command:
   ```bash
   \c adventureworks
   ```
10. You are now connected to the `adventureworks` database in your Cloud SQL instance.
11. For more detailed instructions, refer to the [official documentation on connecting to a Cloud SQL instance using Cloud Shell](https://cloud.google.com/sql/docs/postgres/connect-instance-cloud-shell).

