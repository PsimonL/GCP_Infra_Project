variable "project_id" {
  description = "ID of the GCP project"
}

variable "region" {
  description = "Region for GCP resources"
  default     = "europe-west1"
}

variable "gcp_credentials_file" {
  description = "Path to GCP credentials JSON file"
}

variable "repository_name" {
  description = "Name of the Artifact Registry repository"
  default     = "my-docker-images"
}

variable "service_name" {
  description = "Name of the Cloud Run service"
  default     = "time-service"
}
