gcloud sql instances patch postgres --activation-policy=ALWAYS
# Wait 2 - 3 minutes for the instance to be ready
gcloud sql instances patch postgres --no-deletion-protection

gcloud sql instances delete postgres


