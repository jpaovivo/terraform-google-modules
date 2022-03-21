variable "project_id" {
  type        = string
  description = "Google cloud project id"
}

variable "display_name" {
  type        = string
  description = "(Required) The user-assigned display name of the App."
}

variable "bucket_name" {
  type        = string
  description = "(Required) The name of the bucket."
}

variable "bucket_location" {
  type        = string
  description = "(Required) The GCS location."
}
