locals {
  notification_channels_email = var.enable_email_notifiacation ? [google_monitoring_notification_channel.email[0].id] : []
  notification_channels_slack = var.enable_slack_notifiacation ? [google_monitoring_notification_channel.slack[0].id] : []
  all_notification_channels   = concat(local.notification_channels_email, local.notification_channels_slack)
}

resource "google_monitoring_uptime_check_config" "https" {
  display_name = var.name
  timeout      = var.timeout

  http_check {
    path         = var.http_check_path
    port         = var.http_check_port
    use_ssl      = var.http_check_use_ssl
    validate_ssl = var.http_check_validate_ssl
    accepted_response_status_codes {
      status_class = var.http_check_status_class
      status_value = 0
    }
  }

  monitored_resource {
    type = var.monitored_resource_type
    labels = {
      host = var.monitored_resource_host
    }
  }
}

data "google_project" "project" {
}

resource "google_monitoring_alert_policy" "alert_policy" {
  project      = data.google_project.project.number
  display_name = var.name
  combiner     = "OR"
  conditions {
    display_name = var.name
    condition_threshold {
      filter     = var.alert_policy_filter == "" ? "resource.type = \"uptime_url\" AND metric.type = \"monitoring.googleapis.com/uptime_check/check_passed\" AND metric.labels.check_id = \"${google_monitoring_uptime_check_config.https.uptime_check_id}\"" : var.alert_policy_filter
      duration   = var.timeout
      comparison = "COMPARISON_GT"
      aggregations {
        alignment_period   = "300s"
        group_by_fields    = []
        per_series_aligner = "ALIGN_COUNT_TRUE"
      }

      trigger {
        count   = 1
        percent = 0
      }
    }
  }
  notification_channels = local.all_notification_channels
}

resource "google_monitoring_notification_channel" "email" {
  count = var.enable_email_notifiacation ? 1 : 0

  display_name = "${var.name} Email Channel"
  type         = "email"

  labels = {
    email_address = var.email_addres
  }
}

resource "google_monitoring_notification_channel" "slack" {
  count = var.enable_slack_notifiacation ? 1 : 0

  display_name = "${var.name} Slack Channel"
  type         = "slack"
  labels = {
    "channel_name" = var.channel_name
  }
  sensitive_labels {
    auth_token = var.auth_token
  }
}
