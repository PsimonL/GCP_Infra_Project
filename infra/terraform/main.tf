provider "google" {
  credentials = file(var.gcp_credentials_file)
  project     = var.project_id
  region      = var.region
}

module "artifact_registry" {
  source                   = "./modules/artifact_registry"
  region                   = var.region
  artifact_repository_id   = var.artifact_repository_id
}

module "cloud_run_service" {
  source                     = "./modules/cloud_run_service"
  region                     = var.region
  cloud_run_service_name     = var.cloud_run_service_name
#  service_account_name       = "terraform-deployer@${var.project_id}.iam.gserviceaccount.com"
  artifact_repository_id     = var.artifact_repository_id
  docker_image               = var.docker_image
}

module "iam_member" {
  source                     = "./modules/iam_member"
  region                     = var.region
  cloud_run_service_name     = var.cloud_run_service_name
}

module "load_balancer_n_cloud_armor" {
  source                 = "./modules/load_balancer_n_cloud_armor"
  project_id             = var.project_id
  region                 = var.region
  cloud_run_service_name = var.cloud_run_service_name
}
