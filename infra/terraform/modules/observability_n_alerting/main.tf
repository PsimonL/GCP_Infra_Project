resource "google_monitoring_alert_policy" "lb_403_dos_alert_policy" {
  alert_strategy {
    auto_close = "604800s"

    notification_rate_limit {
      period = "300s"
    }
  }

  combiner = "OR"

  conditions {
    condition_matched_log {
      filter = "resource.type=\"http_load_balancer\"\nhttpRequest.status=403"
    }

    display_name = "Log match condition"
  }

  display_name = "403 lb (dos)"

  documentation {
    content   = "403 from Load Balancer, prolly DOS"
    mime_type = "text/markdown"
  }

  enabled               = true
  notification_channels = [google_monitoring_notification_channel.adminsr.id]
  project               = var.project_id
}


resource "google_monitoring_notification_channel" "adminsr" {
  display_name = "adminsr"
  enabled      = true

  labels = {
    email_address = "<<INSERT E-MAIL>>"
  }

  project = var.project_id
  type    = "email"
}
