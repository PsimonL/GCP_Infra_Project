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
