You can setup http and https uptime check in gcp.

# Minimum parameters
```
module "uptime_check" {

  source = "dasmeta/modules/google//modules/uptime-check"

  email_addres            = ""
  monitored_resource_host = [""]
}
```
# Maximum parameters 
```
module "uptime_check" {
  source = "dasmeta/modules/google//modules/uptime-check"
  name = ""
  timeout = ""
  http_check_path = "/"
  http_check_port = "443"
  http_check_use_ssl = true
  http_check_validate_ssl = true
  http_check_status_class = ""

  monitored_resource_type = ""
  monitored_resource_host = [""]
  alert_policy_filter = ""
  enable_email_notifiacation = true
  email_addres = ""
  enable_slack_notifiacation = false
  channel_name = ""
  auth_token = ""
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_monitoring_alert_policy.alert_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy) | resource |
| [google_monitoring_notification_channel.email](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel) | resource |
| [google_monitoring_notification_channel.slack](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel) | resource |
| [google_monitoring_uptime_check_config.https](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_uptime_check_config) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_policy_filter"></a> [alert\_policy\_filter](#input\_alert\_policy\_filter) | n/a | `string` | `""` | no |
| <a name="input_auth_token"></a> [auth\_token](#input\_auth\_token) | n/a | `string` | `""` | no |
| <a name="input_channel_name"></a> [channel\_name](#input\_channel\_name) | n/a | `string` | `""` | no |
| <a name="input_email_addres"></a> [email\_addres](#input\_email\_addres) | n/a | `string` | `""` | no |
| <a name="input_enable_email_notifiacation"></a> [enable\_email\_notifiacation](#input\_enable\_email\_notifiacation) | Email Notifications | `bool` | `true` | no |
| <a name="input_enable_slack_notifiacation"></a> [enable\_slack\_notifiacation](#input\_enable\_slack\_notifiacation) | Slack Notification | `bool` | `false` | no |
| <a name="input_http_check_path"></a> [http\_check\_path](#input\_http\_check\_path) | n/a | `string` | `"/"` | no |
| <a name="input_http_check_port"></a> [http\_check\_port](#input\_http\_check\_port) | n/a | `string` | `"443"` | no |
| <a name="input_http_check_status_class"></a> [http\_check\_status\_class](#input\_http\_check\_status\_class) | n/a | `string` | `"STATUS_CLASS_2XX"` | no |
| <a name="input_http_check_use_ssl"></a> [http\_check\_use\_ssl](#input\_http\_check\_use\_ssl) | n/a | `bool` | `true` | no |
| <a name="input_http_check_validate_ssl"></a> [http\_check\_validate\_ssl](#input\_http\_check\_validate\_ssl) | n/a | `bool` | `true` | no |
| <a name="input_monitored_resource_host"></a> [monitored\_resource\_host](#input\_monitored\_resource\_host) | n/a | `string` | `""` | no |
| <a name="input_monitored_resource_type"></a> [monitored\_resource\_type](#input\_monitored\_resource\_type) | n/a | `string` | `"uptime_url"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"https-uptime-check"` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | n/a | `string` | `"60s"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->