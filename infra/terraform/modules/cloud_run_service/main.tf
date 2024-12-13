resource "google_cloud_run_service" "cloud_run_service" {
  name     = var.cloud_run_service_name
  location = var.region

  template {
    spec {
      service_account_name = "terraform-deployer@modified-link-444013-i9.iam.gserviceaccount.com"
      containers {
        image = "${var.region}-docker.pkg.dev/${var.project_id}/${var.artifact_repository_id}/${var.docker_image}"
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

  depends_on = [var.artifact_repository_id]
}