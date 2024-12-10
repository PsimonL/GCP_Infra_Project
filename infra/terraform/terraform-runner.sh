#! /bin/bash

# Run every resource
terraform init
terraform plan
terraform apply
terraform destroy


# Selective
# ########## 1 ##########
terraform plan -target google_artifact_registry_repository.artifact_repository_service -target google_cloud_run_service_iam_member.all_users
terraform apply -target google_artifact_registry_repository.artifact_repository_service -target google_cloud_run_service_iam_member.all_users
# ########## 2 ##########


# You can also save steps as file plan:
terraform plan -target google_artifact_registry_repository.artifact_repository_service -out plan "artifact_registry_plan" 
