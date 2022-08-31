variable "name" {
  type    = string
  default = "https-uptime-check"
}

variable "timeout" {
  type    = string
  default = "60s"
}

variable "http_check_path" {
  type    = string
  default = "/"
}

variable "http_check_port" {
  type    = string
  default = "443"
}

variable "http_check_use_ssl" {
  type    = bool
  default = true
}

variable "http_check_validate_ssl" {
  type    = bool
  default = true
}

variable "http_check_status_class" {
  type    = string
  default = "STATUS_CLASS_2XX"
}

variable "monitored_resource_type" {
  type    = string
  default = "uptime_url"
}

variable "monitored_resource_host" {
  type    = string
  default = ""
}

variable "alert_policy_filter" {
  type    = string
  default = ""
}
# Email Notifications
variable "enable_email_notifiacation" {
  type    = bool
  default = true
}

variable "email_addres" {
  type    = string
  default = ""
}

# Slack Notification 
variable "enable_slack_notifiacation" {
  type    = bool
  default = false
}

variable "channel_name" {
  type    = string
  default = ""
}

variable "auth_token" {
  type    = string
  default = ""
}
