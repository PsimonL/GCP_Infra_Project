resource "google_compute_backend_service" "backend" {
  name             = var.backend_name
  project          = var.project_id
  description      = "Internal side for Cloud Run"
  protocol         = "HTTPS"
  port_name        = "http"
  session_affinity = "NONE"
  timeout_sec      = 30
  load_balancing_scheme = "EXTERNAL_MANAGED"
  locality_lb_policy    = "ROUND_ROBIN"
  connection_draining_timeout_sec = 0

  security_policy  = google_compute_security_policy.default_security_policy.self_link

  log_config {
    enable = true
    sample_rate = 1.0
  }

  backend {
    group = google_compute_region_network_endpoint_group.neg.self_link
  }
}

resource "google_compute_url_map" "url_map" {
  name            = var.url_map_name
  project         = var.project_id
  default_service = google_compute_backend_service.backend.self_link
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = var.http_proxy_name
  project = var.project_id
  url_map = google_compute_url_map.url_map.self_link
}

resource "google_compute_global_forwarding_rule" "frontend" {
  name                  = var.forwarding_rule_name
  project               = var.project_id
  ip_protocol           = "TCP"
#  ip_version            = "IPV4"
#  ip_address            = "34.116.142.203"
  ip_address            = google_compute_global_address.lb_global_ip.address
  port_range            = "80-80"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  target                = google_compute_target_http_proxy.http_proxy.self_link
}

resource "google_compute_global_address" "lb_global_ip" {
  name         = "global-load-balancer-ip"
  project      = var.project_id
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}

resource "google_compute_security_policy" "default_security_policy" {
  description = "Default security policy for: backend"
  name        = "default-security-policy-for-backend-service-backend"
  project     = var.project_id

  rule {
    action = "allow"
    match {
      config {
        src_ip_ranges = ["*"]
      }
      versioned_expr = "SRC_IPS_V1"
    }
    priority = 2147483647
  }

  rule {
    action      = "throttle"
    description = "Default rate limiting rule"
    match {
      config {
        src_ip_ranges = ["*"]
      }
      versioned_expr = "SRC_IPS_V1"
    }
    priority = 2147483646

    rate_limit_options {
      conform_action = "allow"
      enforce_on_key = "IP"
      exceed_action  = "deny(403)"

      rate_limit_threshold {
        count        = 25
        interval_sec = 60
      }
    }
  }
  type = "CLOUD_ARMOR"
}

resource "google_compute_region_network_endpoint_group" "neg" {
  name                  = var.neg_name
  project               = var.project_id
  region                = var.region
  network_endpoint_type = "SERVERLESS"
  cloud_run {
    service = var.cloud_run_service_name
  }
}
