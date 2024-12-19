#! /bin/bash

# Run every resource
terraform init
terraform plan
terraform apply
terraform destroy

# Modules
# Artifact Registry
# ########## 1 ########## number of resources: 1
terraform apply -target module.artifact_registry
# Cloud Run
# ########## 2 ########## number of resources: 1
terraform apply -target module.cloud_run_service
# IAM
# ########## 3 ########## number of resources: 1
terraform apply -target module.iam_member
# Load Balancer and Cloud Armor
# ########## 4 ########## number of resources: 7
terraform apply -target module.load_balancer_n_cloud_armor
# GCE
# ########## 5 ########## number of resources: 1
terraform apply -target module.gce
# Observability
# ########## 6 ########## number of resources: 2
terraform apply -target module.observability_n_alerting

# Sample Selective
terraform plan -target google_artifact_registry_repository.artifact_repository_service -target google_cloud_run_service_iam_member.all_users
terraform apply -target google_artifact_registry_repository.artifact_repository_service -target google_cloud_run_service_iam_member.all_users

# You can also save steps as file plan:
terraform plan -target google_artifact_registry_repository.artifact_repository_service -out plan "artifact_registry_plan" 
