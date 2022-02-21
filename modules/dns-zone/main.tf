

provider "google" {
  credentials = file("key.json")
}


resource "google_dns_managed_zone" "this" {
  project     = var.project_id
  name        = replace(var.name, ".", "-")
  dns_name    = var.name
  description = var.description
}
