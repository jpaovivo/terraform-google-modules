locals {
  hosts_and_paths = [
    {
      host         = "example.com"
      health_check = true
      path         = "/"
    },
    {
      host         = "example.com"
      health_check = true
      path         = "/mobile/"
    }
  ]
}

module "uptime_checks" {
  source = "../../"

  for_each = { for item in local.hosts_and_paths : item.host => item if item.health_check }

  enable_email_notifiacation = false
  enable_slack_notifiacation = true
  name                       = each.value.host
  channel_name               = "#gcp-alert-notifications"
  auth_token                 = "xoxb-xxxxxxxxxxxxxx"
  threshold_value            = 3
  project_id                 = "my-project"
  timeout                    = "20s"
  http_check = {
    path = each.value.path
  }
}
