resource "google_artifact_registry_repository" "artifact_repository_service" {
  location      = var.region
  repository_id = var.artifact_repository_id
  format        = "DOCKER"
  description = "Artifact Registry for Docker images"
}