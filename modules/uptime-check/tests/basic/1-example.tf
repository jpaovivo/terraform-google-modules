locals {
  hosts_and_paths = [
    {
      name         = "example.com"
      host         = "example.com"
      health_check = true
      path         = "/"
    },
    {
      name         = "example.com/mobile/"
      host         = "example.com"
      health_check = true
      path         = "/mobile/"
    },
  ]
}

module "uptime_checks" {
  source = "../../"

  for_each = { for item in local.hosts_and_paths : item.name => item if item.health_check }

  enable_email_notifiacation    = false
  enable_slack_notifiacation    = true
  enable_opsgenie_notifications = false
  project_id                    = "my-project"
  display_name                  = each.value.name
  checker_location              = "sa-brazil-sao_paulo"
  name                          = each.value.host
  channel_name                  = "#alert-notifications"
  auth_token                    = "xoxb-xxxxxxxxx"
  http_check = {
    path = each.value.path
  }
  documentation_content = each.value.name
}
