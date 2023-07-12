resource "google_monitoring_uptime_check_config" "https" {
  display_name = var.name
  timeout      = var.timeout
  period       = var.period

  http_check {
    path         = var.http_check.path
    port         = var.http_check.port
    use_ssl      = var.http_check.use_ssl
    validate_ssl = var.http_check.validate_ssl

    accepted_response_status_codes {
      status_class = var.http_check.status_class
      status_value = var.http_check.status_value
    }
  }

  monitored_resource {
    type = var.monitored_resource_type
    labels = {
      project_id = var.project_id
      host       = var.name
    }
  }
}
