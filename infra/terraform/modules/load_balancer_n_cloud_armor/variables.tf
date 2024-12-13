variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "Region for the resources"
  type        = string
}

variable "cloud_run_service_name" {
  description = "Name of the Cloud Run service"
  type        = string
  default = "my-cloud-run-service"
}

variable "backend_name" {
  description = "Name of the backend service"
  type        = string
  default     = "backend"
}

variable "url_map_name" {
  description = "Name of the URL map"
  type        = string
  default     = "cloud-run-dos-load-balancer"
}

variable "http_proxy_name" {
  description = "Name of the HTTP proxy"
  type        = string
  default     = "cloud-run-dos-load-balancer-target-proxy"
}

variable "forwarding_rule_name" {
  description = "Name of the global forwarding rule"
  type        = string
  default     = "frontend"
}

variable "neg_name" {
  description = "Name of the Network Endpoint Group"
  type        = string
  default     = "neg"
}
