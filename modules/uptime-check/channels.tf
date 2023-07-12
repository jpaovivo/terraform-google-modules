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
