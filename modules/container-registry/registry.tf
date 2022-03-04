resource "google_artifact_registry_repository" "registry" {
  provider = google-beta

  location      = var.location
  repository_id = var.name
  description   = var.description
  project       = var.project
  format        = "DOCKER"
  # kms_key_name  = "kms-key"
}
