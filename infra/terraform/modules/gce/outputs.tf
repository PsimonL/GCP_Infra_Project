output "dos_test_instance_public_ip" {
  value = google_compute_instance.dos_test_instance.network_interface[0].access_config[0].nat_ip
}