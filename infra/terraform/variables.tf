variable "gcp_credentials_file" {
  description = "Path to the Google Cloud credentials JSON file"
  type        = string
  default     = "../../../modified-link-444013-i9-6d4e030f9f20.json"
}

variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
  default     = "modified-link-444013-i9"
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "europe-central2"
}

variable "artifact_repository_id" {
  description = "ID for the Artifact Registry repository"
  type        = string
  default     = "my-artifact-repository"
}

variable "cloud_run_service_name" {
  description = "Name for the Cloud Run service"
  type        = string
  default     = "my-cloud-run-service"
}

variable "docker_image" {
  description = "Docker image to deploy"
  type        = string
  default     = "my-docker-image:latest"
}
