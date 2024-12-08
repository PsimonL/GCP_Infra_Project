provider "google" {
  credentials = file(var.gcp_credentials_file)
  project     = var.project_id
  region      = var.region
}

resource "google_artifact_registry_repository" "docker_repo" {
  name         = var.repository_name
  format       = "DOCKER"
  location     = var.region
  description  = "Docker Image repository for CI/CD products."
}

resource "google_cloud_run_service" "cloud_run_service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = "${google_artifact_registry_repository.docker_repo.location}-docker.pkg.dev/${var.project_id}/${var.repository_name}/${var.service_name}:latest"
      }
    }
  }

  traffics {
    percent         = 100
    latest_revision = true
  }
}

resource "google_project_iam_binding" "cloud_run_invoker" {
  project = var.project_id

  role    = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}
