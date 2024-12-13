variable "cloud_run_service_name" {
  description = "Name for the Cloud Run service"
  type        = string
  default     = "my-cloud-run-service"
}

variable "region" {
  description = "Google Cloud region"
  type        = string
  default     = "europe-central2"
}