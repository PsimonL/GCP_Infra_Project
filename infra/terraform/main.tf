provider "google" {
  credentials = file(var.gcp_credentials_file)
  project     = var.project_id
  region      = var.region
}

resource "google_artifact_registry_repository" "artifact_repository_service" {
  location      = var.region
  repository_id = var.artifact_repository_id
  format        = "DOCKER"

  description = "Artifact Registry for Docker images"
}

resource "google_cloud_run_service" "cloud_run_service" {
  name     = var.cloud_run_service_name
  location = var.region

  template {
    spec {
      service_account_name = "terraform-deployer@modified-link-444013-i9.iam.gserviceaccount.com"
      containers {
        image = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.artifact_repository_service.repository_id}/${var.docker_image}"
        ports {
          container_port = 8081
        }
        resources {
          limits = {
            memory = "512Mi"
            cpu    = "1"
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [google_artifact_registry_repository.artifact_repository_service]
}

resource "google_cloud_run_service_iam_member" "all_users" {
  service  = google_cloud_run_service.cloud_run_service.name
  location = google_cloud_run_service.cloud_run_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
