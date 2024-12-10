#! /bin/bash

# List all service accounts 
gcloud iam service-accounts list --project=modified-link-444013-i9

# Add service account role
gcloud projects add-iam-policy-binding modified-link-444013-i9 \
    --member="serviceAccount:terraform-deployer@modified-link-444013-i9.iam.gserviceaccount.com" \
    --role="roles/iam.serviceAccountUser" \
    --project=modified-link-444013-i9

#
gcloud iam service-accounts add-iam-policy-binding terraform-deployer@modified-link-444013-i9.iam.gserviceaccount.com \
  --member="serviceAccount:terraform-deployer@modified-link-444013-i9.iam.gserviceaccount.com" \
  --role="roles/iam.serviceAccountUser" \
  --project=modified-link-444013-i9


gcloud projects add-iam-policy-binding modified-link-444013-i9 \
    --member="serviceAccount:terraform-deployer@modified-link-444013-i9.iam.gserviceaccount.com" \
    --role="roles/run.admin"

gcloud projects add-iam-policy-binding modified-link-444013-i9 \
    --member="serviceAccount:terraform-deployer@modified-link-444013-i9.iam.gserviceaccount.com" \
    --role="roles/iam.securityAdmin"

gcloud projects add-iam-policy-binding modified-link-444013-i9 \
    --member="serviceAccount:terraform-deployer@modified-link-444013-i9.iam.gserviceaccount.com" \
    --role="roles/iam.serviceAccountUser"


# rogowski@cloudshell:~ (modified-link-444013-i9)$ curl https://my-cloud-run-service-983609425815.europe-central2.run.app/time
# {"current_time":"Tue, 10 Dec 2024 02:52:43 UTC","server_start_time":"Tue, 10 Dec 2024 02:49:50 UTC","answer_count":2}



