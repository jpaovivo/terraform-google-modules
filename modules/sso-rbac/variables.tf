variable "cluster_name" {
  type = string
}

variable "cluster_location" {
  type = string
}

variable "bindings" {
  type = list(object({
    group     = string
    namespace = string
    roles     = list(string)
  }))
}

variable "roles" {
  type = list(object({
    actions   = list(string)
    resources = list(string)

  }))
}
