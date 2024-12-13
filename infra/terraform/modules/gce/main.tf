resource "google_compute_instance" "dos_test_instance" {
  name         = "dos-test-instance"
  machine_type = "e2-micro"
  zone         = "${var.region}-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y hping3 curl
    echo "Machine ready for DoS testing. Use hping3 to test."
  EOT

#  tags = ["dos-test"]
#  attached_disk {
#    device_name = "persistent-disk"
#    source      = google_compute_disk.persistent_disk.self_link
#  }

}

#resource "google_compute_disk" "persistent_disk" {
#  name  = "persistent-disk"
#  type  = "pd-standard"
#  zone  = "${var.region}-b"
#  size  = 10
#}