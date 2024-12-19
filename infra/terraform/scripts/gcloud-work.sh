#! /bin/bash

# ######################################################################################################################
# List all service accounts 
gcloud iam service-accounts list --project=modified-link-444013-i9
# ######################################################################################################################

# ######################################################################################################################
# TODOs:
gcloud projects add-iam-policy-binding modified-link-444013-i9 \
    --member="serviceAccount:terraform-deployer@modified-link-444013-i9.iam.gserviceaccount.com" \
    --role="roles/iam.serviceAccountUser" \
    --project=modified-link-444013-i9

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
# ######################################################################################################################

# ######################################################################################################################
# rogowski@cloudshell:~ (modified-link-444013-i9)$ curl -X GET "https://my-cloud-run-service-983609425815.europe-central2.run.app/time"
#rogowski@cloudshell:~ (modified-link-444013-i9)$ curl https://my-cloud-run-service-983609425815.europe-central2.run.app/time
#{"current_time":"Thu, 12 Dec 2024 22:25:48 UTC","server_start_time":"Thu, 12 Dec 2024 22:25:48 UTC","answer_count":1}
#rogowski@cloudshell:~ (modified-link-444013-i9)$ curl https://my-cloud-run-service-983609425815.europe-central2.run.app/time
#
#<html><head>
#<meta http-equiv="content-type" content="text/html;charset=utf-8">
#<title>404 Not Found</title>
#</head>
#<body text=#000000 bgcolor=#ffffff>
#<h1>Error: Not Found</h1>
#<h2>The requested URL <code>/time</code> was not found on this server.</h2>
#<h2></h2>
#</body></html>
#rogowski@cloudshell:~ (modified-link-444013-i9)$ curl https://my-cloud-run-service-983609425815.europe-central2.run.app/time
#{"current_time":"Thu, 12 Dec 2024 22:26:29 UTC","server_start_time":"Thu, 12 Dec 2024 22:25:48 UTC","answer_count":2}
#rogowski@cloudshell:~ (modified-link-444013-i9)$ curl https://my-cloud-run-service-983609425815.europe-central2.run.app/time
#
#<html><head>
#<meta http-equiv="content-type" content="text/html;charset=utf-8">
#<title>404 Not Found</title>
#</head>
#<body text=#000000 bgcolor=#ffffff>
#<h1>Error: Not Found</h1>
#<h2>The requested URL <code>/time</code> was not found on this server.</h2>
#<h2></h2>
#</body></html>
#rogowski@cloudshell:~ (modified-link-444013-i9)$
# ######################################################################################################################
#rogowski@cloudshell:~ (modified-link-444013-i9)$ curl http://34.144.242.221/time
#{"current_time":"Thu, 12 Dec 2024 23:07:45 UTC","server_start_time":"Thu, 12 Dec 2024 23:05:51 UTC","answer_count":3}
# ######################################################################################################################zl

# ######################################################################################################################
# Generate TF code based on GCP config
gcloud components install config-connector
sudo apt-get install google-cloud-sdk-config-connector
gcloud services enable cloudasset.googleapis.com
gcloud beta resource-config list-resource-types | grep "KRM KIND: ArtifactRegistry"
gcloud beta resource-config bulk-export \
  --resource-types=ArtifactRegistryRepository \
  --project=modified-link-444013-i9 \
  --resource-format=terraform

#rogowski@cloudshell:~ (modified-link-444013-i9)$ gcloud beta resource-config bulk-export   --path=/home/rogowski/output  --project=modified-link-444013-i9   --resource-format=terraform
#Exporting resource configurations to [/home/rogowski/output]...done.
#Exported 40 resource configuration(s) to [/home/rogowski/output].

#> tree /f
#Folder PATH listing for volume OS
#Volume serial number is 7E96-658C
#C:.
#├───ArtifactRegistryRepository
#│   └───europe-central2
#│           my-artifact-repository.tf
#│
#├───ComputeBackendService
#│   └───global
#│           backend.tf
#│
#├───ComputeFirewall
#│       default-allow-icmp.tf
#│       default-allow-internal.tf
#│       default-allow-rdp.tf
#│       default-allow-ssh.tf
#│
#├───ComputeForwardingRule
#│   └───global
#│           frontend.tf
#│
#├───ComputeSecurityPolicy
#│       default-security-policy-for-backend-service-backend.tf
#│
#├───ComputeTargetHTTPProxy
#│   └───global
#│           cloud-run-dos-load-balancer-target-proxy.tf
#│
#└───ComputeURLMap
#    └───global
#            cloud-run-dos-load-balancer.tf
# ######################################################################################################################