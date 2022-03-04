variable "name" {
  type        = string
  description = "Container registry name"
}

variable "description" {
  type        = string
  description = "Container registry description"
  default     = ""
}

variable "project" {
  type        = string
  description = "Project ID registry will be created in"
}

variable "location" {
  type        = string
  description = "Cloud region the registry will be located"
  default     = "europe-west3-a"
}
