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


