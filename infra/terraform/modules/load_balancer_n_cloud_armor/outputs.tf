output "load_balancer_ip" {
  value       = google_compute_global_address.lb_global_ip.address
  description = "IP address assigned to the global load balancer."
}


output "url_map_name" {
  value = google_compute_url_map.url_map.name
}

output "backend_service_name" {
  value = google_compute_backend_service.backend.name
}
