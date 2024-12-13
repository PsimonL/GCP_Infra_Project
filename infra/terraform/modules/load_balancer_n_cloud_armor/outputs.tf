output "load_balancer_ip" {
  value = google_compute_address.lb_ip.address
}

output "url_map_name" {
  value = google_compute_url_map.url_map.name
}

output "backend_service_name" {
  value = google_compute_backend_service.backend.name
}
