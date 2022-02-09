terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.1.0"
    }
  }
}

provider "google" {
  credentials = file("key.json")
}
resource "google_dns_managed_zone" "pre-e-school" {
  project     = var.projectid
  name        = var.name
  dns_name    = var.dns_name
  description = "DNS zone"
}
