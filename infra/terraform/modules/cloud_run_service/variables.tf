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

variable "cloud_run_service_name" {
  description = "Name for the Cloud Run service"
  type        = string
  default     = "my-cloud-run-service"
}

variable "docker_image" {
  description = "Docker image to deploy"
  type        = string
  default     = "time-service:1.0.0"
}

variable "artifact_repository_id" {
  description = "ID for the Artifact Registry repository"
  type        = string
  default     = "my-artifact-repository"
}