provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

resource "google_compute_instance" "default" {
  name         = ""
  machine_type = ""
  zone         = ""

  boot_disk {
    initialize_params {
      image = ""
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}


#resource "google_cloud_run_service" "default" {
#  name     = "time-service"
#  location = var.gcp_region
#  project  = var.gcp_project
#
#  template {
#    spec {
#      containers {
#        image = "gcr.io/${var.gcp_project}/time-service:latest"
#
#        ports {
#          container_port = 8080
#        }
#
#        env {
#          name  = "PORT"
#          value = "8081"
#        }
#      }
#    }
#  }
#
#  traffics {
#    latest_revision = true
#    percent         = 100
#  }
#}