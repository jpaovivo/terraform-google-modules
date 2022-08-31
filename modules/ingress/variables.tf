variable "host" {
  type    = string
  default = ""
}

variable "paths" {
  type = list(any)
  default = [
    {
      path         = "/",
      service_name = "nginx",
      service_port = "80"
    }
  ]
}

variable "annotations" {
  type    = map(any)
  default = {}
}
